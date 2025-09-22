import 'package:auto_size_text/auto_size_text.dart';
import 'package:boom_client/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../auth/firebase_auth/auth_util.dart';
import '../../backend/supabase/database/tables/exercise.dart';
import '../../backend/supabase/supabase.dart';
import '../../components/general_button_widget.dart';
import '../../flutter_flow/flutter_flow_theme.dart';

class JournalStatisticsWidget extends StatefulWidget {
  const JournalStatisticsWidget({super.key});

  @override
  State<JournalStatisticsWidget> createState() => _JournalStatisticsWidgetState();
}

class _JournalStatisticsWidgetState extends State<JournalStatisticsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, dynamic>? user;
  List<Map<String, dynamic>> _workoutResults = [];

  // Метрики для UI
  double? currentWeight;
  int totalReps = 0;
  int totalWorkouts = 0;
  int totalSets = 0;
  double averageReps = 0;
  double successRate = 0;

  List<Map<String, dynamic>> topExercises = [];

  bool loaded = false;

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      loadUserData().then((_) => setState(() {
            loaded = true;
          }));
    });
  }

  Future<void> loadUserData() async {
    final userSnapshot = await AppSupabase.instance.client.from('User').select().eq('fb_id', currentUserUid).single();
    final userId = currentUserUid;

    final response = await AppSupabase.instance.client
        .from('user_workout_result')
        .select()
        .eq('user_id', userId);

    _workoutResults = List<Map<String, dynamic>>.from(response);
    user = userSnapshot;

    // --- Расчёт метрик ---
    currentWeight = userSnapshot['weight']?.toDouble();
    totalReps = 0;
    totalWorkouts = _workoutResults.length;
    totalSets = 0;

    Map<String, int> exerciseFrequency = {};
    Map<String, Map<String, dynamic>> exerciseDetails = {};

    for (var result in _workoutResults) {
      final workoutId = result['id'];
      final exerciseResponse = await AppSupabase.instance.client
          .from('user_workout_exercise')
          .select()
          .eq('workout_result_id', workoutId);

      final exercises = List<Map<String, dynamic>>.from(exerciseResponse);
      for (var exercise in exercises) {
        // totalReps += (exercise['reps'] ?? 0);
        totalSets += 1;
        final exerciseId = exercise['exercise_id'];
        if (exerciseId != null) {
          final idStr = exerciseId.toString();
          exerciseFrequency[idStr] = (exerciseFrequency[idStr] ?? 0) + 1;
          exerciseDetails[idStr] = exercise;
        } else {
          final customKey = 'custom_${exercise['id']}';
          exerciseFrequency[customKey] = (exerciseFrequency[customKey] ?? 0) + 1;
          exerciseDetails[customKey] = exercise;
        }
      }
    }

    final sorted = exerciseFrequency.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    topExercises = sorted.take(3).map((e) {
      final idStr = e.key;
      final count = e.value;
      final data = exerciseDetails[idStr]!;
      return {
        'id': data['exercise_id'], // может быть null, если пользовательское
        'sets': '${data['sets'] ?? '-'}×${data['reps'] ?? '-'}',
        'count': count,
      };
    }).toList();

    averageReps = totalSets > 0 ? totalReps / totalSets : 0;
    int scheduledCount = (user?['programCompletedWeeks'] ?? 0) * 7;
    successRate = scheduledCount > 0 ? (totalWorkouts / scheduledCount) * 100 : 0;
    // --- Конец расчёта метрик ---
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return !loaded
        ? Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/subscr01.jpg',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/Dumbbell.svg',
                                  width: 32.0,
                                  height: 32.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  'Пока нет данных \nдля анализа',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.unbounded(
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        fontSize: 17.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  'Начните свою первую тренировку, чтобы отслеживать прогресс и видеть статистику',
                                  textAlign: TextAlign.center,
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                child: GeneralButtonWidget(
                                  title: 'К тренировке',
                                  isActive: false,
                                  onTap: () async {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    'Топ упражнений',
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
                                Column(
                                  children: topExercises.asMap().entries.map((entry) {
                                    final index = entry.key + 1;
                                    final ex = entry.value;
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 8.0),
                                      padding: const EdgeInsets.all(12.0),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondary,
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: FutureBuilder<List<ExerciseRow>>(
                                        future: ExerciseTable().querySingleRow(
                                          queryFn: (q) => q.eqOrNull(
                                            'id',
                                            ex['id'],
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: CircularProgressIndicator(
                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                    FlutterFlowTheme.of(context).primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ExerciseRow> containerExerciseRowList = snapshot.data!;

                                          final containerExerciseRow = containerExerciseRowList.isNotEmpty
                                              ? containerExerciseRowList.first
                                              : null;

                                          return Row(
                                            children: [
                                              Container(
                                                width: 32,
                                                height: 32,
                                                decoration: BoxDecoration(
                                                  color: const Color(0x20E27B00),
                                                  borderRadius: BorderRadius.circular(12.0),
                                                ),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '$index',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.unbounded(),
                                                    color: FlutterFlowTheme.of(context).primary,
                                                    fontSize: 11.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8.0),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${containerExerciseRow?.name}",
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        font: GoogleFonts.unbounded(),
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 13.0,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${containerExerciseRow?.repetitions}x${containerExerciseRow?.approach}",
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        font: GoogleFonts.inter(),
                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                        fontSize: 13.0,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    'Сводка прогресса',
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
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                  ),
                                  child: GridView(
                                    padding: EdgeInsets.zero,
                                    physics: const NeverScrollableScrollPhysics(),
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 9.0,
                                      mainAxisSpacing: 9.0,
                                      childAspectRatio: 1.79,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 93.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).secondary,
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                              child: AutoSizeText(
                                                currentWeight?.toStringAsFixed(1) ?? '--',
                                                maxLines: 1,
                                                minFontSize: 1.0,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.unbounded(
                                                        fontWeight: FontWeight.w600,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme.of(context).primary,
                                                      fontSize: 20.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                              child: AutoSizeText(
                                                'Текущий вес (кг)',
                                                maxLines: 1,
                                                minFontSize: 1.0,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 0.0),
                                            //   child: Container(
                                            //     decoration: BoxDecoration(
                                            //       color: Color(0x2136CF77),
                                            //       borderRadius: BorderRadius.circular(100.0),
                                            //     ),
                                            //     child: Padding(
                                            //       padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                            //       child: AutoSizeText(
                                            //         '-25% за месяц',
                                            //         maxLines: 1,
                                            //         minFontSize: 1.0,
                                            //         style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            //               font: GoogleFonts.inter(
                                            //                 fontWeight: FontWeight.w600,
                                            //                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            //               ),
                                            //               color: Color(0xFF36CF77),
                                            //               fontSize: 11.0,
                                            //               letterSpacing: 0.0,
                                            //               fontWeight: FontWeight.w600,
                                            //               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            //             ),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 93.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).secondary,
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                              child: AutoSizeText(
                                                averageReps.toStringAsFixed(0),
                                                maxLines: 1,
                                                minFontSize: 1.0,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.unbounded(
                                                        fontWeight: FontWeight.w600,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme.of(context).primary,
                                                      fontSize: 20.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                              child: AutoSizeText(
                                                'Среднее повторений',
                                                maxLines: 1,
                                                minFontSize: 1.0,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 0.0),
                                            //   child: Container(
                                            //     decoration: BoxDecoration(
                                            //       color: Color(0x2136CF77),
                                            //       borderRadius: BorderRadius.circular(100.0),
                                            //     ),
                                            //     child: Padding(
                                            //       padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                            //       child: AutoSizeText(
                                            //         '+2 повторения',
                                            //         maxLines: 1,
                                            //         minFontSize: 1.0,
                                            //         style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            //               font: GoogleFonts.inter(
                                            //                 fontWeight: FontWeight.w600,
                                            //                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            //               ),
                                            //               color: Color(0xFF36CF77),
                                            //               fontSize: 11.0,
                                            //               letterSpacing: 0.0,
                                            //               fontWeight: FontWeight.w600,
                                            //               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            //             ),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 93.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).secondary,
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                              child: AutoSizeText(
                                                '$totalWorkouts',
                                                maxLines: 1,
                                                minFontSize: 1.0,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.unbounded(
                                                        fontWeight: FontWeight.w600,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme.of(context).primary,
                                                      fontSize: 20.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                              child: AutoSizeText(
                                                'Тренировок',
                                                maxLines: 1,
                                                minFontSize: 1.0,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 0.0),
                                            //   child: Container(
                                            //     decoration: BoxDecoration(
                                            //       color: Color(0x2136CF77),
                                            //       borderRadius: BorderRadius.circular(100.0),
                                            //     ),
                                            //     child: Padding(
                                            //       padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                            //       child: AutoSizeText(
                                            //         '+2 за неделю',
                                            //         maxLines: 1,
                                            //         minFontSize: 1.0,
                                            //         style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            //               font: GoogleFonts.inter(
                                            //                 fontWeight: FontWeight.w600,
                                            //                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            //               ),
                                            //               color: Color(0xFF36CF77),
                                            //               fontSize: 11.0,
                                            //               letterSpacing: 0.0,
                                            //               fontWeight: FontWeight.w600,
                                            //               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            //             ),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 93.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).secondary,
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                              child: AutoSizeText(
                                                '${successRate.toStringAsFixed(0)}%',
                                                maxLines: 1,
                                                minFontSize: 1.0,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.unbounded(
                                                        fontWeight: FontWeight.w600,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme.of(context).primary,
                                                      fontSize: 20.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                              child: AutoSizeText(
                                                'Успешность',
                                                maxLines: 1,
                                                minFontSize: 1.0,
                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 0.0),
                                            //   child: Container(
                                            //     decoration: BoxDecoration(
                                            //       color: Color(0x2136CF77),
                                            //       borderRadius: BorderRadius.circular(100.0),
                                            //     ),
                                            //     child: Padding(
                                            //       padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                            //       child: AutoSizeText(
                                            //         '+10% за месяц',
                                            //         maxLines: 1,
                                            //         minFontSize: 1.0,
                                            //         style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            //               font: GoogleFonts.inter(
                                            //                 fontWeight: FontWeight.w600,
                                            //                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            //               ),
                                            //               color: Color(0xFF36CF77),
                                            //               fontSize: 11.0,
                                            //               letterSpacing: 0.0,
                                            //               fontWeight: FontWeight.w600,
                                            //               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            //             ),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                          //   child: Container(
                          //     width: double.infinity,
                          //     decoration: BoxDecoration(
                          //       color: FlutterFlowTheme.of(context).secondary,
                          //       borderRadius: BorderRadius.circular(12.0),
                          //     ),
                          //     child: Padding(
                          //       padding: EdgeInsets.all(12.0),
                          //       child: Column(
                          //         mainAxisSize: MainAxisSize.max,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Text(
                          //             'График',
                          //             style: FlutterFlowTheme.of(context).bodyMedium.override(
                          //                   font: GoogleFonts.unbounded(
                          //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                   ),
                          //                   letterSpacing: 0.0,
                          //                   fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                 ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ].addToEnd(const SizedBox(height: 32.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
