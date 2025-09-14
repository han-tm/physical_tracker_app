import 'package:boom_client/flutter_flow/custom_functions.dart';

import '../../backend/supabase/database/tables/exercise.dart';
import '../../backend/supabase/database/tables/training_program.dart';
import '../workouts_exercise/workouts_exercise_process_page/workouts_exercise_process_page_widget.dart';
import '../workouts_individual_program_promo_page/workouts_individual_program_promo_page_widget.dart';
import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'workouts_page_model.dart';
export 'workouts_page_model.dart';

class WorkoutsPageWidget extends StatefulWidget {
  const WorkoutsPageWidget({super.key});

  static String routeName = 'WorkoutsPage';
  static String routePath = '/workoutsPage';

  @override
  State<WorkoutsPageWidget> createState() => _WorkoutsPageWidgetState();
}

class _WorkoutsPageWidgetState extends State<WorkoutsPageWidget> {
  late WorkoutsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool loaded = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsPageModel());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _model.loadUserData().then((_) => setState(() {
        int currentWeekday = DateTime.now().weekday;
        _model.daySelected = currentWeekday;
            loaded = true;
          }));
    });
  }

  @override
  void dispose() {
    _model.dispose();

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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                        child: Text(
                          'Тренировки',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.unbounded(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                                fontSize: 20.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: !loaded
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
                    : Stack(
                        children: [
                          if (!_model.individualProgramPreparing)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    // MARK: Индивидуальная программа не приобретена
                                    if (_model.user != null && _model.user!["individualProgramId"] == null && (_model.user!["individualProgramUnderPrepare"] == true || _model.user!["individualProgramUnderPrepare"] == null))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context).secondary,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              opacity: 0.2,
                                              image: Image.asset(
                                                'assets/images/1a2c950ebdd006be009161fbb6c5138b58253580.jpg',
                                              ).image,
                                            ),
                                            borderRadius: BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/Star_Shine.svg',
                                                          width: 16.0,
                                                          height: 16.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        'Индивидуальная',
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
                                                    Text(
                                                      '4 990 ₽',
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            font: GoogleFonts.unbounded(
                                                              fontWeight: FontWeight.w600,
                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme.of(context).primary,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FontWeight.w600,
                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Программа, составленная специально под ваши цели и возможности',
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
                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                  child: Container(
                                                    height: 37.0,
                                                    decoration: BoxDecoration(),
                                                    child: wrapWithModel(
                                                      model: _model.generalButtonModel1,
                                                      updateCallback: () => safeSetState(() {}),
                                                      child: GeneralButtonWidget(
                                                        title: 'Подробнее',
                                                        isActive: true,
                                                        onTap: () async {
                                                          await context.pushNamed(WorkoutsIndividualProgramPromoPageWidget.routeName);
                                                          await _model.loadUserData();
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Текущая неделя',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.unbounded(
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    fontSize: 13.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // MARK: Текущая неделя
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final daysList = _model.days.toList();

                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(daysList.length, (daysListIndex) {
                                                final daysListItem = daysList[daysListIndex];
                                                return InkWell(
                                                  splashColor: Colors.transparent,
                                                  focusColor: Colors.transparent,
                                                  hoverColor: Colors.transparent,
                                                  highlightColor: Colors.transparent,
                                                  onTap: () async {
                                                    _model.daySelected = daysListItem;
                                                    safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: _model.daySelected == daysListItem ? Color(0x1EE27B00) : FlutterFlowTheme.of(context).secondary,
                                                      borderRadius: BorderRadius.circular(100.0),
                                                      border: Border.all(
                                                        color: _model.daySelected == daysListItem ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondaryText,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 8.0, 6.0),
                                                      child: Text(
                                                        'День ${daysListItem.toString()}',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              font: GoogleFonts.unbounded(
                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                              ),
                                                              color: _model.daySelected == daysListItem ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondaryText,
                                                              fontSize: 11.0,
                                                              letterSpacing: 0.0,
                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }).divide(SizedBox(width: 4.0)).addToStart(SizedBox(width: 16.0)).addToEnd(SizedBox(width: 16.0)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    // "MARK: Список упражнений в выбранный день
                                    if (_model.exercises.isNotEmpty)
                                      Builder(
                                        builder: (BuildContext context) {
                                          // final programStart = DateTime.parse(_model.user!["programStartDate"]);
                                          // final now = DateTime.now();
                                          // final currentWeek = now.difference(programStart).inDays ~/ 7 + 1;
                                          // var exercises = _model.schedule.where((s) => s['dayofweek'] == _model.daySelected - 1 && s['difficultyid'] == _model.user!["exerciseDifficulty"] &&
                                          //     s['weeknumber'] == currentWeek);

                                          // Новый блок группировки по программам и неделям
                                          final selectedDay = _model.daySelected;

                                          // Отфильтровываем dayExercise только из недель, загруженных в модель
                                          final validWeekIds = _model.trainingProgramWeeks.map((w) => w['id']).toSet();

                                          final relevantDayExercises = _model.trainingTrainingProgramWeekDayExercises.where((item) {
                                            final weekDayId = item['trainingProgramWeekDay'];
                                            final weekDay = _model.trainingProgramWeekDays.firstWhere(
                                              (w) => w['id'] == weekDayId,
                                              orElse: () => <String, dynamic>{},
                                            );
                                            if (weekDay == null) return false;

                                            return weekDay['day'] == selectedDay &&
                                                validWeekIds.contains(weekDay['trainingProgramWeek']);
                                          }).toList();

                                          final Map<int, List<Map<String, dynamic>>> groupedByProgram = {};

                                          for (final exerciseEntry in relevantDayExercises) {
                                            final weekDayId = exerciseEntry['trainingProgramWeekDay'];
                                            final weekDay = _model.trainingProgramWeekDays.firstWhere(
                                              (w) => w['id'] == weekDayId,
                                              orElse: () => <String, dynamic>{},
                                            );
                                            if (weekDay == null) continue;

                                            final week = _model.trainingProgramWeeks.firstWhere(
                                              (w) => w['id'] == weekDay['trainingProgramWeek'],
                                              orElse: () => <String, dynamic>{},
                                            );
                                            if (week == null) continue;

                                            final programId = int.tryParse(week['trainingProgram'].toString());
                                            if (programId == null) continue;

                                            groupedByProgram.putIfAbsent(programId, () => []).add(exerciseEntry);
                                          }

                                          return ListView(
                                            padding: const EdgeInsets.all(16),
                                            shrinkWrap: true,
                                            physics: const NeverScrollableScrollPhysics(),
                                            children: groupedByProgram.entries
                                                .where((e) => e.value.isNotEmpty)
                                                .map((entry) {
                                              final programMap = _model.trainingPrograms.firstWhere(
                                                (p) => p['id'] == entry.key,
                                                orElse: () => <String, dynamic>{},
                                              );
                                              if (programMap.isEmpty) return SizedBox.shrink();

                                              final programExercises = entry.value;

                                              return renderProgram(programMap, programExercises);

                                              return Padding(
                                                padding: const EdgeInsets.only(bottom: 24),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      programMap['name'] ?? 'Программа',
                                                      style: FlutterFlowTheme.of(context).titleLarge,
                                                    ),
                                                    const SizedBox(height: 8),
                                                    ...programExercises.map((exerciseEntry) {
                                                      final exercise = _model.exercises.firstWhere(
                                                        (e) => e['id'] == exerciseEntry['exercise'],
                                                        orElse: () => <String, dynamic>{},
                                                      );
                                                      if (exercise == null) return SizedBox.shrink();

                                                      return Card(
                                                        child: ListTile(
                                                          title: Text(exercise['name'] ?? "-"),
                                                          subtitle: Text(
                                                              '${exercise['approach']} подходов × ${exercise['repetitions']} повторений'),
                                                          trailing: const Icon(Icons.fitness_center),
                                                          onTap: () {
                                                            final video = exercise['video'];
                                                            if (video != null && video.toString().isNotEmpty) {
                                                              launchURL(video);
                                                            }
                                                          },
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          );
                                          // return Padding(
                                          //   padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                                          //   child: Container(
                                          //     width: double.infinity,
                                          //     decoration: BoxDecoration(
                                          //       color: FlutterFlowTheme.of(context).secondary,
                                          //       borderRadius: BorderRadius.circular(12.0),
                                          //     ),
                                          //     child: Padding(
                                          //       padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                          //       child: Column(
                                          //         mainAxisSize: MainAxisSize.max,
                                          //         children: [
                                          //           Row(
                                          //             mainAxisSize: MainAxisSize.max,
                                          //             children: [
                                          //               Column(
                                          //                 mainAxisSize: MainAxisSize.max,
                                          //                 crossAxisAlignment: CrossAxisAlignment.start,
                                          //                 children: [
                                          //                   // Padding(
                                          //                   //   padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                                          //                   //   child: Row(
                                          //                   //     mainAxisSize: MainAxisSize.max,
                                          //                   //     children: [
                                          //                   //       Text(
                                          //                   //         "asd",
                                          //                   //         style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          //                   //           font: GoogleFonts.unbounded(
                                          //                   //             fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                          //                   //             fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          //                   //           ),
                                          //                   //           letterSpacing: 0.0,
                                          //                   //           fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                          //                   //           fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          //                   //         ),
                                          //                   //       ),
                                          //                   //     ],
                                          //                   //   ),
                                          //                   // ),
                                          //                   Align(
                                          //                     alignment: AlignmentDirectional(-1.0, 0.0),
                                          //                     child: Padding(
                                          //                       padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                          //                       child: Wrap(
                                          //                         spacing: 4.0,
                                          //                         runSpacing: 4.0,
                                          //                         alignment: WrapAlignment.start,
                                          //                         crossAxisAlignment: WrapCrossAlignment.start,
                                          //                         direction: Axis.horizontal,
                                          //                         runAlignment: WrapAlignment.start,
                                          //                         verticalDirection: VerticalDirection.down,
                                          //                         clipBehavior: Clip.none,
                                          //                         children: [
                                          //                           Row(
                                          //                             mainAxisSize: MainAxisSize.min,
                                          //                             children: [
                                          //                               Padding(
                                          //                                 padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                          //                                 child: ClipRRect(
                                          //                                   borderRadius: BorderRadius.circular(0.0),
                                          //                                   child: SvgPicture.asset(
                                          //                                     'assets/images/Dumbbells.svg',
                                          //                                     width: 14.0,
                                          //                                     height: 14.0,
                                          //                                     fit: BoxFit.cover,
                                          //                                   ),
                                          //                                 ),
                                          //                               ),
                                          //                               Text(
                                          //                                 getExperienceString(
                                          //                                     exercises.length,
                                          //                                     "упражнение",
                                          //                                     "упражнения",
                                          //                                     "упражнений",
                                          //                                     false
                                          //                                 ),
                                          //                                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          //                                   font: GoogleFonts.inter(
                                          //                                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                          //                                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          //                                   ),
                                          //                                   color: FlutterFlowTheme.of(context).secondaryText,
                                          //                                   fontSize: 13.0,
                                          //                                   letterSpacing: 0.0,
                                          //                                   fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                          //                                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          //                                 ),
                                          //                               ),
                                          //                             ],
                                          //                           ),
                                          //                           // Row(
                                          //                           //   mainAxisSize: MainAxisSize.min,
                                          //                           //   children: [
                                          //                           //     Padding(
                                          //                           //       padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                          //                           //       child: ClipRRect(
                                          //                           //         borderRadius: BorderRadius.circular(0.0),
                                          //                           //         child: SvgPicture.asset(
                                          //                           //           'assets/images/Calendar01.svg',
                                          //                           //           width: 14.0,
                                          //                           //           height: 14.0,
                                          //                           //           fit: BoxFit.cover,
                                          //                           //         ),
                                          //                           //       ),
                                          //                           //     ),
                                          //                           //     Text(
                                          //                           //       '45 мин',
                                          //                           //       style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          //                           //         font: GoogleFonts.inter(
                                          //                           //           fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                          //                           //           fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          //                           //         ),
                                          //                           //         color: FlutterFlowTheme.of(context).secondaryText,
                                          //                           //         fontSize: 13.0,
                                          //                           //         letterSpacing: 0.0,
                                          //                           //         fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                          //                           //         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          //                           //       ),
                                          //                           //     ),
                                          //                           //   ],
                                          //                           // ),
                                          //                         ],
                                          //                       ),
                                          //                     ),
                                          //                   ),
                                          //                 ],
                                          //               ),
                                          //             ],
                                          //           ),
                                          //           Padding(
                                          //             padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                                          //             child: Container(
                                          //               width: double.infinity,
                                          //               height: 1.0,
                                          //               decoration: BoxDecoration(
                                          //                 color: Color(0xFF302E36),
                                          //               ),
                                          //             ),
                                          //           ),
                                          //           Padding(
                                          //             padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                                          //             child: Builder(
                                          //               builder: (BuildContext context) {
                                          //
                                          //
                                          //                 if (exercises.isEmpty) {
                                          //                   return Container(
                                          //                     // margin: EdgeInsets.only(bottom: 16),
                                          //                     child: Text(
                                          //                       "В этот день нет тренировок",
                                          //                       style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          //                         font: GoogleFonts.inter(
                                          //                           fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                          //                           fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          //                         ),
                                          //                         color: FlutterFlowTheme.of(context).secondaryText,
                                          //                         fontSize: 14.0,
                                          //                         letterSpacing: 0.0,
                                          //                         fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                          //                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          //                       ),
                                          //                     ),
                                          //                   );
                                          //                 }
                                          //
                                          //                 return ListView.builder(
                                          //                   shrinkWrap: true,
                                          //                   physics: NeverScrollableScrollPhysics(),
                                          //                   itemCount: exercises.length,
                                          //                   itemBuilder: (context, index) {
                                          //                     final filteredSchedule = exercises.toList()..sort((a, b) => a['order'].compareTo(b['order']));
                                          //
                                          //                     final scheduleItem = filteredSchedule[index];
                                          //                     print("scheduleItem_______${scheduleItem}");
                                          //                     final exercise = _model.exercises.firstWhere(
                                          //                           (e) => e['id'] == scheduleItem['exerciseid'],
                                          //                       orElse: () => <String, dynamic>{},
                                          //                     );
                                          //
                                          //                     if (exercise == null) return SizedBox();
                                          //
                                          //                     return renderExercise(exercise, index + 1);
                                          //                   },
                                          //                 );
                                          //               },
                                          //             ),
                                          //           ),
                                          //           if (exercises.isNotEmpty)
                                          //             Padding(
                                          //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                          //               child: InkWell(
                                          //                 splashColor: Colors.transparent,
                                          //                 focusColor: Colors.transparent,
                                          //                 hoverColor: Colors.transparent,
                                          //                 highlightColor: Colors.transparent,
                                          //                 onTap: () async {
                                          //                   context.safePop();
                                          //                 },
                                          //                 child: Container(
                                          //                   width: double.infinity,
                                          //                   height: 42.0,
                                          //                   decoration: BoxDecoration(
                                          //                     color: FlutterFlowTheme.of(context).primary,
                                          //                     borderRadius: BorderRadius.only(
                                          //                       bottomLeft: Radius.circular(12.0),
                                          //                       bottomRight: Radius.circular(12.0),
                                          //                       topLeft: Radius.circular(0.0),
                                          //                       topRight: Radius.circular(0.0),
                                          //                     ),
                                          //                   ),
                                          //                   child: Row(
                                          //                     mainAxisSize: MainAxisSize.max,
                                          //                     mainAxisAlignment: MainAxisAlignment.center,
                                          //                     children: [
                                          //                       Padding(
                                          //                         padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                          //                         child: ClipRRect(
                                          //                           borderRadius: BorderRadius.circular(0.0),
                                          //                           child: SvgPicture.asset(
                                          //                             'assets/images/Dumbbell.svg',
                                          //                             width: 16.0,
                                          //                             height: 16.0,
                                          //                             fit: BoxFit.cover,
                                          //                           ),
                                          //                         ),
                                          //                       ),
                                          //                       Text(
                                          //                         'Начать',
                                          //                         style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          //                           font: GoogleFonts.unbounded(
                                          //                             fontWeight: FontWeight.w600,
                                          //                             fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          //                           ),
                                          //                           letterSpacing: 0.0,
                                          //                           fontWeight: FontWeight.w600,
                                          //                           fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          //                         ),
                                          //                       ),
                                          //                     ],
                                          //                   ),
                                          //                 ),
                                          //               ),
                                          //             ),
                                          //         ],
                                          //       ),
                                          //     ),
                                          //   ),
                                          // );
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          if (_model.individualProgramPreparing)
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondary,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                          'assets/images/68c085461ec08067a99474c2c8d3aa09e898f3b2.jpg',
                                        ).image,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context).secondary,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(0.0),
                                            child: SvgPicture.asset(
                                              'assets/images/Calendar02.svg',
                                              width: 32.0,
                                              height: 32.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                            child: Text(
                                              'Индивидуальная программа готовится',
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
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                            child: CircularPercentIndicator(
                                              percent: 0.3,
                                              radius: 87.5,
                                              lineWidth: 12.0,
                                              animation: true,
                                              animateFromLastPercent: true,
                                              progressColor: FlutterFlowTheme.of(context).primary,
                                              backgroundColor: Color(0x15FFFFFF),
                                              center: Text(
                                                '30%',
                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                      font: GoogleFonts.unbounded(
                                                        fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                            child: Text(
                                              'Программа делается в течении 4-х дней, после того, как вы пришлете всю информацию. Вам придет уведомление о готовности и появится ссылка на телеграмм канал',
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
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                            child: wrapWithModel(
                                              model: _model.generalButtonModel2,
                                              updateCallback: () => safeSetState(() {}),
                                              child: GeneralButtonWidget(
                                                title: 'Подробнее',
                                                isActive: false,
                                                onTap: () async {},
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // MARK: Ячейка с упражнением
  Widget renderExercise(dynamic exercise, int index) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 32.0,
            height: 32.0,
            decoration: BoxDecoration(
              color: Color(0xFF1A191D),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                '$index',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.unbounded(
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 11.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise["name"] ?? "-",
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.unbounded(
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                Text(
                  // '3×12 - 35 кг',
                  '${exercise['approach']}×${exercise['repetitions']} - ${exercise['weight']} кг',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget renderProgram(dynamic programMap, List<Map<String, dynamic>> programExercises) {
    final List<ExerciseRow> programExerciseObjects = programExercises
        .map((entry) {
      final exercise = _model.exercises.firstWhere(
            (e) => e['id'] == entry['exercise'],
        orElse: () => <String, dynamic>{}, // заменили null на пустую Map
      );
      if (exercise.isEmpty) return null; // проверка, что не пустая
      return ExerciseRow(exercise);
    })
        .whereType<ExerciseRow>() // удаляет null
        .toList();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondary,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              programMap['name'] ?? 'Программа',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.unbounded(
                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                          child: Wrap(
                            spacing: 4.0,
                            runSpacing: 4.0,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: SvgPicture.asset(
                                        'assets/images/Dumbbells.svg',
                                        width: 14.0,
                                        height: 14.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    getExperienceString(
                                        programExercises.length,
                                        "упражнение",
                                        "упражнения",
                                        "упражнений",
                                        false
                                    ),
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
                                ],
                              ),
                              // Row(
                              //   mainAxisSize: MainAxisSize.min,
                              //   children: [
                              //     Padding(
                              //       padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                              //       child: ClipRRect(
                              //         borderRadius: BorderRadius.circular(0.0),
                              //         child: SvgPicture.asset(
                              //           'assets/images/Calendar01.svg',
                              //           width: 14.0,
                              //           height: 14.0,
                              //           fit: BoxFit.cover,
                              //         ),
                              //       ),
                              //     ),
                              //     Text(
                              //       '45 мин',
                              //       style: FlutterFlowTheme.of(context).bodyMedium.override(
                              //             font: GoogleFonts.inter(
                              //               fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                              //               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              //             ),
                              //             color: FlutterFlowTheme.of(context).secondaryText,
                              //             fontSize: 13.0,
                              //             letterSpacing: 0.0,
                              //             fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                              //             fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              //           ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF302E36),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ...programExercises.asMap().entries.map((entry) {
                      final index = entry.key;
                      final exerciseEntry = entry.value;
                      final exercise = _model.exercises.firstWhere(
                            (e) => e['id'] == exerciseEntry['exercise'],
                        orElse: () => <String, dynamic>{},
                      );
                      if (exercise.isEmpty) return SizedBox.shrink();

                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF1A191D),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  '${index+1}',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.unbounded(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    fontSize: 11.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      exercise['name'] ?? "-",
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.unbounded(
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                    ),
                                    Text(
                                      '${exercise['approach']} × ${exercise['repetitions']}',
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
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ].divide(SizedBox(height: 8.0)),
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
                    // List<ExerciseRow> programExercisesBuf = [];
                    // for (var i in programExerciseObjects) {
                    //   programExercisesBuf.add(ExerciseRow(i));
                    // }
                    var asd =TrainingProgramRow(programMap);

                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WorkoutsExerciseProcessPageWidget(
                          exercises: programExerciseObjects,
                          program: TrainingProgramRow(programMap)
                        ),
                        // fullscreenDialog: true
                      ),
                    );
                    // context.pushNamed(
                    //   WorkoutsExerciseProcessPageWidget.routeName,
                    //   queryParameters: {
                    //     'exercises': serializeParam(
                    //       programExerciseObjects,
                    //       ParamType.SupabaseRow,
                    //       isList: true,
                    //     ),
                    //     'program': serializeParam(
                    //       TrainingProgramRow(programMap),
                    //       ParamType.SupabaseRow,
                    //     ),
                    //   }.withoutNulls,
                    // );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 42.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: SvgPicture.asset(
                              'assets/images/Dumbbell.svg',
                              width: 16.0,
                              height: 16.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Text(
                          'Начать',
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
