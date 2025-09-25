import 'package:boom_client/components/measure_add_view_widget.dart';
import 'package:flutter_svg/svg.dart';

import '../../../backend/supabase/supabase.dart';
import '/components/general_button_widget.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'workouts_survey_body_measurements_page_model.dart';
export 'workouts_survey_body_measurements_page_model.dart';

class WorkoutsSurveyBodyMeasurementsPageWidget extends StatefulWidget {
  const WorkoutsSurveyBodyMeasurementsPageWidget({super.key});

  static String routeName = 'WorkoutsSurveyBodyMeasurementsPage';
  static String routePath = '/workoutsSurveyBodyMeasurementsPage';

  @override
  State<WorkoutsSurveyBodyMeasurementsPageWidget> createState() => _WorkoutsSurveyBodyMeasurementsPageWidgetState();
}

class _WorkoutsSurveyBodyMeasurementsPageWidgetState extends State<WorkoutsSurveyBodyMeasurementsPageWidget> {
  late WorkoutsSurveyBodyMeasurementsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsSurveyBodyMeasurementsPageModel());
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
                  title: 'Замеры тела',
                  hideBack: false,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder<List<BodyMeasureRow>>(
                            future: BodyMeasureTable().queryRows(
                              queryFn: (q) => q.gtOrNull(
                                'type',
                                2,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<BodyMeasureRow> containerBodyMeasureRowList = snapshot.data!;

                              return Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final measures = containerBodyMeasureRowList.toList();

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(measures.length, (measuresIndex) {
                                        final measuresItem = measures[measuresIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final initialValue = _getValueForType(measuresItem.type!);

                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor: Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context).unfocus();
                                                  },
                                                  child: Padding(
                                                    padding: MediaQuery.viewInsetsOf(context),
                                                    child: MeasureAddViewWidget(
                                                      measureRow: measuresItem,
                                                      initialValue: initialValue,
                                                      onValueSave: (value) async {
                                                        switch (measuresItem.type) {
                                                          case 3:
                                                            FFAppState().shoulderGirth = value;
                                                            break;
                                                          case 4:
                                                            FFAppState().chestGirth = value;
                                                            break;
                                                          case 5:
                                                            FFAppState().waistGirth = value;
                                                            break;
                                                          case 6:
                                                            FFAppState().abdomenGirth = value;
                                                            break;
                                                          case 7:
                                                            FFAppState().thighGirth = value;
                                                            break;
                                                          case 8:
                                                            FFAppState().hipsGirth = value;
                                                            break;
                                                        }
                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 48.0,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).secondary,
                                              borderRadius: BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          measuresItem.name,
                                                          '-',
                                                        ),
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              font: GoogleFonts.inter(
                                                                fontWeight:
                                                                    FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                              ),
                                                              letterSpacing: 0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      final value = _getValueForType(measuresItem.type!);
                                                      if (value == null) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                          child: Text(
                                                            '-',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.inter(
                                                                    fontWeight: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FlutterFlowTheme.of(context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        );
                                                      } else {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: const Color(0x20E27B00),
                                                              borderRadius: BorderRadius.circular(50.0),
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsetsDirectional.fromSTEB(
                                                                  8.0, 4.0, 8.0, 4.0),
                                                              child: Text(
                                                                '${value % 1 == 0 ? value.toInt().toString() : value.toStringAsFixed(1)} см',
                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                      font: GoogleFonts.unbounded(
                                                                        fontWeight: FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                      fontSize: 12.0,
                                                                      letterSpacing: 0.0,
                                                                      fontWeight: FontWeight.w600,
                                                                      fontStyle: FlutterFlowTheme.of(context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(8.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/arrow_right.svg',
                                                      width: 18.0,
                                                      height: 18.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }).divide(const SizedBox(height: 16.0)),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                child: wrapWithModel(
                  model: _model.generalButtonModel,
                  updateCallback: () => safeSetState(() {}),
                  child: GeneralButtonWidget(
                    title: 'Сохранить',
                    isActive: true,
                    onTap: () async {
                      context.pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double? _getValueForType(int type) {
    switch (type) {
      case 3:
        return FFAppState().shoulderGirth;
      case 4:
        return FFAppState().chestGirth;
      case 5:
        return FFAppState().waistGirth;
      case 6:
        return FFAppState().abdomenGirth;
      case 7:
        return FFAppState().thighGirth;
      case 8:
        return FFAppState().hipsGirth;
      default:
        return null;
    }
  }
}
