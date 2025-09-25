import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/general_button_widget.dart';
import '../../../components/radio_button_widget.dart';
import '../../../index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'workouts_survey_step06_page_model.dart';
export 'workouts_survey_step06_page_model.dart';

class WorkoutsSurveyStep06PageWidget extends StatefulWidget {
  const WorkoutsSurveyStep06PageWidget({super.key});

  static String routeName = 'WorkoutsSurveyStep06Page';
  static String routePath = '/workoutsSurveyStep06Page';

  @override
  State<WorkoutsSurveyStep06PageWidget> createState() => _WorkoutsSurveyStep06PageWidgetState();
}

class _WorkoutsSurveyStep06PageWidgetState extends State<WorkoutsSurveyStep06PageWidget> {
  late WorkoutsSurveyStep06PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsSurveyStep06PageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   final state = FFAppState();
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
                            'Шаг6/9',
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
                                  'Акцентная часть тела',
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
                                  'На какую часть тела хотите сделать упор?',
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context).secondary,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            state.bodyAccent = 'Ягодицы';
                                            safeSetState(() {});
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RadioButtonWidget(checked: state.bodyAccent == 'Ягодицы'),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Ягодицы',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          font: GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(height: 0, thickness: 1, color: FlutterFlowTheme.of(context).secondary),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            state.bodyAccent = 'Плечи';
                                            safeSetState(() {});
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RadioButtonWidget(checked: state.bodyAccent == 'Плечи'),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Плечи',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          font: GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(height: 0, thickness: 1, color: FlutterFlowTheme.of(context).secondary),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            state.bodyAccent = 'Спина';
                                            safeSetState(() {});
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RadioButtonWidget(checked: state.bodyAccent == 'Спина'),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Спина',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          font: GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(height: 0, thickness: 1, color: FlutterFlowTheme.of(context).secondary),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            state.bodyAccent = 'Руки';
                                            safeSetState(() {});
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RadioButtonWidget(checked: state.bodyAccent == 'Руки'),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Руки',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          font: GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Divider(height: 0, thickness: 1, color: FlutterFlowTheme.of(context).secondary),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            state.bodyAccent = 'Все';
                                            safeSetState(() {});
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RadioButtonWidget(checked: state.bodyAccent == 'Все'),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Все',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          font: GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                  ),
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
                    isActive: state.bodyAccent != null,
                    onTap: () async {
                      context.pushNamed(WorkoutsSurveyStep07PageWidget.routeName);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
