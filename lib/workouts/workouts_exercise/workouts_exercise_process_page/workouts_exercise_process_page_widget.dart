import 'package:boom_client/auth/firebase_auth/auth_util.dart';
import 'package:boom_client/workouts/workouts_exercise/workouts_exercise_complete_view/workouts_exercise_complete_view_widget.dart';

import '../../../backend/supabase/database/tables/exercise.dart';
import '../../../backend/supabase/database/tables/training_program.dart';
import '../../../backend/supabase/supabase.dart';
import '../workouts_exercise_process_pause_view/workouts_exercise_process_pause_view_widget.dart';
import '/components/general_button_widget.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'workouts_exercise_process_page_model.dart';
export 'workouts_exercise_process_page_model.dart';

class WorkoutsExerciseProcessPageWidget extends StatefulWidget {
  const WorkoutsExerciseProcessPageWidget({
    super.key,
    required this.exercises,
    required this.program,
  });

  final List<ExerciseRow>? exercises;
  final TrainingProgramRow? program;

  static String routeName = 'WorkoutsExerciseProcessPage';
  static String routePath = '/workoutsExerciseProcessPage';

  @override
  State<WorkoutsExerciseProcessPageWidget> createState() =>
      _WorkoutsExerciseProcessPageWidgetState();
}

class _WorkoutsExerciseProcessPageWidgetState extends State<WorkoutsExerciseProcessPageWidget> {
  int _currentIndex = 0;

  // Stopwatch and tracking variables
  late Stopwatch _stopwatch;
  Set<int> _visitedExerciseIndexes = {};
  int get _completedExercisesCount => _visitedExerciseIndexes.length;

  ExerciseRow? get currentExercise =>
      (widget.exercises != null && widget.exercises!.isNotEmpty)
          ? widget.exercises![_currentIndex]
          : null;
  late WorkoutsExerciseProcessPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsExerciseProcessPageModel());

    _stopwatch = Stopwatch()..start();
    _visitedExerciseIndexes.add(_currentIndex);

  }

  @override
  void dispose() {
    _model.dispose();
    _stopwatch.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  title: widget.program?.name ?? "-",
                  hideBack: false,
                ),
              ),
              // Stopwatch and completed exercises display
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Text(
              //     'Прошло секунд: ${_stopwatch.elapsed.inSeconds}, Выполнено упражнений: $_completedExercisesCount',
              //     style: FlutterFlowTheme.of(context).bodyMedium,
              //   ),
              // ),
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
                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                child: Container(
                                  height: 400.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: FlutterFlowVideoPlayer(
                                    path: currentExercise?.video ?? '',
                                    videoType: VideoType.network,
                                    width: double.infinity,
                                    height: 400.0,
                                    autoPlay: false,
                                    looping: true,
                                    showControls: true,
                                    allowFullScreen: true,
                                    allowPlaybackSpeedMenu: false,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                                      barrierColor: Color(0x23000000),
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding: MediaQuery.viewInsetsOf(context),
                                          child: WorkoutsExerciseProcessPauseViewWidget(),
                                        );
                                      },
                                    );

                                    if (res != null) {
                                      //MARK: Complete workout
                                      if (widget.exercises != null && widget.exercises!.isNotEmpty) {
                                        final supabase = AppSupabase.instance.client;
                                        final userId = currentUserUid;

                                        final durationSeconds = _stopwatch.elapsed.inSeconds;
                                        final completedExercises = _visitedExerciseIndexes
                                            .map((index) => widget.exercises![index])
                                            .toList();
                                        final estimatedCalories = (_completedExercisesCount * 6.0).round(); // ~6 ккал за упражнение

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

                                        var res = await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor: Color(0x23000000),
                                          enableDrag: false,
                                          context: context,
                                          builder: (context1) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(context1),
                                              child: WorkoutsExerciseCompleteViewWidget(
                                                calories: "${estimatedCalories} ккал",
                                                time: "${_stopwatch.elapsed.inMinutes.remainder(60).toString().padLeft(2, '0')}:${_stopwatch.elapsed.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                                                rounds: "${_completedExercisesCount}/${widget.exercises?.length}",
                                              ),
                                            );
                                          },
                                        );

                                        Navigator.of(context).pop();

                                        print("Workout completed and saved!");
                                      }
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
                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(0.0),
                                            child: SvgPicture.asset(
                                              'assets/images/Pause_Circle10.svg',
                                              width: 13.0,
                                              height: 13.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: Color(0xFF302E36),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          currentExercise?.approach?.toString() ?? '-',
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
                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
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
                                      color: Color(0xFF302E36),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          currentExercise?.repetitions?.toString() ?? '-',
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
                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
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
                                      color: Color(0xFF302E36),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          currentExercise?.weight?.toString() ?? '-',
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
                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
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
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
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
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: wrapWithModel(
                        model: _model.generalButtonModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: GeneralButtonWidget(
                          title: 'Назад',
                          isActive: true,
                          textColor: FlutterFlowTheme.of(context).secondaryText,
                          backbgoundColor: Colors.transparent,
                          borderColor: FlutterFlowTheme.of(context).secondary,
                          onTap: () async {
                            if (_currentIndex > 0) {
                              setState(() {
                                _currentIndex--;
                              });
                            }
                          },
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
                          onTap: () async {
                            if (widget.exercises != null &&
                                _currentIndex < widget.exercises!.length - 1) {
                              setState(() {
                                _currentIndex++;
                                _visitedExerciseIndexes.add(_currentIndex);
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 9.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
