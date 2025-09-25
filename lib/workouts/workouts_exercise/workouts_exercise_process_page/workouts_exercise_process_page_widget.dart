import 'dart:async';

import 'package:boom_client/workouts/workouts_exercise/workouts_exercise_complete_view/workouts_exercise_complete_view_widget.dart';
import 'package:chewie/chewie.dart';
import 'package:collection/collection.dart';
import 'package:video_player/video_player.dart';

import '../../../backend/supabase/database/tables/exercise.dart';
import '../../../backend/supabase/database/tables/training_program.dart';
import '../../workouts_page/workouts_page_widget.dart';
import '../workouts_exercise_process_pause_view/workouts_exercise_process_pause_view_widget.dart';
import '/components/general_button_widget.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'workouts_exercise_process_page_model.dart';
export 'workouts_exercise_process_page_model.dart';

class WorkoutsExerciseProcessPageWidget extends StatefulWidget {
  const WorkoutsExerciseProcessPageWidget({
    super.key,
    required this.exercises,
    required this.program,
    this.day,
  });

  final List<ExerciseRow>? exercises;
  final TrainingProgramRow? program;
  final String? day;

  static String routeName = 'WorkoutsExerciseProcessPage';
  static String routePath = '/workoutsExerciseProcessPage';

  @override
  State<WorkoutsExerciseProcessPageWidget> createState() => _WorkoutsExerciseProcessPageWidgetState();
}

class _WorkoutsExerciseProcessPageWidgetState extends State<WorkoutsExerciseProcessPageWidget> {
  int _currentIndex = 0;

  // Stopwatch and tracking variables
  late Stopwatch _stopwatch;
  final Set<int> _visitedExerciseIndexes = {};
  int get _completedExercisesCount => _visitedExerciseIndexes.length;

  ExerciseRow? get currentExercise => (widget.exercises?.isNotEmpty ?? false) ? widget.exercises![_currentIndex] : null;
  late WorkoutsExerciseProcessPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late VideoPlayerController _videoController;
  ChewieController? _chewieController;
  bool _isInitialized = false;
  double _videoAspectRatio = 16 / 9;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsExerciseProcessPageModel());

    _stopwatch = Stopwatch()..start();
    _visitedExerciseIndexes.add(_currentIndex);
    _initializePlayer();
  }

  Future<void> onNextExercise() async {
    final allExercices = widget.exercises ?? [];
    if (_currentIndex < (allExercices.length - 1)) {
      setState(() {
        _currentIndex++;
        _visitedExerciseIndexes.add(_currentIndex);
        _isInitialized = false;
      });
      await _reInitializePlayer();
    } else if (_currentIndex == (allExercices.length - 1)) {
      _onCompleteProgram();
    }
  }

  Future<void> onPreviousExercise() async {
    // final allExercices = widget.exercises ?? [];
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      await _reInitializePlayer();
    }
  }

  Future<void> _onCompleteProgram() async {
    final estimatedCalories = (_completedExercisesCount * 6.0).round();

    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: const Color(0x23000000),
      enableDrag: false,
      context: context,
      builder: (context1) {
        return Padding(
          padding: MediaQuery.viewInsetsOf(context1),
          child: WorkoutsExerciseCompleteViewWidget(
            calories: "$estimatedCalories ккал",
            time:
                "${_stopwatch.elapsed.inMinutes.remainder(60).toString().padLeft(2, '0')}:${_stopwatch.elapsed.inSeconds.remainder(60).toString().padLeft(2, '0')}",
            rounds: "$_completedExercisesCount/${widget.exercises?.length}",
          ),
        );
      },
    );

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  Future<void> _initializePlayer() async {
    if (currentExercise?.video == null) return;
    _videoController = VideoPlayerController.networkUrl(Uri.parse(currentExercise!.video!));

    await _videoController.initialize().then((_) {
      final size = _videoController.value.size;

      if (size.width > 0 && size.height > 0) {
        _videoAspectRatio = size.width / size.height;
      }
      setState(() {
        _isInitialized = true;
        _chewieController = ChewieController(
          videoPlayerController: _videoController,
          aspectRatio: _videoAspectRatio,
          autoPlay: false,
          looping: false,
          showControls: false,
          allowFullScreen: true,
          allowPlaybackSpeedChanging: false,
        );
      });
    });

    _videoController.addListener(() {
      setState(() {
        _isPlaying = _videoController.value.isPlaying;
      });
    });
  }

  Future<void> _reInitializePlayer() async {
    _videoController.pause();
    _videoController.dispose();
    _chewieController?.dispose();
    await _initializePlayer();
  }

  void togglePlayPause() {
    if (_videoController.value.isPlaying) {
      _videoController.pause();
    } else {
      _videoController.play();
    }
  }

  @override
  void dispose() {
    _model.dispose();
    _stopwatch.stop();
    _videoController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late String cardName;
    final dayMap = widget.day == null ? null : jsonDecode(widget.day!);
    if (dayMap != null) {
      final int dayNumber = dayMap['day_number'] ?? 1;
      final String dayName = dayMap['name'] ?? '';
      cardName = dayName.trim().isEmpty ? getDayName(dayNumber) : dayName;
    } else {
      cardName = 'Тренировка';
    }
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.generalNavBar01Model,
                updateCallback: () => safeSetState(() {}),
                child: GeneralNavBar01Widget(
                  title: cardName,
                  hideBack: false,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        currentExercise?.name ?? '-',
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              font: GoogleFonts.unbounded(
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '${_currentIndex + 1} из ${widget.exercises?.length ?? 0}',
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                              color: FlutterFlowTheme.of(context).secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (currentExercise?.video != null)
                                _CustomVideoPlayer(
                                  chewieController: _chewieController,
                                  videoPlayerController: _videoController,
                                  videoAspectRatio: _videoAspectRatio,
                                  isInitialized: _isInitialized,
                                  width: MediaQuery.sizeOf(context).width,
                                  onNextExercise: onNextExercise,
                                  onPreviousExercise: onPreviousExercise,
                                  togglePlayPause: togglePlayPause,
                                  isPlaying: _isPlaying,
                                  trainName: currentExercise?.name ?? '-',
                                  canNext: (_currentIndex < ((widget.exercises ?? []).length - 1)),
                                ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    // context.safePop();
                                    var res = await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: const Color(0x23000000),
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: MediaQuery.viewInsetsOf(context),
                                          child: const WorkoutsExerciseProcessPauseViewWidget(),
                                        );
                                      },
                                    );

                                    if (res != null) {
                                      //MARK: Complete workout
                                      // if (widget.exercises != null && widget.exercises!.isNotEmpty) {
                                      // final supabase = AppSupabase.instance.client;
                                      // final userId = currentUserUid;

                                      // final durationSeconds = _stopwatch.elapsed.inSeconds;
                                      // final completedExercises =
                                      //     _visitedExerciseIndexes.map((index) => widget.exercises![index]).toList();
                                      // final estimatedCalories =
                                      //     (_completedExercisesCount * 6.0).round(); // ~6 ккал за упражнение

                                      // final workoutInsert = await supabase
                                      //     .from('user_workout_result')
                                      //     .insert({
                                      //       'user_id': userId,
                                      //       'completed_at': DateTime.now().toIso8601String(),
                                      //       'program_id': widget.program?.id,
                                      //       'duration_seconds': durationSeconds,
                                      //       'calories_burned': estimatedCalories,
                                      //     })
                                      //     .select()
                                      //     .single();
                                      //
                                      // final workoutResultId = workoutInsert['id'];
                                      //
                                      // for (final exercise in completedExercises) {
                                      //   await supabase.from('user_workout_exercise').insert({
                                      //     'workout_result_id': workoutResultId,
                                      //     'exercise_id': exercise.id,
                                      //   });
                                      // }

                                      await _onCompleteProgram();

                                      print("Workout completed and saved!");
                                      // }
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                      borderRadius: BorderRadius.circular(100.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context).secondary,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(0.0),
                                            child: SvgPicture.asset(
                                              'assets/images/Pause_Circle10.svg',
                                              width: 20.0,
                                              height: 20.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              'Приостановить тренировку',
                                              maxLines: 1,
                                              minFontSize: 5.0,
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.unbounded(
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Builder(builder: (context) {
                          int approach = 0;
                          int repetitions = 0;
                          int weight = 0;
                          final diffId = widget.program?.difficulty;

                          if (widget.day != null) {
                            final day = jsonDecode(widget.day!);
                            final exerciseMap = (day['exercises'] as List)
                                .firstWhereOrNull((e) => e['exercise_id'] == currentExercise?.id);

                            approach = exerciseMap?['approach'];
                            repetitions = exerciseMap?['repetitions'];
                            weight = exerciseMap?['weight'];
                          } else {
                            final difficulty = currentExercise?.difficulty;
                            final currentDifficult = difficulty?.firstWhereOrNull((d) => d['id'] == diffId);
                            if (currentDifficult != null) {
                              approach = currentDifficult?['approach'];
                              repetitions = currentDifficult?['repetitions'];
                              weight = currentDifficult?['weight'];
                            }
                          }
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: const Color(0xFF302E36),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            approach.toString(),
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.unbounded(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              'Подхода',
                                              maxLines: 1,
                                              minFontSize: 1.0,
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: const Color(0xFF302E36),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            repetitions.toString(),
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.unbounded(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              'Повторений',
                                              maxLines: 1,
                                              minFontSize: 1.0,
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: const Color(0xFF302E36),
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            weight.toString(),
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.unbounded(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              'Вес (кг)',
                                              maxLines: 1,
                                              minFontSize: 1.0,
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 8.0)),
                            ),
                          );
                        }),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                          child: Text(
                            currentExercise?.description ?? '-',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: wrapWithModel(
                        model: _model.generalButtonModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: GeneralButtonWidget(
                          title: 'Назад',
                          isActive: _currentIndex > 0,
                          textColor: FlutterFlowTheme.of(context).secondaryText,
                          backbgoundColor: Colors.transparent,
                          borderColor: _currentIndex > 0
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).secondary,
                          onTap: onPreviousExercise,
                        ),
                      ),
                    ),
                    Expanded(
                      child: wrapWithModel(
                        model: _model.generalButtonModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: GeneralButtonWidget(
                          title: 'Следующее',
                          isActive: true,
                          onTap: onNextExercise,
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(width: 9.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomVideoPlayer extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final ChewieController? chewieController;
  final double videoAspectRatio;
  final double? width;
  final String trainName;
  final Future Function() onNextExercise;
  final Future Function() onPreviousExercise;
  final VoidCallback togglePlayPause;
  final bool isInitialized;
  final bool isPlaying;
  final bool canNext;

  const _CustomVideoPlayer({
    Key? key,
    required this.videoPlayerController,
    required this.chewieController,
    this.width,
    required this.trainName,
    required this.onNextExercise,
    required this.videoAspectRatio,
    this.isInitialized = false,
    required this.togglePlayPause,
    this.isPlaying = false,
    required this.onPreviousExercise,
    this.canNext = true,
  }) : super(key: key);

  @override
  State<_CustomVideoPlayer> createState() => __CustomVideoPlayerState();
}

enum VideoDisplayMode { square, fullWidth }

class __CustomVideoPlayerState extends State<_CustomVideoPlayer> {
  OverlayEntry? _overlayEntry;
  bool _isFullScreen = false;
  double _volumeBeforeMute = 1.0;
  bool _isMuted = false;

  @override
  void initState() {
    _isMuted = widget.videoPlayerController.value.volume == 0.0;
    super.initState();
  }

  void _enterFullScreen() {
    setState(() {
      _isFullScreen = true;
    });

    _overlayEntry = OverlayEntry(
      builder: (context) => _FullScreenVideoPlayer(
        videoController: widget.videoPlayerController,
        chewieController: widget.chewieController!,
        videoAspectRatio: widget.videoAspectRatio,
        onExit: _exitFullScreen,
        onPlayPause: widget.togglePlayPause,
        onToogleRepeat: _onToogleRepeat,
        onNext: onNext,
        onPrevius: onPrevious,
        onToogleMute: _onToogleMute,
        trainName: widget.trainName,
        isInitialized: widget.isInitialized,
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _exitFullScreen() {
    _overlayEntry?.remove();
    _overlayEntry = null;

    if (mounted) {
      setState(() {
        _isFullScreen = false;
      });
    }
  }

  void _toggleFullScreen() {
    if (_isFullScreen) {
      _exitFullScreen();
    } else {
      _enterFullScreen();
    }
  }

  void _onToogleRepeat() {
    setState(() {
      widget.videoPlayerController.setLooping(!widget.videoPlayerController.value.isLooping);
    });
  }

  void _onToogleMute() {
    if (_isMuted) {
      widget.videoPlayerController.setVolume(_volumeBeforeMute);
      setState(() {
        _isMuted = false;
      });
    } else {
      _volumeBeforeMute = widget.videoPlayerController.value.volume;
      widget.videoPlayerController.setVolume(0);
      setState(() {
        _isMuted = true;
      });
    }
  }

  void onPrevious() async {
    await widget.onPreviousExercise();

    if (mounted) {
      Future.delayed(const Duration(seconds: 1), () => _overlayEntry?.markNeedsBuild());
    }
  }

  void onNext() async {
    if (widget.canNext) {
      await widget.onNextExercise();

      if (mounted) {
        Future.delayed(const Duration(seconds: 1), () => _overlayEntry?.markNeedsBuild());
      }
    } else {
      _exitFullScreen();
      widget.onNextExercise();
    }
  }

  double get width =>
      widget.width == null || widget.width! >= double.infinity ? MediaQuery.sizeOf(context).width : widget.width!;

  @override
  Widget build(BuildContext context) {
    print('Custom build: ${widget.isInitialized}');
    if (!widget.isInitialized || widget.chewieController == null) {
      return SizedBox(
        height: width,
        width: width,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: const Color(0xFF242328),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Chewie(controller: widget.chewieController!),
                ),
                _buildControlButtons(),
                _buildModeToggleButton(),
              ],
            ),
            _buildProgressBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return StreamBuilder<Duration?>(
      stream: widget.videoPlayerController.position.asStream(),
      builder: (context, snapshot) {
        final position = snapshot.data ?? Duration.zero;
        final duration = widget.videoPlayerController.value.duration;

        return Column(
          children: [
            const SizedBox(height: 6),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 10.0,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0.0),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 12.0),
              ),
              child: Slider(
                value: position.inMilliseconds.toDouble(),
                max: duration.inMilliseconds.toDouble(),
                onChanged: (value) {
                  widget.videoPlayerController.seekTo(Duration(milliseconds: value.toInt()));
                },
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                thumbColor: const Color(0xFF302E36),
                activeColor: FlutterFlowTheme.of(context).primary,
                inactiveColor: const Color(0xFF302E36),
              ),
            ),

            // Время
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatDuration(position),
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Text(
                    _formatDuration(duration),
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildControlButtons() {
    return Align(
      alignment: Alignment.center,
      child: IconButton(
        onPressed: widget.togglePlayPause,
        icon: SvgPicture.asset(
          'assets/images/${widget.isPlaying ? 'pause' : 'play'}.svg',
          width: 64,
          height: 64,
        ),
        iconSize: 64,
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  Widget _buildModeToggleButton() {
    return Positioned(
      left: 10,
      top: 10,
      child: IconButton(
        onPressed: _toggleFullScreen,
        iconSize: 40,
        icon: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: const Color(0xFF1A191D),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/images/minimize.svg',
                  fit: BoxFit.contain,
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FullScreenVideoPlayer extends StatefulWidget {
  final VideoPlayerController videoController;
  final ChewieController? chewieController;
  final double videoAspectRatio;
  final VoidCallback onExit;
  final VoidCallback onPlayPause;
  final VoidCallback onToogleRepeat;
  final VoidCallback onPrevius;
  final VoidCallback onNext;
  final VoidCallback onToogleMute;
  final String trainName;
  final bool isInitialized;

  const _FullScreenVideoPlayer({
    required this.videoController,
    required this.chewieController,
    required this.videoAspectRatio,
    required this.onExit,
    required this.onPlayPause,
    required this.trainName,
    required this.onToogleRepeat,
    required this.onPrevius,
    required this.onNext,
    required this.onToogleMute,
    required this.isInitialized,
  });

  @override
  State<_FullScreenVideoPlayer> createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<_FullScreenVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    print('_FullScreenVideoPlayer build: ${widget.isInitialized}');

    return Material(
      color: const Color(0xFF242328),
      child: SafeArea(
        child: Stack(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: widget.videoAspectRatio,
                child: widget.isInitialized
                    ? Chewie(controller: widget.chewieController!)
                    : const Center(child: CircularProgressIndicator()),
              ),
            ),

            Positioned(
              top: 30,
              left: 16,
              right: 0,
              child: Row(
                children: [
                  IconButton(
                    onPressed: widget.onExit,
                    iconSize: 40,
                    icon: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: const Color(0xFF1A191D),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              'assets/images/minimize.svg',
                              fit: BoxFit.contain,
                              height: 24,
                              width: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Нижняя панель с прогресс баром
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Colors.transparent,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: _buildProgressBar(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return ValueListenableBuilder<VideoPlayerValue>(
      valueListenable: widget.videoController,
      builder: (context, value, child) {
        final position = value.position;
        final duration = value.duration;
        final isPlaying = value.isPlaying;
        final isRepeat = value.isLooping;
        final isMuted = value.volume == 0;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.trainName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.unbounded(
                      fontWeight: FontWeight.w700,
                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: Colors.white,
                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            const SizedBox(height: 6),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 10.0,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0.0),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 12.0),
              ),
              child: Slider(
                value: position.inMilliseconds.toDouble(),
                max: duration.inMilliseconds.toDouble(),
                onChanged: (value) {
                  // final newPosition = duration * value;
                  // widget.videoController.seekTo(newPosition);
                  widget.videoController.seekTo(Duration(milliseconds: value.toInt()));
                },
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                thumbColor: const Color(0xFF302E36),
                activeColor: FlutterFlowTheme.of(context).primary,
                inactiveColor: const Color(0xFF302E36),
              ),
            ),

            // Время
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formatDuration(position),
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  Text(
                    _formatDuration(duration),
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: widget.onToogleRepeat,
                  icon: SvgPicture.asset('assets/images/${isRepeat ? 'Repeat' : 'no_repeat'}.svg'),
                  iconSize: 24,
                ),
                IconButton(
                  onPressed: widget.onPrevius,
                  icon: SvgPicture.asset('assets/images/left_arrow.svg'),
                  iconSize: 24,
                ),
                IconButton(
                  onPressed: widget.onPlayPause,
                  icon: SvgPicture.asset(
                    'assets/images/${!isPlaying ? 'play' : 'pause'}.svg',
                    width: 60,
                    height: 60,
                  ),
                  iconSize: 60,
                ),
                IconButton(
                  onPressed: widget.onNext,
                  icon: SvgPicture.asset('assets/images/right_arrow.svg'),
                  iconSize: 24,
                ),
                IconButton(
                  onPressed: widget.onToogleMute,
                  icon: SvgPicture.asset('assets/images/${isMuted ? 'Muted' : 'Volume_Loud'}.svg'),
                  iconSize: 24,
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
