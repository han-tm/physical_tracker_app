import 'package:boom_client/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../auth/firebase_auth/auth_util.dart';
import '../../backend/supabase/database/tables/exercise.dart';
import '../../backend/supabase/database/tables/training_program.dart';
import '../../backend/supabase/supabase.dart';
import '../../flutter_flow/custom_functions.dart';
import '../../flutter_flow/flutter_flow_calendar.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../workouts/workouts_exercise/workouts_exercise_process_page/workouts_exercise_process_page_widget.dart';

class JournalCalendarWidget extends StatefulWidget {
  const JournalCalendarWidget({super.key});

  @override
  State<JournalCalendarWidget> createState() => _JournalCalendarWidgetState();
}

class _JournalCalendarWidgetState extends State<JournalCalendarWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool weekView = true;

  DateTime? currentDate;
  DateTime? calendarSelectedDay;

  Map<String, dynamic>? user;
  List<int> workoutDays = [];

  List<dynamic> exercises = [];
  List<dynamic> trainingPrograms = [];
  List<dynamic> trainingProgramWeeks = [];
  List<dynamic> trainingProgramWeekDays = [];
  List<dynamic> trainingTrainingProgramWeekDayExercises = [];

  bool loaded = false;

  late DateTime focusedDay;

  // Store generated workout markers
  List<Map<String, dynamic>> workoutMarkers = [];

  Map<String, dynamic>? completedWorkoutResult;
  List<Map<String, dynamic>> completedWorkoutExercises = [];

  @override
  void initState() {
    super.initState();

    calendarSelectedDay = DateTime.now();
    focusedDay = DateTime.now();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentDate = getCurrentTimestamp;
      await _fetchCompletedWorkoutForDate(currentDate!);
      loadUserData().then((_) => setState(() {
            loaded = true;
          }));
    });
  }

  Future<void> loadUserData() async {
    final userSnapshot = await AppSupabase.instance.client.from('User').select().eq('fb_id', currentUserUid).single();

    final response = await AppSupabase.instance.client.from('TrainingProgramWeekDay').select('day').eq('difficulty', userSnapshot["exerciseDifficulty"]);

    final days = response
        .map<int>((entry) => entry['day'] as int)
        .toSet() // убираем повторы
        .toList()
      ..sort();


    workoutDays = days;
    user = userSnapshot;

    final difficultyId = userSnapshot['exerciseDifficulty'];
    final loadedTrainingProgram = await AppSupabase.instance.client
        .from('TrainingProgram')
        .select()
        .eq('difficulty', difficultyId);

    final programStart = DateTime.parse(userSnapshot["programStartDate"]);
    final now = DateTime.now();
    final currentWeek = now.difference(programStart).inDays ~/ 7 + 1;

    final loadedTrainingProgramWeek = await AppSupabase.instance.client
        .from('TrainingProgramWeek')
        .select()
        .eq('week', currentWeek);

    final loadedTrainingProgramWeekDay = await AppSupabase.instance.client
        .from('TrainingProgramWeekDay')
        .select();



    final loadedTrainingProgramWeekDayExercise = await AppSupabase.instance.client
        .from('TrainingProgramWeekDayExercise')
        .select();

    final loadedExercises = await AppSupabase.instance.client
        .from('Exercise')
        .select()
        .eq('difficultyId', difficultyId);

    // сохраняем в поля модели
    user = userSnapshot;
    exercises = loadedExercises;
    trainingPrograms = loadedTrainingProgram;
    trainingProgramWeeks = loadedTrainingProgramWeek;
    trainingProgramWeekDays = loadedTrainingProgramWeekDay;
    trainingTrainingProgramWeekDayExercises = loadedTrainingProgramWeekDayExercise;

    // Generate workoutMarkers after loading user/workoutDays
    workoutMarkers = generateWorkoutDays(
      programStartDate: user?['programStartDate'] != null ? DateTime.parse(user!['programStartDate']) : DateTime.now(),
      programCompletedWeeks: user?['programCompletedWeeks'] ?? 0,
      workoutDays: workoutDays,
      totalWeeks: 12,
    );
  }

  /// Generates a list of marked workout days for the calendar.
  List<Map<String, dynamic>> generateWorkoutDays({
    required DateTime programStartDate,
    required int programCompletedWeeks,
    required List<int> workoutDays,
    required int totalWeeks,
  }) {
    final markedDates = <Map<String, dynamic>>[];
    for (int week = 0; week < totalWeeks; week++) {
      for (int weekday in workoutDays) {
        final workoutDate = programStartDate.add(Duration(days: week * 7 + (weekday - 1)));
        final dateOnly = DateTime(workoutDate.year, workoutDate.month, workoutDate.day);
        final isCompletedWeek = week < programCompletedWeeks;
        markedDates.add({
          'date': dateOnly,
          'color': isCompletedWeek ? const Color(0xFF263931) : const Color(0xFFE27B00),
        });
      }
    }
    return markedDates;
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondary,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            //MARK: календарь
                            Builder(
                              builder: (BuildContext context) {
                                // var focusedDay = currentDate ?? DateTime.now();
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    CalendarHeader(
                                      focusedDay: focusedDay,
                                      onLeftChevronTap: () => setState(
                                        () => focusedDay = weekView ? _previousWeek(focusedDay) : _previousMonth(focusedDay),
                                      ),
                                      onRightChevronTap: () => setState(
                                        () => focusedDay = weekView ? _nextWeek(focusedDay) : _nextMonth(focusedDay),
                                      ),
                                      onTodayButtonTap: () => setState(() => focusedDay = DateTime.now()),
                                      titleStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                            font: GoogleFonts.unbounded(
                                              fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                            ),
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                          ),
                                      iconColor: FlutterFlowTheme.of(context).primaryText,
                                      locale: "ru",
                                      twoRowHeader: false,
                                    ),
                                    TableCalendar(
                                      focusedDay: focusedDay,
                                      selectedDayPredicate: (date) => isSameDay(focusedDay, date),
                                      firstDay: kFirstDay,
                                      lastDay: kLastDay,
                                      calendarFormat: weekView ? CalendarFormat.week : CalendarFormat.month,
                                      headerVisible: false,
                                      locale: "ru",
                                      rowHeight: 48,
                                      calendarBuilders: CalendarBuilders(
                                        defaultBuilder: (context, day, focusedDay) {
                                          DateTime normalize(DateTime d) => DateTime(d.year, d.month, d.day);
                                          final dateOnly = normalize(day);
                                          Color? circleColor;
                                          if (normalize(dateOnly).isBefore(normalize(DateTime.now()))) {
                                            circleColor = const Color(0xFF263931);
                                          } else {
                                            circleColor = const Color(0xFFE27B00);
                                          }
                                          final marker = workoutMarkers.firstWhere(
                                            (d) => d['date'] == dateOnly,
                                            orElse: () => {},
                                          );
                                          if (marker.isNotEmpty) {
                                            return Container(
                                              margin: const EdgeInsets.all(6.0),
                                              decoration: BoxDecoration(
                                                color: circleColor,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '${day.day}',
                                                  style: const TextStyle(color: Colors.white),
                                                ),
                                              ),
                                            );
                                          }
                                          return null;
                                        },
                                      ),
                                      calendarStyle: CalendarStyle(
                                        defaultTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                        weekendTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                        holidayTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                        selectedTextStyle: const TextStyle(color: Color(0xFFFAFAFA), fontSize: 16.0).merge(FlutterFlowTheme.of(context).titleSmall.override(
                                              font: GoogleFonts.unbounded(
                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                              ),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                            )),
                                        todayTextStyle: const TextStyle(color: Color(0xFFFAFAFA), fontSize: 16.0).merge(FlutterFlowTheme.of(context).titleSmall.override(
                                              font: GoogleFonts.unbounded(
                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                              ),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                            )),
                                        outsideTextStyle: const TextStyle(color: Color(0xFF9E9E9E)).merge(FlutterFlowTheme.of(context).labelMedium.override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                              ),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                            )),
                                        selectedDecoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).primary,
                                          shape: BoxShape.rectangle,
                                          // borderRadius: BorderRadius.circular(4)
                                        ),
                                        todayDecoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).primary.applyAlpha(0.60),
                                          shape: BoxShape.rectangle,
                                          // borderRadius: BorderRadius.circular(4)
                                        ),
                                        markerDecoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).primary.applyAlpha(0.85),
                                          shape: BoxShape.rectangle,
                                          // borderRadius: BorderRadius.circular(4)
                                        ),
                                        markersMaxCount: 3,
                                        canMarkersOverflow: true,
                                      ),
                                      availableGestures: AvailableGestures.horizontalSwipe,
                                      startingDayOfWeek: StartingDayOfWeek.monday,
                                      daysOfWeekStyle: DaysOfWeekStyle(
                                        weekdayStyle: const TextStyle(color: Color(0xFF616161)).merge(FlutterFlowTheme.of(context).bodyLarge.override(
                                              font: GoogleFonts.unbounded(
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                              ),
                                              color: FlutterFlowTheme.of(context).secondaryText,
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                            )),
                                        weekendStyle: const TextStyle(color: Color(0xFF616161)).merge(FlutterFlowTheme.of(context).bodyLarge.override(
                                              font: GoogleFonts.unbounded(
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                              ),
                                              color: FlutterFlowTheme.of(context).secondaryText,
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                            )),
                                      ),
                                      onPageChanged: (focused) {
                                        if (focusedDay.startOfDay != focused.startOfDay) {
                                          setState(() => focusedDay = focused);
                                        }
                                      },
                                      onDaySelected: (newSelectedDay, focused) {
                                        if (!isSameDay(currentDate, newSelectedDay)) {
                                          setSelectedDay(newSelectedDay);
                                          if (focusedDay.startOfDay != focused.startOfDay) {
                                            setState(() => focusedDay = focused);
                                          }
                                        }
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                            // FlutterFlowCalendar(
                            //   color: FlutterFlowTheme.of(context).primary,
                            //   iconColor: FlutterFlowTheme.of(context).primaryText,
                            //   weekFormat: weekView,
                            //   weekStartsMonday: true,
                            //   initialDate: currentDate,
                            //   rowHeight: 48.0,
                            //   onChange: (DateTimeRange? newSelectedDate) {
                            //     safeSetState(() => calendarSelectedDay = newSelectedDate?.start);
                            //   },
                            //   titleStyle: FlutterFlowTheme.of(context).titleLarge.override(
                            //         font: GoogleFonts.unbounded(
                            //           fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                            //           fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                            //         ),
                            //         fontSize: 15.0,
                            //         letterSpacing: 0.0,
                            //         fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                            //         fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                            //       ),
                            //   dayOfWeekStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                            //         font: GoogleFonts.unbounded(
                            //           fontWeight: FontWeight.w600,
                            //           fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                            //         ),
                            //         color: FlutterFlowTheme.of(context).secondaryText,
                            //         fontSize: 13.0,
                            //         letterSpacing: 0.0,
                            //         fontWeight: FontWeight.w600,
                            //         fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                            //       ),
                            //   dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                            //         font: GoogleFonts.inter(
                            //           fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                            //           fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            //         ),
                            //         fontSize: 15.0,
                            //         letterSpacing: 0.0,
                            //         fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                            //         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            //       ),
                            //   selectedDateStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            //         font: GoogleFonts.unbounded(
                            //           fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                            //           fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                            //         ),
                            //         fontSize: 15.0,
                            //         letterSpacing: 0.0,
                            //         fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                            //         fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                            //       ),
                            //   inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium.override(
                            //         font: GoogleFonts.inter(
                            //           fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                            //           fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                            //         ),
                            //         fontSize: 16.0,
                            //         letterSpacing: 0.0,
                            //         fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                            //         fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                            //       ),
                            //   locale: "ru",
                            // ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  weekView = !weekView;
                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                  ),
                                  child: Icon(
                                    weekView?Icons.arrow_drop_down_rounded:Icons.arrow_drop_up_rounded,
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //MARK: Блок с тренировками в будущем дне
                  if (currentDate!.isAfter(DateTime.now()))
                    Builder(
                      builder: (BuildContext context) {

                        final selectedDay = currentDate!.weekday;

                        // Отфильтровываем dayExercise только из недель, загруженных в модель
                        final validWeekIds = trainingProgramWeeks.map((w) => w['id']).toSet();

                        final relevantDayExercises = trainingTrainingProgramWeekDayExercises.where((item) {
                          final weekDayId = item['trainingProgramWeekDay'];
                          final weekDay = trainingProgramWeekDays.firstWhere(
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
                          final weekDay = trainingProgramWeekDays.firstWhere(
                                (w) => w['id'] == weekDayId,
                            orElse: () => <String, dynamic>{},
                          );
                          if (weekDay == null) continue;

                          final week = trainingProgramWeeks.firstWhere(
                                (w) => w['id'] == weekDay['trainingProgramWeek'],
                            orElse: () => <String, dynamic>{},
                          );
                          if (week == null) continue;

                          final programId = int.tryParse(week['trainingProgram'].toString());
                          if (programId == null) continue;

                          groupedByProgram.putIfAbsent(programId, () => []).add(exerciseEntry);
                        }


                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Запланированные тренировки',
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                child: ListView(
                                  padding: const EdgeInsets.all(16),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: groupedByProgram.entries
                                      .where((e) => e.value.isNotEmpty)
                                      .map((entry) {
                                    final programMap = trainingPrograms.firstWhere(
                                          (p) => p['id'] == entry.key,
                                      orElse: () => <String, dynamic>{},
                                    );
                                    if (programMap.isEmpty) return const SizedBox.shrink();

                                    final programExercises = entry.value;

                                    return renderProgram(programMap, programExercises);
                                  }).toList(),
                                ),
                                // child: Container(
                                //   width: double.infinity,
                                //   decoration: BoxDecoration(
                                //     color: FlutterFlowTheme.of(context).secondary,
                                //     borderRadius: BorderRadius.circular(12.0),
                                //   ),
                                //   child: Padding(
                                //     padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                //     child: Column(
                                //       mainAxisSize: MainAxisSize.max,
                                //       children: [
                                //         Padding(
                                //           padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                //           child: Row(
                                //             mainAxisSize: MainAxisSize.max,
                                //             children: [
                                //               Expanded(
                                //                 child: Text(
                                //                   'Верхняя часть тела',
                                //                   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //                     font: GoogleFonts.unbounded(
                                //                       fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                     ),
                                //                     letterSpacing: 0.0,
                                //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                   ),
                                //                 ),
                                //               ),
                                //               Container(
                                //                 decoration: BoxDecoration(
                                //                   color: Color(0x20E27B00),
                                //                   borderRadius: BorderRadius.circular(100.0),
                                //                 ),
                                //                 child: Padding(
                                //                   padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                //                   child: Row(
                                //                     mainAxisSize: MainAxisSize.max,
                                //                     children: [
                                //                       ClipRRect(
                                //                         borderRadius: BorderRadius.circular(0.0),
                                //                         child: SvgPicture.asset(
                                //                           'assets/images/circle_gradient.svg',
                                //                           width: 6.0,
                                //                           height: 6.0,
                                //                           fit: BoxFit.cover,
                                //                         ),
                                //                       ),
                                //                       Padding(
                                //                         padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                //                         child: Text(
                                //                           'Текущая',
                                //                           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //                             font: GoogleFonts.unbounded(
                                //                               fontWeight: FontWeight.w600,
                                //                               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                             ),
                                //                             color: FlutterFlowTheme.of(context).primary,
                                //                             fontSize: 12.0,
                                //                             letterSpacing: 0.0,
                                //                             fontWeight: FontWeight.w600,
                                //                             fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                 ),
                                //               ),
                                //             ],
                                //           ),
                                //         ),
                                //         Align(
                                //           alignment: AlignmentDirectional(-1.0, 0.0),
                                //           child: Padding(
                                //             padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                                //             child: Wrap(
                                //               spacing: 4.0,
                                //               runSpacing: 4.0,
                                //               alignment: WrapAlignment.start,
                                //               crossAxisAlignment: WrapCrossAlignment.start,
                                //               direction: Axis.horizontal,
                                //               runAlignment: WrapAlignment.start,
                                //               verticalDirection: VerticalDirection.down,
                                //               clipBehavior: Clip.none,
                                //               children: [
                                //                 Row(
                                //                   mainAxisSize: MainAxisSize.min,
                                //                   children: [
                                //                     Padding(
                                //                       padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                //                       child: ClipRRect(
                                //                         borderRadius: BorderRadius.circular(0.0),
                                //                         child: SvgPicture.asset(
                                //                           'assets/images/Dumbbells.svg',
                                //                           width: 14.0,
                                //                           height: 14.0,
                                //                           fit: BoxFit.cover,
                                //                         ),
                                //                       ),
                                //                     ),
                                //                     Text(
                                //                       '4 упражнений',
                                //                       style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //                         font: GoogleFonts.inter(
                                //                           fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //                           fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                         ),
                                //                         color: FlutterFlowTheme.of(context).secondaryText,
                                //                         fontSize: 13.0,
                                //                         letterSpacing: 0.0,
                                //                         fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //                 Row(
                                //                   mainAxisSize: MainAxisSize.min,
                                //                   children: [
                                //                     Padding(
                                //                       padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                //                       child: ClipRRect(
                                //                         borderRadius: BorderRadius.circular(0.0),
                                //                         child: SvgPicture.asset(
                                //                           'assets/images/Calendar01.svg',
                                //                           width: 14.0,
                                //                           height: 14.0,
                                //                           fit: BoxFit.cover,
                                //                         ),
                                //                       ),
                                //                     ),
                                //                     Text(
                                //                       '45 мин',
                                //                       style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //                         font: GoogleFonts.inter(
                                //                           fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //                           fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                         ),
                                //                         color: FlutterFlowTheme.of(context).secondaryText,
                                //                         fontSize: 13.0,
                                //                         letterSpacing: 0.0,
                                //                         fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ),
                                //         Padding(
                                //           padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                                //           child: Container(
                                //             width: double.infinity,
                                //             height: 1.0,
                                //             decoration: BoxDecoration(
                                //               color: Color(0xFF302E36),
                                //             ),
                                //           ),
                                //         ),
                                //         Padding(
                                //           padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                //           child: Column(
                                //             mainAxisSize: MainAxisSize.max,
                                //             children: [
                                //               Padding(
                                //                 padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                //                 child: Row(
                                //                   mainAxisSize: MainAxisSize.max,
                                //                   children: [
                                //                     Container(
                                //                       width: 32.0,
                                //                       height: 32.0,
                                //                       decoration: BoxDecoration(
                                //                         color: Color(0xFF1A191D),
                                //                         borderRadius: BorderRadius.circular(12.0),
                                //                       ),
                                //                       child: Align(
                                //                         alignment: AlignmentDirectional(0.0, 0.0),
                                //                         child: Text(
                                //                           '1',
                                //                           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //                             font: GoogleFonts.unbounded(
                                //                               fontWeight: FontWeight.w600,
                                //                               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                             ),
                                //                             color: FlutterFlowTheme.of(context).secondaryText,
                                //                             fontSize: 11.0,
                                //                             letterSpacing: 0.0,
                                //                             fontWeight: FontWeight.w600,
                                //                             fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ),
                                //                     Padding(
                                //                       padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                //                       child: Column(
                                //                         mainAxisSize: MainAxisSize.max,
                                //                         crossAxisAlignment: CrossAxisAlignment.start,
                                //                         children: [
                                //                           Text(
                                //                             'Жим гантелей',
                                //                             style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //                               font: GoogleFonts.unbounded(
                                //                                 fontWeight: FontWeight.w600,
                                //                                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                               ),
                                //                               fontSize: 12.0,
                                //                               letterSpacing: 0.0,
                                //                               fontWeight: FontWeight.w600,
                                //                               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                             ),
                                //                           ),
                                //                           Text(
                                //                             '3×12 - 35 кг',
                                //                             style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //                               font: GoogleFonts.inter(
                                //                                 fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //                                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                               ),
                                //                               color: FlutterFlowTheme.of(context).secondaryText,
                                //                               fontSize: 13.0,
                                //                               letterSpacing: 0.0,
                                //                               fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //                               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                             ),
                                //                           ),
                                //                         ],
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //               Padding(
                                //                 padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                //                 child: Row(
                                //                   mainAxisSize: MainAxisSize.max,
                                //                   children: [
                                //                     Container(
                                //                       width: 32.0,
                                //                       height: 32.0,
                                //                       decoration: BoxDecoration(
                                //                         color: Color(0xFF1A191D),
                                //                         borderRadius: BorderRadius.circular(12.0),
                                //                       ),
                                //                       child: Align(
                                //                         alignment: AlignmentDirectional(0.0, 0.0),
                                //                         child: Text(
                                //                           '2',
                                //                           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //                             font: GoogleFonts.unbounded(
                                //                               fontWeight: FontWeight.w600,
                                //                               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                             ),
                                //                             color: FlutterFlowTheme.of(context).secondaryText,
                                //                             fontSize: 11.0,
                                //                             letterSpacing: 0.0,
                                //                             fontWeight: FontWeight.w600,
                                //                             fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ),
                                //                     Padding(
                                //                       padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                //                       child: Column(
                                //                         mainAxisSize: MainAxisSize.max,
                                //                         crossAxisAlignment: CrossAxisAlignment.start,
                                //                         children: [
                                //                           Text(
                                //                             'Тяга верхнего блока',
                                //                             style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //                               font: GoogleFonts.unbounded(
                                //                                 fontWeight: FontWeight.w600,
                                //                                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                               ),
                                //                               fontSize: 12.0,
                                //                               letterSpacing: 0.0,
                                //                               fontWeight: FontWeight.w600,
                                //                               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                             ),
                                //                           ),
                                //                           Text(
                                //                             '3×12 - 35 кг',
                                //                             style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //                               font: GoogleFonts.inter(
                                //                                 fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //                                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                               ),
                                //                               color: FlutterFlowTheme.of(context).secondaryText,
                                //                               fontSize: 13.0,
                                //                               letterSpacing: 0.0,
                                //                               fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //                               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                             ),
                                //                           ),
                                //                         ],
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //               Padding(
                                //                 padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                //                 child: Row(
                                //                   mainAxisSize: MainAxisSize.max,
                                //                   children: [
                                //                     Container(
                                //                       width: 32.0,
                                //                       height: 32.0,
                                //                       decoration: BoxDecoration(
                                //                         color: Color(0xFF1A191D),
                                //                         borderRadius: BorderRadius.circular(12.0),
                                //                       ),
                                //                       child: Align(
                                //                         alignment: AlignmentDirectional(0.0, 0.0),
                                //                         child: Text(
                                //                           '3',
                                //                           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //                             font: GoogleFonts.unbounded(
                                //                               fontWeight: FontWeight.w600,
                                //                               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                             ),
                                //                             color: FlutterFlowTheme.of(context).secondaryText,
                                //                             fontSize: 11.0,
                                //                             letterSpacing: 0.0,
                                //                             fontWeight: FontWeight.w600,
                                //                             fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                           ),
                                //                         ),
                                //                       ),
                                //                     ),
                                //                     Padding(
                                //                       padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                //                       child: Column(
                                //                         mainAxisSize: MainAxisSize.max,
                                //                         crossAxisAlignment: CrossAxisAlignment.start,
                                //                         children: [
                                //                           Text(
                                //                             'Разведение рук с гантелями',
                                //                             style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //                               font: GoogleFonts.unbounded(
                                //                                 fontWeight: FontWeight.w600,
                                //                                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                               ),
                                //                               fontSize: 12.0,
                                //                               letterSpacing: 0.0,
                                //                               fontWeight: FontWeight.w600,
                                //                               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                             ),
                                //                           ),
                                //                           Text(
                                //                             '3×12 - 35 кг',
                                //                             style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //                               font: GoogleFonts.inter(
                                //                                 fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //                                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                               ),
                                //                               color: FlutterFlowTheme.of(context).secondaryText,
                                //                               fontSize: 13.0,
                                //                               letterSpacing: 0.0,
                                //                               fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //                               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                             ),
                                //                           ),
                                //                         ],
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //             ].divide(SizedBox(height: 8.0)),
                                //           ),
                                //         ),
                                //         Padding(
                                //           padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                //           child: InkWell(
                                //             splashColor: Colors.transparent,
                                //             focusColor: Colors.transparent,
                                //             hoverColor: Colors.transparent,
                                //             highlightColor: Colors.transparent,
                                //             onTap: () async {
                                //               context.safePop();
                                //             },
                                //             child: Container(
                                //               width: double.infinity,
                                //               height: 42.0,
                                //               decoration: BoxDecoration(
                                //                 color: FlutterFlowTheme.of(context).primary,
                                //                 borderRadius: BorderRadius.only(
                                //                   bottomLeft: Radius.circular(12.0),
                                //                   bottomRight: Radius.circular(12.0),
                                //                   topLeft: Radius.circular(0.0),
                                //                   topRight: Radius.circular(0.0),
                                //                 ),
                                //               ),
                                //               child: Row(
                                //                 mainAxisSize: MainAxisSize.max,
                                //                 mainAxisAlignment: MainAxisAlignment.center,
                                //                 children: [
                                //                   Padding(
                                //                     padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                //                     child: ClipRRect(
                                //                       borderRadius: BorderRadius.circular(0.0),
                                //                       child: SvgPicture.asset(
                                //                         'assets/images/Dumbbell.svg',
                                //                         width: 16.0,
                                //                         height: 16.0,
                                //                         fit: BoxFit.cover,
                                //                       ),
                                //                     ),
                                //                   ),
                                //                   Text(
                                //                     'Начать тренировку',
                                //                     style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //                       font: GoogleFonts.unbounded(
                                //                         fontWeight: FontWeight.w600,
                                //                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                       ),
                                //                       letterSpacing: 0.0,
                                //                       fontWeight: FontWeight.w600,
                                //                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //                     ),
                                //                   ),
                                //                 ],
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                              ),
                            ],
                          ),
                        );
                      },

                    ),
                  //MARK: Выполненные тренировки (Динамический блок)
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            'Выполненные тренировки',
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
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                            child: Text(
                              dateTimeFormat(
                                "d MMM",
                                currentDate,
                                locale: "ru",
                              ),
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
                      ],
                    ),
                  ),
                  if (completedWorkoutResult != null) ...[
                    renderWorkoutDone(completedWorkoutResult),
                  ]
                  //MARK: Блок с тренировками которые выполнены (статический пример)
                  else
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: const Color(0xFF302E36),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(0.0),
                                        child: SvgPicture.asset(
                                          'assets/images/menu01_uns.svg',
                                          width: 32.0,
                                          height: 32.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    //MARK: Нет записей о тренировках в выбранный день
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 16.0),
                                      child: Text(
                                        'На этот день нет записей о тренировках',
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Padding(
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
                          //           Padding(
                          //             padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                          //             child: Row(
                          //               mainAxisSize: MainAxisSize.max,
                          //               children: [
                          //                 Expanded(
                          //                   child: Text(
                          //                     'Верхняя часть тела',
                          //                     style: FlutterFlowTheme.of(context).bodyMedium.override(
                          //                           font: GoogleFonts.unbounded(
                          //                             fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          //                             fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                           ),
                          //                           letterSpacing: 0.0,
                          //                           fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          //                           fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                         ),
                          //                   ),
                          //                 ),
                          //                 Container(
                          //                   decoration: BoxDecoration(
                          //                     color: Color(0x2136CF77),
                          //                     borderRadius: BorderRadius.circular(100.0),
                          //                   ),
                          //                   child: Padding(
                          //                     padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                          //                     child: Row(
                          //                       mainAxisSize: MainAxisSize.max,
                          //                       children: [
                          //                         Text(
                          //                           dateTimeFormat(
                          //                             "d MMM",
                          //                             currentDate,
                          //                             locale: "ru",
                          //                           ),
                          //                           style: FlutterFlowTheme.of(context).bodyMedium.override(
                          //                                 font: GoogleFonts.unbounded(
                          //                                   fontWeight: FontWeight.w600,
                          //                                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                                 ),
                          //                                 color: Color(0xFF36CF77),
                          //                                 fontSize: 12.0,
                          //                                 letterSpacing: 0.0,
                          //                                 fontWeight: FontWeight.w600,
                          //                                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                               ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
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
                          //             padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                          //             child: Column(
                          //               mainAxisSize: MainAxisSize.max,
                          //               children: [
                          //                 Padding(
                          //                   padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                          //                   child: Row(
                          //                     mainAxisSize: MainAxisSize.max,
                          //                     children: [
                          //                       Expanded(
                          //                         child: Text(
                          //                           'Жим гантелей',
                          //                           style: FlutterFlowTheme.of(context).bodyMedium.override(
                          //                                 font: GoogleFonts.inter(
                          //                                   fontWeight: FontWeight.w600,
                          //                                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                                 ),
                          //                                 color: FlutterFlowTheme.of(context).secondaryText,
                          //                                 fontSize: 14.0,
                          //                                 letterSpacing: 0.0,
                          //                                 fontWeight: FontWeight.w600,
                          //                                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                               ),
                          //                         ),
                          //                       ),
                          //                       Row(
                          //                         mainAxisSize: MainAxisSize.max,
                          //                         children: [
                          //                           Container(
                          //                             decoration: BoxDecoration(
                          //                               color: Color(0x21FFCE49),
                          //                               borderRadius: BorderRadius.circular(100.0),
                          //                             ),
                          //                             child: Padding(
                          //                               padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                          //                               child: Text(
                          //                                 '3х10',
                          //                                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                          //                                       font: GoogleFonts.inter(
                          //                                         fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          //                                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                                       ),
                          //                                       color: Color(0xFFFFCE49),
                          //                                       fontSize: 13.0,
                          //                                       letterSpacing: 0.0,
                          //                                       fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          //                                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                                     ),
                          //                               ),
                          //                             ),
                          //                           ),
                          //                           Container(
                          //                             decoration: BoxDecoration(
                          //                               color: Color(0x21FFCE49),
                          //                               borderRadius: BorderRadius.circular(100.0),
                          //                             ),
                          //                             child: Padding(
                          //                               padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                          //                               child: Text(
                          //                                 '10 кг',
                          //                                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                          //                                       font: GoogleFonts.inter(
                          //                                         fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          //                                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                                       ),
                          //                                       color: Color(0xFFFFCE49),
                          //                                       fontSize: 13.0,
                          //                                       letterSpacing: 0.0,
                          //                                       fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          //                                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                                     ),
                          //                               ),
                          //                             ),
                          //                           ),
                          //                         ].divide(SizedBox(width: 8.0)),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //                 Padding(
                          //                   padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                          //                   child: Row(
                          //                     mainAxisSize: MainAxisSize.max,
                          //                     children: [
                          //                       Expanded(
                          //                         child: Text(
                          //                           'Тяга верхнего блока',
                          //                           style: FlutterFlowTheme.of(context).bodyMedium.override(
                          //                                 font: GoogleFonts.inter(
                          //                                   fontWeight: FontWeight.w600,
                          //                                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                                 ),
                          //                                 color: FlutterFlowTheme.of(context).secondaryText,
                          //                                 fontSize: 14.0,
                          //                                 letterSpacing: 0.0,
                          //                                 fontWeight: FontWeight.w600,
                          //                                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                               ),
                          //                         ),
                          //                       ),
                          //                       Row(
                          //                         mainAxisSize: MainAxisSize.max,
                          //                         children: [
                          //                           Container(
                          //                             decoration: BoxDecoration(
                          //                               color: Color(0x21FFCE49),
                          //                               borderRadius: BorderRadius.circular(100.0),
                          //                             ),
                          //                             child: Padding(
                          //                               padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                          //                               child: Text(
                          //                                 '3х10',
                          //                                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                          //                                       font: GoogleFonts.inter(
                          //                                         fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          //                                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                                       ),
                          //                                       color: Color(0xFFFFCE49),
                          //                                       fontSize: 13.0,
                          //                                       letterSpacing: 0.0,
                          //                                       fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          //                                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                                     ),
                          //                               ),
                          //                             ),
                          //                           ),
                          //                           Container(
                          //                             decoration: BoxDecoration(
                          //                               color: Color(0x21FFCE49),
                          //                               borderRadius: BorderRadius.circular(100.0),
                          //                             ),
                          //                             child: Padding(
                          //                               padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                          //                               child: Text(
                          //                                 '10 кг',
                          //                                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                          //                                       font: GoogleFonts.inter(
                          //                                         fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          //                                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                                       ),
                          //                                       color: Color(0xFFFFCE49),
                          //                                       fontSize: 13.0,
                          //                                       letterSpacing: 0.0,
                          //                                       fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          //                                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                                     ),
                          //                               ),
                          //                             ),
                          //                           ),
                          //                         ].divide(SizedBox(width: 8.0)),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //                 Padding(
                          //                   padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                          //                   child: Row(
                          //                     mainAxisSize: MainAxisSize.max,
                          //                     children: [
                          //                       Expanded(
                          //                         child: Text(
                          //                           'Разведение рук с гантелями',
                          //                           style: FlutterFlowTheme.of(context).bodyMedium.override(
                          //                                 font: GoogleFonts.inter(
                          //                                   fontWeight: FontWeight.w600,
                          //                                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                                 ),
                          //                                 color: FlutterFlowTheme.of(context).secondaryText,
                          //                                 fontSize: 14.0,
                          //                                 letterSpacing: 0.0,
                          //                                 fontWeight: FontWeight.w600,
                          //                                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                               ),
                          //                         ),
                          //                       ),
                          //                       Row(
                          //                         mainAxisSize: MainAxisSize.max,
                          //                         children: [
                          //                           Container(
                          //                             decoration: BoxDecoration(
                          //                               color: Color(0x21FFCE49),
                          //                               borderRadius: BorderRadius.circular(100.0),
                          //                             ),
                          //                             child: Padding(
                          //                               padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                          //                               child: Text(
                          //                                 '3х10',
                          //                                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                          //                                       font: GoogleFonts.inter(
                          //                                         fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          //                                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                                       ),
                          //                                       color: Color(0xFFFFCE49),
                          //                                       fontSize: 13.0,
                          //                                       letterSpacing: 0.0,
                          //                                       fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          //                                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                                     ),
                          //                               ),
                          //                             ),
                          //                           ),
                          //                           Container(
                          //                             decoration: BoxDecoration(
                          //                               color: Color(0x21FFCE49),
                          //                               borderRadius: BorderRadius.circular(100.0),
                          //                             ),
                          //                             child: Padding(
                          //                               padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                          //                               child: Text(
                          //                                 '10 кг',
                          //                                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                          //                                       font: GoogleFonts.inter(
                          //                                         fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          //                                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                                       ),
                          //                                       color: Color(0xFFFFCE49),
                          //                                       fontSize: 13.0,
                          //                                       letterSpacing: 0.0,
                          //                                       fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          //                                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                                     ),
                          //                               ),
                          //                             ),
                          //                           ),
                          //                         ].divide(SizedBox(width: 8.0)),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //               ].divide(SizedBox(height: 8.0)),
                          //             ),
                          //           ),
                          //           Padding(
                          //             padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                          //             child: InkWell(
                          //               splashColor: Colors.transparent,
                          //               focusColor: Colors.transparent,
                          //               hoverColor: Colors.transparent,
                          //               highlightColor: Colors.transparent,
                          //               onTap: () async {
                          //                 context.safePop();
                          //               },
                          //               child: Container(
                          //                 width: double.infinity,
                          //                 height: 42.0,
                          //                 decoration: BoxDecoration(
                          //                   color: Color(0x1EE27B00),
                          //                   borderRadius: BorderRadius.only(
                          //                     bottomLeft: Radius.circular(12.0),
                          //                     bottomRight: Radius.circular(12.0),
                          //                     topLeft: Radius.circular(0.0),
                          //                     topRight: Radius.circular(0.0),
                          //                   ),
                          //                 ),
                          //                 child: Row(
                          //                   mainAxisSize: MainAxisSize.max,
                          //                   mainAxisAlignment: MainAxisAlignment.center,
                          //                   children: [
                          //                     Padding(
                          //                       padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                          //                       child: Icon(
                          //                         Icons.add,
                          //                         color: FlutterFlowTheme.of(context).primary,
                          //                         size: 24.0,
                          //                       ),
                          //                     ),
                          //                     Text(
                          //                       'Добавить упражнение',
                          //                       style: FlutterFlowTheme.of(context).bodyMedium.override(
                          //                             font: GoogleFonts.unbounded(
                          //                               fontWeight: FontWeight.w600,
                          //                               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                             ),
                          //                             color: FlutterFlowTheme.of(context).primary,
                          //                             letterSpacing: 0.0,
                          //                             fontWeight: FontWeight.w600,
                          //                             fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          //                           ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                ].addToEnd(const SizedBox(height: 50.0)),
              ),
            ),
          );
  }

  Widget renderWorkoutDone(Map<String, dynamic>? completedWorkoutResult) {
    print('Программа: ${completedWorkoutResult!['program_id']}');
    print('Время: ${completedWorkoutResult['duration']} сек');
    print('Калории: ${completedWorkoutResult['calories']} ккал');
    for (var i in completedWorkoutExercises) {
      print('зав: $i');
    }

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondary,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FutureBuilder<List<TrainingProgramRow>>(
                        future: TrainingProgramTable().querySingleRow(
                          queryFn: (q) => q.eqOrNull(
                            'id',
                            completedWorkoutResult['program_id'],
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
                          List<TrainingProgramRow> containerTrainingProgramRowList = snapshot.data!;

                          final containerTrainingProgramRow = containerTrainingProgramRowList.isNotEmpty ? containerTrainingProgramRowList.first : null;
                          return Text(
                            '${containerTrainingProgramRow?.name}',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.unbounded(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          );
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0x2136CF77),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              dateTimeFormat(
                                "d MMM",
                                currentDate,
                                locale: "ru",
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.unbounded(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    color: const Color(0xFF36CF77),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFF302E36),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: completedWorkoutExercises.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return FutureBuilder<List<ExerciseRow>>(
                          future: ExerciseTable().querySingleRow(
                            queryFn: (q) => q.eqOrNull(
                              'id',
                              completedWorkoutExercises[index]["id"],
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

                            return Container(
                              margin: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      containerExerciseRow?.name ?? "-",
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0x21FFCE49),
                                          borderRadius: BorderRadius.circular(100.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                          child: Text(
                                            '${containerExerciseRow?.approach}х${containerExerciseRow?.repetitions}',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                              color: const Color(0xFFFFCE49),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0x21FFCE49),
                                          borderRadius: BorderRadius.circular(100.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                          child: Text(
                                            '${containerExerciseRow?.weight} кг',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                              color: const Color(0xFFFFCE49),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 8.0)),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ].divide(const SizedBox(height: 8.0)),
                ),
              ),
              // Padding(
              //   padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              //   child: InkWell(
              //     splashColor: Colors.transparent,
              //     focusColor: Colors.transparent,
              //     hoverColor: Colors.transparent,
              //     highlightColor: Colors.transparent,
              //     onTap: () async {
              //       context.safePop();
              //     },
              //     child: Container(
              //       width: double.infinity,
              //       height: 42.0,
              //       decoration: BoxDecoration(
              //         color: Color(0x1EE27B00),
              //         borderRadius: BorderRadius.only(
              //           bottomLeft: Radius.circular(12.0),
              //           bottomRight: Radius.circular(12.0),
              //           topLeft: Radius.circular(0.0),
              //           topRight: Radius.circular(0.0),
              //         ),
              //       ),
              //       child: Row(
              //         mainAxisSize: MainAxisSize.max,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Padding(
              //             padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
              //             child: Icon(
              //               Icons.add,
              //               color: FlutterFlowTheme.of(context).primary,
              //               size: 24.0,
              //             ),
              //           ),
              //           Text(
              //             'Добавить упражнение',
              //             style: FlutterFlowTheme.of(context).bodyMedium.override(
              //               font: GoogleFonts.unbounded(
              //                 fontWeight: FontWeight.w600,
              //                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //               ),
              //               color: FlutterFlowTheme.of(context).primary,
              //               letterSpacing: 0.0,
              //               fontWeight: FontWeight.w600,
              //               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  DateTime _previousWeek(DateTime week) {
    return week.subtract(const Duration(days: 7));
  }

  DateTime _nextWeek(DateTime week) {
    return week.add(const Duration(days: 7));
  }

  DateTime _previousMonth(DateTime month) {
    if (month.month == 1) {
      return DateTime(month.year - 1, 12);
    } else {
      return DateTime(month.year, month.month - 1);
    }
  }

  DateTime _nextMonth(DateTime month) {
    if (month.month == 12) {
      return DateTime(month.year + 1, 1);
    } else {
      return DateTime(month.year, month.month + 1);
    }
  }

  void setSelectedDay(
    DateTime? newSelectedDay, [
    DateTime? newSelectedEnd,
  ]) {
    // final newRange = newSelectedDay == null
    //     ? null
    //     : DateTimeRange(
    //         start: newSelectedDay.startOfDay,
    //         end: newSelectedEnd ?? newSelectedDay.endOfDay,
    //       );
    setState(() {
      currentDate = newSelectedDay ?? currentDate;
      // Очистить старые данные о завершенной тренировке
      completedWorkoutResult = null;
      completedWorkoutExercises = [];
    });
    // После выбора даты — запросить данные о выполненной тренировке
    _fetchCompletedWorkoutForDate(currentDate!);
  }

  Future<void> _fetchCompletedWorkoutForDate(DateTime date) async {
    final userId = currentUserUid;

    // Форматируем дату начала и конца дня
    final dayStart = DateTime(date.year, date.month, date.day);
    final dayEnd = dayStart.add(const Duration(days: 1));

    final resultResponse = await AppSupabase.instance.client.from('user_workout_result').select().eq('user_id', userId).gte('completed_at', dayStart.toIso8601String()).lt('completed_at', dayEnd.toIso8601String()).maybeSingle();

    if (resultResponse == null) {
      setState(() {
        completedWorkoutResult = null;
        completedWorkoutExercises = [];
      });
      return;
    }

    final exercisesResponse = await AppSupabase.instance.client.from('user_workout_exercise').select().eq('workout_result_id', resultResponse['id']);

    setState(() {
      completedWorkoutResult = resultResponse;
      completedWorkoutExercises = exercisesResponse;
    });
  }

  Set<DateTime> markedDaysThisWeek() {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));

    return workoutDays.map((weekday) {
      return DateTime.utc(
        monday.year,
        monday.month,
        monday.day + (weekday - 1),
      );
    }).toSet();
  }

  Widget renderProgram(dynamic programMap, List<Map<String, dynamic>> programExercises) {
    final List<ExerciseRow> programExerciseObjects = programExercises
        .map((entry) {
      final exercise = exercises.firstWhere(
            (e) => e['id'] == entry['exercise'],
        orElse: () => <String, dynamic>{}, // заменили null на пустую Map
      );
      if (exercise.isEmpty) return null; // проверка, что не пустая
      return ExerciseRow(exercise);
    })
        .whereType<ExerciseRow>() // удаляет null
        .toList();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondary,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
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
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFF302E36),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ...programExercises.asMap().entries.map((entry) {
                      final index = entry.key;
                      final exerciseEntry = entry.value;
                      final exercise = exercises.firstWhere(
                            (e) => e['id'] == exerciseEntry['exercise'],
                        orElse: () => <String, dynamic>{},
                      );
                      if (exercise.isEmpty) return const SizedBox.shrink();

                      return Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A191D),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
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
                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
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
                    }),
                  ].divide(const SizedBox(height: 8.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {

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
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
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
