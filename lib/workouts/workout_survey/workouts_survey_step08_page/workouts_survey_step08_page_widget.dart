import 'package:boom_client/components/general_button_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/radio_button_widget.dart';
import '../../../index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'workouts_survey_step08_page_model.dart';
export 'workouts_survey_step08_page_model.dart';

class WorkoutsSurveyStep08PageWidget extends StatefulWidget {
  const WorkoutsSurveyStep08PageWidget({super.key});

  static String routeName = 'WorkoutsSurveyStep08Page';
  static String routePath = '/workoutsSurveyStep08Page';

  @override
  State<WorkoutsSurveyStep08PageWidget> createState() => _WorkoutsSurveyStep08PageWidgetState();
}

class _WorkoutsSurveyStep08PageWidgetState extends State<WorkoutsSurveyStep08PageWidget> {
  late WorkoutsSurveyStep08PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsSurveyStep08PageModel());
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
                            'Шаг8/9',
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
                                  'КБЖУ',
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
                                  'Умеете ли считать КБЖУ и считаете ли вообще?',
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
                                            state.canCountKBZU = 'Умею и считаю';
                                            safeSetState(() {});
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RadioButtonWidget(checked: state.canCountKBZU == 'Умею и считаю'),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Умею и считаю',
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
                                            state.canCountKBZU = 'Умею, но не считаю';
                                            safeSetState(() {});
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RadioButtonWidget(checked: state.canCountKBZU == 'Умею, но не считаю'),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Умею, но не считаю',
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
                                            state.canCountKBZU = 'Не умею';
                                            safeSetState(() {});
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RadioButtonWidget(checked: state.canCountKBZU == 'Не умею'),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Не умею',
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
                                            state.canCountKBZU = 'Руки';
                                            safeSetState(() {});
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              RadioButtonWidget(checked: state.canCountKBZU == 'Руки'),
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
                    isActive: state.canCountKBZU != null,
                    onTap: () async {
                      context.pushNamed(WorkoutsSurveyStep09PageWidget.routeName);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
