import 'package:boom_client/flutter_flow/flutter_flow_calendar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../components/general_button_widget.dart';
import '../../../index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'workouts_survey_step03_page_model.dart';
export 'workouts_survey_step03_page_model.dart';

class WorkoutsSurveyStep03PageWidget extends StatefulWidget {
  const WorkoutsSurveyStep03PageWidget({super.key});

  static String routeName = 'WorkoutsSurveyStep03Page';
  static String routePath = '/workoutsSurveyStep03Page';

  @override
  State<WorkoutsSurveyStep03PageWidget> createState() => _WorkoutsSurveyStep03PageWidgetState();
}

class _WorkoutsSurveyStep03PageWidgetState extends State<WorkoutsSurveyStep03PageWidget> {
  late WorkoutsSurveyStep03PageModel _model;
  DateTime focusedDay = DateTime.now();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsSurveyStep03PageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
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

  @override
  Widget build(BuildContext context) {
     final state = context.watch<FFAppState>();
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/back_button.svg',
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                          child: Text(
                            'Шаг3/9',
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
                      ),
                      Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                              borderRadius: BorderRadius.circular(100.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).secondaryText,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 5.0, 8.0, 5.0),
                              child: Text(
                                'Пропустить',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.unbounded(
                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
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
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  'Дата начала следующего цикла',
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
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  ' Учет даты последнего менструального цикла позволяет адаптировать тренировки под физиологические особенности организма, повышая их эффективность и снижая риски перегрузки.',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 16),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF242328),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  children: [
                                    CalendarHeader(
                                      focusedDay: focusedDay,
                                      onLeftChevronTap: () => setState(
                                        () => focusedDay = _previousMonth(focusedDay),
                                      ),
                                      onRightChevronTap: () => setState(
                                        () => focusedDay = _nextMonth(focusedDay),
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
                                      calendarFormat: CalendarFormat.month,
                                      headerVisible: false,
                                      locale: "ru",
                                      rowHeight: 40,
                                      daysOfWeekHeight: 30,

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
                                        selectedTextStyle: const TextStyle(color: Color(0xFFFAFAFA), fontSize: 16.0)
                                            .merge(FlutterFlowTheme.of(context).titleSmall.override(
                                                  font: GoogleFonts.unbounded(
                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                  ),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                )),
                                        todayTextStyle: const TextStyle(color: Color(0xFFFAFAFA), fontSize: 16.0)
                                            .merge(FlutterFlowTheme.of(context).titleSmall.override(
                                                  font: GoogleFonts.unbounded(
                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                  ),
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                )),
                                        outsideTextStyle: const TextStyle(color: Color(0xFF9E9E9E))
                                            .merge(FlutterFlowTheme.of(context).labelMedium.override(
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
                                          borderRadius: BorderRadius.circular(12),
                                          // borderRadius: BorderRadius.circular(4)
                                        ),
                                        todayDecoration: BoxDecoration(
                                          border: Border.all(color: const Color(0xFF302E36)),
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        markerDecoration: BoxDecoration(
                                          border: Border.all(color: const Color(0xFF302E36)),
                                          borderRadius: BorderRadius.circular(12),
                                          shape: BoxShape.rectangle,
                                        ),
                                        defaultDecoration: BoxDecoration(
                                          border: Border.all(color: const Color(0xFF302E36)),
                                          borderRadius: BorderRadius.circular(12),
                                          shape: BoxShape.rectangle,
                                        ),
                                        disabledDecoration: BoxDecoration(
                                          border: Border.all(color: const Color(0xFF302E36)),
                                          borderRadius: BorderRadius.circular(12),
                                          shape: BoxShape.rectangle,
                                        ),
                                        holidayDecoration: BoxDecoration(
                                          border: Border.all(color: const Color(0xFF302E36)),
                                          borderRadius: BorderRadius.circular(12),
                                          shape: BoxShape.rectangle,
                                        ),
                                        outsideDecoration: BoxDecoration(
                                          border: Border.all(color: const Color(0xFF302E36)),
                                          borderRadius: BorderRadius.circular(12),
                                          shape: BoxShape.rectangle,
                                        ),
                                        weekendDecoration: BoxDecoration(
                                          border: Border.all(color: const Color(0xFF302E36)),
                                          borderRadius: BorderRadius.circular(12),
                                          shape: BoxShape.rectangle,
                                        ),
                                        cellPadding: EdgeInsets.zero,
                                        cellMargin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                                        markersMaxCount: 3,
                                        canMarkersOverflow: true,
                                        tablePadding: const EdgeInsets.only(top: 0),
                                      ),
                                      availableGestures: AvailableGestures.horizontalSwipe,
                                      startingDayOfWeek: StartingDayOfWeek.monday,
                                      daysOfWeekStyle: DaysOfWeekStyle(
                                        dowTextFormatter: (date, locale) =>
                                            '${DateFormat.E(locale).format(date)[0].toUpperCase()}${DateFormat.E(locale).format(date)[1]}',
                                        weekdayStyle: const TextStyle(color: Color(0xFF616161))
                                            .merge(FlutterFlowTheme.of(context).bodyLarge.override(
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
                                        weekendStyle: const TextStyle(color: Color(0xFF616161))
                                            .merge(FlutterFlowTheme.of(context).bodyLarge.override(
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
                                        // if (!isSameDay(currentDate, newSelectedDay)) {
                                        //   setSelectedDay(newSelectedDay);
                                        //   if (focusedDay.startOfDay != focused.startOfDay) {
                                        //     setState(() => focusedDay = focused);
                                        //   }
                                        // }
                                        
                                        setState(() {
                                          focusedDay = focused;
                                          state.nextCycle = focusedDay;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: GeneralButtonWidget(
                    title: "Далее",
                    isActive: state.nextCycle != null,
                    onTap: () async {
                      context.pushNamed(WorkoutsSurveyStep04PageWidget.routeName);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
