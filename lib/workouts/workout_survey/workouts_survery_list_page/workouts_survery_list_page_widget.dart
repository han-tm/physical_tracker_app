import 'package:boom_client/userData/PreRegistrationStorage.dart';

import '../../../userData/PreRegistrationData.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'workouts_survery_list_page_model.dart';
export 'workouts_survery_list_page_model.dart';

class WorkoutsSurveryListPageWidget extends StatefulWidget {
  const WorkoutsSurveryListPageWidget({super.key});

  static String routeName = 'WorkoutsSurveryListPage';
  static String routePath = '/workoutsSurveryListPage';

  @override
  State<WorkoutsSurveryListPageWidget> createState() => _WorkoutsSurveryListPageWidgetState();
}

class _WorkoutsSurveryListPageWidgetState extends State<WorkoutsSurveryListPageWidget> {
  late WorkoutsSurveryListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  PreRegistrationData? initSurvey;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsSurveryListPageModel());
    initStorage();
  }

  void initStorage() async {
    initSurvey = await PreRegistrationStorage.load();
    print('initSurvey: $initSurvey');
    if (initSurvey != null) {
      final state = FFAppState();
      state.shoulderGirth = initSurvey!.shoulders;
      state.chestGirth = initSurvey!.chest;
      state.waistGirth = initSurvey!.waist;
      state.abdomenGirth = initSurvey!.belly;
      state.thighGirth = initSurvey!.thigh;
      state.hipsGirth = initSurvey!.hips;
      state.photoBack = initSurvey!.photoBack?.path;
      state.photoFront = initSurvey!.photoFront?.path;
      state.photoSide = initSurvey!.photoSide?.path;
      setState(() {});
    }
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
              wrapWithModel(
                model: _model.generalNavBar01Model,
                updateCallback: () => safeSetState(() {}),
                child: const GeneralNavBar01Widget(
                  title: 'Опрос',
                  hideBack: false,
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                              child: Text(
                                'Чем подробней вы дадите информацию, тем более детально и точно мне сделаем вам программу',
                                textAlign: TextAlign.start,
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
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed(WorkoutsSurveyBodyMeasurementsPageWidget.routeName);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondary,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Замеры тела',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            size: 18.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.pushNamed(WorkoutsSurveyStep09PageWidget.routeName);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondary,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Фото',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            size: 18.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                     context.pushNamed(WorkoutsSurveyStep01PageWidget.routeName);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 48.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondary,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Цель',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.safePop();
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: const Color(0x21E27B00),
                                                    borderRadius: BorderRadius.circular(100.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme.of(context).primary,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                    child: Text(
                                                      'Похудение',
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            font: GoogleFonts.unbounded(
                                                              fontWeight: FontWeight.w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme.of(context).primary,
                                                            fontSize: 13.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FontWeight.w600,
                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                  child: Icon(
                                                    Icons.close,
                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            size: 18.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Ограничения',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.safePop();
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: const Color(0x21E27B00),
                                                  borderRadius: BorderRadius.circular(100.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(context).primary,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                  child: Text(
                                                    'Сколиоз',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          font: GoogleFonts.unbounded(
                                                            fontWeight: FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme.of(context).primary,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          size: 18.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Дата начала следующего цикла',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.safePop();
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: const Color(0x21E27B00),
                                                  borderRadius: BorderRadius.circular(100.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(context).primary,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                  child: Text(
                                                    '05.08',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          font: GoogleFonts.unbounded(
                                                            fontWeight: FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme.of(context).primary,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          size: 18.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Опыт в тренировках',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.safePop();
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: const Color(0x21E27B00),
                                                  borderRadius: BorderRadius.circular(100.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(context).primary,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                  child: Text(
                                                    '2 недели/бег',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          font: GoogleFonts.unbounded(
                                                            fontWeight: FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme.of(context).primary,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          size: 18.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Какие веса берете?',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.safePop();
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: const Color(0x21E27B00),
                                                  borderRadius: BorderRadius.circular(100.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(context).primary,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                  child: Text(
                                                    'Похудение',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          font: GoogleFonts.unbounded(
                                                            fontWeight: FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme.of(context).primary,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          size: 18.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Акцентная часть тела',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.safePop();
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: const Color(0x21E27B00),
                                                  borderRadius: BorderRadius.circular(100.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(context).primary,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                  child: Text(
                                                    'Ягодицы',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          font: GoogleFonts.unbounded(
                                                            fontWeight: FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme.of(context).primary,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          size: 18.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 48.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Что не трогать',
                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.safePop();
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: const Color(0x21E27B00),
                                                  borderRadius: BorderRadius.circular(100.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(context).primary,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                  child: Text(
                                                    'Спина',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          font: GoogleFonts.unbounded(
                                                            fontWeight: FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme.of(context).primary,
                                                          fontSize: 13.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons.close,
                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          size: 18.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 16.0)),
                            ),
                          ],
                        ),
                      ),
                    ],
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
