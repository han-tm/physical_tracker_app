import 'package:flutter_svg/flutter_svg.dart';

import '../../components/measure_add_view_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/general_button_widget.dart';
import '/components/general_nav_bar01_widget.dart';
import '/components/media_select_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/profile/profile_measurement_successfully_added_page/profile_measurement_successfully_added_page_widget.dart';
import '/profile/profile_weight_view/profile_weight_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_measurement_add_page_model.dart';
export 'profile_measurement_add_page_model.dart';

class ProfileMeasurementAddPageWidget extends StatefulWidget {
  const ProfileMeasurementAddPageWidget({super.key});

  static String routeName = 'ProfileMeasurementAddPage';
  static String routePath = '/profileMeasurementAddPage';

  @override
  State<ProfileMeasurementAddPageWidget> createState() => _ProfileMeasurementAddPageWidgetState();
}

class _ProfileMeasurementAddPageWidgetState extends State<ProfileMeasurementAddPageWidget> {
  late ProfileMeasurementAddPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileMeasurementAddPageModel());
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
                  title: 'Добавление замеров',
                  hideBack: false,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: FutureBuilder<List<BodyMeasureRow>>(
                    future: BodyMeasureTable().queryRows(
                      queryFn: (q) => q.gtOrNull(
                        'type',
                        2,
                      ),
                    ),
                    builder: (context, snapshot) {
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

                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(context),
                                              child: ProfileWeightViewWidget(
                                                  initValue: _model.weight ?? 70,
                                                  onSelect: (value) {
                                                    _model.weight = value;
                                                    setState(() {});
                                                  }
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
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
                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                child: Text(
                                                  'Вес',
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
                                            ),
                                            if (_model.weight == null)
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                child: Text(
                                                  '-',
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
                                            if (_model.weight != null)
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: const Color(0x20E27B00),
                                                    borderRadius: BorderRadius.circular(50.0),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                    child: Text(
                                                      '${formatNumber(
                                                        _model.weight,
                                                        formatType: FormatType.custom,
                                                        format: '###.0#',
                                                        locale: 'ru',
                                                      )} кг',
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        font: GoogleFonts.unbounded(
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                        color: FlutterFlowTheme.of(context).primary,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.w600,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
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
                                  ),
                                  Builder(
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
                                                              _model.shoulderGirth = value;
                                                              break;
                                                            case 4:
                                                              _model.chestGirth = value;
                                                              break;
                                                            case 5:
                                                              _model.waistGirth = value;
                                                              break;
                                                            case 6:
                                                              _model.abdomenGirth = value;
                                                              break;
                                                            case 7:
                                                              _model.thighGirth = value;
                                                              break;
                                                            case 8:
                                                              _model.hipsGirth = value;
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
                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                        child: Text(
                                                          valueOrDefault<String>(
                                                            measuresItem.name,
                                                            '-',
                                                          ),
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
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        final value = _getValueForType(measuresItem.type!);
                                                        if (value == null) {
                                                          return Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                            child: Text(
                                                              '-',
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
                                                          );
                                                        } else {
                                                          return Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                color: const Color(0x20E27B00),
                                                                borderRadius: BorderRadius.circular(50.0),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                child: Text(
                                                                  '${value % 1 == 0 ? value.toInt().toString() : value.toStringAsFixed(1)} см',
                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    font: GoogleFonts.unbounded(
                                                                      fontWeight: FontWeight.w600,
                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                    fontSize: 12.0,
                                                                    letterSpacing: 0.0,
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                  // InkWell(
                                  //   splashColor: Colors.transparent,
                                  //   focusColor: Colors.transparent,
                                  //   hoverColor: Colors.transparent,
                                  //   highlightColor: Colors.transparent,
                                  //   onTap: () async {
                                  //     await showModalBottomSheet(
                                  //       isScrollControlled: true,
                                  //       backgroundColor: Colors.transparent,
                                  //       enableDrag: false,
                                  //       context: context,
                                  //       builder: (context) {
                                  //         return GestureDetector(
                                  //           onTap: () {
                                  //             FocusScope.of(context).unfocus();
                                  //           },
                                  //           child: Padding(
                                  //             padding: MediaQuery.viewInsetsOf(context),
                                  //             child: MeasureAddViewWidget(
                                  //               measureRow: BodyMeasureRow(
                                  //                   {
                                  //                     "name":"Обхват плечевого пояса"
                                  //                   }
                                  //               ),
                                  //               initialValue: _model.shoulderGirth ?? 0,
                                  //               onValueSave: (value) async {
                                  //                 _model.shoulderGirth = value;
                                  //                 safeSetState(() {});
                                  //               },
                                  //             ),
                                  //           ),
                                  //         );
                                  //       },
                                  //     );
                                  //   },
                                  //   child: Container(
                                  //     width: double.infinity,
                                  //     height: 48.0,
                                  //     decoration: BoxDecoration(
                                  //       color: FlutterFlowTheme.of(context).secondary,
                                  //       borderRadius: BorderRadius.circular(16.0),
                                  //     ),
                                  //     child: Padding(
                                  //       padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                  //       child: Row(
                                  //         mainAxisSize: MainAxisSize.max,
                                  //         children: [
                                  //           Expanded(
                                  //             child: Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                  //               child: Text(
                                  //                 'Обхват плечевого пояса',
                                  //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                   font: GoogleFonts.inter(
                                  //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                   ),
                                  //                   letterSpacing: 0.0,
                                  //                   fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           if (_model.shoulderGirth == null)
                                  //             Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                  //               child: Text(
                                  //                 '-',
                                  //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                   font: GoogleFonts.inter(
                                  //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                   ),
                                  //                   color: FlutterFlowTheme.of(context).secondaryText,
                                  //                   letterSpacing: 0.0,
                                  //                   fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           if (_model.shoulderGirth != null)
                                  //             Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                  //               child: Container(
                                  //                 decoration: BoxDecoration(
                                  //                   color: Color(0x20E27B00),
                                  //                   borderRadius: BorderRadius.circular(50.0),
                                  //                 ),
                                  //                 child: Padding(
                                  //                   padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                  //                   child: Text(
                                  //                     '${formatNumber(
                                  //                       _model.shoulderGirth,
                                  //                       formatType: FormatType.custom,
                                  //                       format: '###.0#',
                                  //                       locale: '',
                                  //                     )} см',
                                  //                     style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                       font: GoogleFonts.unbounded(
                                  //                         fontWeight: FontWeight.w600,
                                  //                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                       ),
                                  //                       color: FlutterFlowTheme.of(context).primary,
                                  //                       fontSize: 12.0,
                                  //                       letterSpacing: 0.0,
                                  //                       fontWeight: FontWeight.w600,
                                  //                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ClipRRect(
                                  //             borderRadius: BorderRadius.circular(8.0),
                                  //             child: SvgPicture.asset(
                                  //               'assets/images/arrow_right.svg',
                                  //               width: 18.0,
                                  //               height: 18.0,
                                  //               fit: BoxFit.cover,
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // InkWell(
                                  //   splashColor: Colors.transparent,
                                  //   focusColor: Colors.transparent,
                                  //   hoverColor: Colors.transparent,
                                  //   highlightColor: Colors.transparent,
                                  //   onTap: () async {
                                  //     context.safePop();
                                  //   },
                                  //   child: Container(
                                  //     width: double.infinity,
                                  //     height: 48.0,
                                  //     decoration: BoxDecoration(
                                  //       color: FlutterFlowTheme.of(context).secondary,
                                  //       borderRadius: BorderRadius.circular(16.0),
                                  //     ),
                                  //     child: Padding(
                                  //       padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                  //       child: Row(
                                  //         mainAxisSize: MainAxisSize.max,
                                  //         children: [
                                  //           Expanded(
                                  //             child: Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                  //               child: Text(
                                  //                 'Обхват груди',
                                  //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                   font: GoogleFonts.inter(
                                  //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                   ),
                                  //                   letterSpacing: 0.0,
                                  //                   fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           if (_model.chestGirth == null)
                                  //             Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                  //               child: Text(
                                  //                 '-',
                                  //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                   font: GoogleFonts.inter(
                                  //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                   ),
                                  //                   color: FlutterFlowTheme.of(context).secondaryText,
                                  //                   letterSpacing: 0.0,
                                  //                   fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           if (_model.chestGirth != null)
                                  //             Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                  //               child: Container(
                                  //                 decoration: BoxDecoration(
                                  //                   color: Color(0x20E27B00),
                                  //                   borderRadius: BorderRadius.circular(50.0),
                                  //                 ),
                                  //                 child: Padding(
                                  //                   padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                  //                   child: Text(
                                  //                     '${formatNumber(
                                  //                       _model.chestGirth,
                                  //                       formatType: FormatType.custom,
                                  //                       format: '###.0#',
                                  //                       locale: '',
                                  //                     )} см',
                                  //                     style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                       font: GoogleFonts.unbounded(
                                  //                         fontWeight: FontWeight.w600,
                                  //                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                       ),
                                  //                       color: FlutterFlowTheme.of(context).primary,
                                  //                       fontSize: 12.0,
                                  //                       letterSpacing: 0.0,
                                  //                       fontWeight: FontWeight.w600,
                                  //                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ClipRRect(
                                  //             borderRadius: BorderRadius.circular(8.0),
                                  //             child: SvgPicture.asset(
                                  //               'assets/images/arrow_right.svg',
                                  //               width: 18.0,
                                  //               height: 18.0,
                                  //               fit: BoxFit.cover,
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // InkWell(
                                  //   splashColor: Colors.transparent,
                                  //   focusColor: Colors.transparent,
                                  //   hoverColor: Colors.transparent,
                                  //   highlightColor: Colors.transparent,
                                  //   onTap: () async {
                                  //     context.safePop();
                                  //   },
                                  //   child: Container(
                                  //     width: double.infinity,
                                  //     height: 48.0,
                                  //     decoration: BoxDecoration(
                                  //       color: FlutterFlowTheme.of(context).secondary,
                                  //       borderRadius: BorderRadius.circular(16.0),
                                  //     ),
                                  //     child: Padding(
                                  //       padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                  //       child: Row(
                                  //         mainAxisSize: MainAxisSize.max,
                                  //         children: [
                                  //           Expanded(
                                  //             child: Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                  //               child: Text(
                                  //                 'Обхват талии',
                                  //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                   font: GoogleFonts.inter(
                                  //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                   ),
                                  //                   letterSpacing: 0.0,
                                  //                   fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           if (_model.waistGirth == null)
                                  //             Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                  //               child: Text(
                                  //                 '-',
                                  //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                   font: GoogleFonts.inter(
                                  //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                   ),
                                  //                   color: FlutterFlowTheme.of(context).secondaryText,
                                  //                   letterSpacing: 0.0,
                                  //                   fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           if (_model.waistGirth != null)
                                  //             Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                  //               child: Container(
                                  //                 decoration: BoxDecoration(
                                  //                   color: Color(0x20E27B00),
                                  //                   borderRadius: BorderRadius.circular(50.0),
                                  //                 ),
                                  //                 child: Padding(
                                  //                   padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                  //                   child: Text(
                                  //                     '${formatNumber(
                                  //                       _model.waistGirth,
                                  //                       formatType: FormatType.custom,
                                  //                       format: '###.0#',
                                  //                       locale: '',
                                  //                     )} см',
                                  //                     style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                       font: GoogleFonts.unbounded(
                                  //                         fontWeight: FontWeight.w600,
                                  //                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                       ),
                                  //                       color: FlutterFlowTheme.of(context).primary,
                                  //                       fontSize: 12.0,
                                  //                       letterSpacing: 0.0,
                                  //                       fontWeight: FontWeight.w600,
                                  //                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ClipRRect(
                                  //             borderRadius: BorderRadius.circular(8.0),
                                  //             child: SvgPicture.asset(
                                  //               'assets/images/arrow_right.svg',
                                  //               width: 18.0,
                                  //               height: 18.0,
                                  //               fit: BoxFit.cover,
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // InkWell(
                                  //   splashColor: Colors.transparent,
                                  //   focusColor: Colors.transparent,
                                  //   hoverColor: Colors.transparent,
                                  //   highlightColor: Colors.transparent,
                                  //   onTap: () async {
                                  //     context.safePop();
                                  //   },
                                  //   child: Container(
                                  //     width: double.infinity,
                                  //     height: 48.0,
                                  //     decoration: BoxDecoration(
                                  //       color: FlutterFlowTheme.of(context).secondary,
                                  //       borderRadius: BorderRadius.circular(16.0),
                                  //     ),
                                  //     child: Padding(
                                  //       padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                  //       child: Row(
                                  //         mainAxisSize: MainAxisSize.max,
                                  //         children: [
                                  //           Expanded(
                                  //             child: Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                  //               child: Text(
                                  //                 'Обхват живота',
                                  //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                   font: GoogleFonts.inter(
                                  //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                   ),
                                  //                   letterSpacing: 0.0,
                                  //                   fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           if (_model.abdomenGirth != null)
                                  //             Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                  //               child: Text(
                                  //                 '-',
                                  //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                   font: GoogleFonts.inter(
                                  //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                   ),
                                  //                   color: FlutterFlowTheme.of(context).secondaryText,
                                  //                   letterSpacing: 0.0,
                                  //                   fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           if (_model.abdomenGirth != null)
                                  //             Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                  //               child: Container(
                                  //                 decoration: BoxDecoration(
                                  //                   color: Color(0x20E27B00),
                                  //                   borderRadius: BorderRadius.circular(50.0),
                                  //                 ),
                                  //                 child: Padding(
                                  //                   padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                  //                   child: Text(
                                  //                     '${formatNumber(
                                  //                       _model.abdomenGirth,
                                  //                       formatType: FormatType.custom,
                                  //                       format: '###.0#',
                                  //                       locale: '',
                                  //                     )} см',
                                  //                     style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                       font: GoogleFonts.unbounded(
                                  //                         fontWeight: FontWeight.w600,
                                  //                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                       ),
                                  //                       color: FlutterFlowTheme.of(context).primary,
                                  //                       fontSize: 12.0,
                                  //                       letterSpacing: 0.0,
                                  //                       fontWeight: FontWeight.w600,
                                  //                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ClipRRect(
                                  //             borderRadius: BorderRadius.circular(8.0),
                                  //             child: SvgPicture.asset(
                                  //               'assets/images/arrow_right.svg',
                                  //               width: 18.0,
                                  //               height: 18.0,
                                  //               fit: BoxFit.cover,
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // InkWell(
                                  //   splashColor: Colors.transparent,
                                  //   focusColor: Colors.transparent,
                                  //   hoverColor: Colors.transparent,
                                  //   highlightColor: Colors.transparent,
                                  //   onTap: () async {
                                  //     context.safePop();
                                  //   },
                                  //   child: Container(
                                  //     width: double.infinity,
                                  //     height: 48.0,
                                  //     decoration: BoxDecoration(
                                  //       color: FlutterFlowTheme.of(context).secondary,
                                  //       borderRadius: BorderRadius.circular(16.0),
                                  //     ),
                                  //     child: Padding(
                                  //       padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                  //       child: Row(
                                  //         mainAxisSize: MainAxisSize.max,
                                  //         children: [
                                  //           Expanded(
                                  //             child: Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                  //               child: Text(
                                  //                 'Обхват бедра (одна нога)',
                                  //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                   font: GoogleFonts.inter(
                                  //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                   ),
                                  //                   letterSpacing: 0.0,
                                  //                   fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           if (_model.thighGirth != null)
                                  //             Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                  //               child: Text(
                                  //                 '-',
                                  //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                   font: GoogleFonts.inter(
                                  //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                   ),
                                  //                   color: FlutterFlowTheme.of(context).secondaryText,
                                  //                   letterSpacing: 0.0,
                                  //                   fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           if (_model.thighGirth != null)
                                  //             Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                  //               child: Container(
                                  //                 decoration: BoxDecoration(
                                  //                   color: Color(0x20E27B00),
                                  //                   borderRadius: BorderRadius.circular(50.0),
                                  //                 ),
                                  //                 child: Padding(
                                  //                   padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                  //                   child: Text(
                                  //                     '${formatNumber(
                                  //                       _model.thighGirth,
                                  //                       formatType: FormatType.custom,
                                  //                       format: '###.0#',
                                  //                       locale: '',
                                  //                     )} см',
                                  //                     style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                       font: GoogleFonts.unbounded(
                                  //                         fontWeight: FontWeight.w600,
                                  //                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                       ),
                                  //                       color: FlutterFlowTheme.of(context).primary,
                                  //                       fontSize: 12.0,
                                  //                       letterSpacing: 0.0,
                                  //                       fontWeight: FontWeight.w600,
                                  //                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ClipRRect(
                                  //             borderRadius: BorderRadius.circular(8.0),
                                  //             child: SvgPicture.asset(
                                  //               'assets/images/arrow_right.svg',
                                  //               width: 18.0,
                                  //               height: 18.0,
                                  //               fit: BoxFit.cover,
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // InkWell(
                                  //   splashColor: Colors.transparent,
                                  //   focusColor: Colors.transparent,
                                  //   hoverColor: Colors.transparent,
                                  //   highlightColor: Colors.transparent,
                                  //   onTap: () async {
                                  //     context.safePop();
                                  //   },
                                  //   child: Container(
                                  //     width: double.infinity,
                                  //     height: 48.0,
                                  //     decoration: BoxDecoration(
                                  //       color: FlutterFlowTheme.of(context).secondary,
                                  //       borderRadius: BorderRadius.circular(16.0),
                                  //     ),
                                  //     child: Padding(
                                  //       padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                  //       child: Row(
                                  //         mainAxisSize: MainAxisSize.max,
                                  //         children: [
                                  //           Expanded(
                                  //             child: Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                  //               child: Text(
                                  //                 'Обхват ягодиц',
                                  //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                   font: GoogleFonts.inter(
                                  //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                   ),
                                  //                   letterSpacing: 0.0,
                                  //                   fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           if (_model.hipsGirth != null)
                                  //             Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                  //               child: Text(
                                  //                 '-',
                                  //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                   font: GoogleFonts.inter(
                                  //                     fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                     fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                   ),
                                  //                   color: FlutterFlowTheme.of(context).secondaryText,
                                  //                   letterSpacing: 0.0,
                                  //                   fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           if (_model.hipsGirth != null)
                                  //             Padding(
                                  //               padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                  //               child: Container(
                                  //                 decoration: BoxDecoration(
                                  //                   color: Color(0x20E27B00),
                                  //                   borderRadius: BorderRadius.circular(50.0),
                                  //                 ),
                                  //                 child: Padding(
                                  //                   padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                  //                   child: Text(
                                  //                     '${formatNumber(
                                  //                       _model.hipsGirth,
                                  //                       formatType: FormatType.custom,
                                  //                       format: '###.0#',
                                  //                       locale: '',
                                  //                     )} см',
                                  //                     style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                       font: GoogleFonts.unbounded(
                                  //                         fontWeight: FontWeight.w600,
                                  //                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                       ),
                                  //                       color: FlutterFlowTheme.of(context).primary,
                                  //                       fontSize: 12.0,
                                  //                       letterSpacing: 0.0,
                                  //                       fontWeight: FontWeight.w600,
                                  //                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //               ),
                                  //             ),
                                  //           ClipRRect(
                                  //             borderRadius: BorderRadius.circular(8.0),
                                  //             child: SvgPicture.asset(
                                  //               'assets/images/arrow_right.svg',
                                  //               width: 18.0,
                                  //               height: 18.0,
                                  //               fit: BoxFit.cover,
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Загрузите ваши фото',
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
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: InkWell(
                                                    splashColor: Colors.transparent,
                                                    focusColor: Colors.transparent,
                                                    hoverColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled: true,
                                                        backgroundColor: Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(context).unfocus();
                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery.viewInsetsOf(context),
                                                              child: MediaSelectViewWidget(
                                                                onMediaSelect: (media) async {
                                                                  _model.photo01 = media;
                                                                  safeSetState(() {});
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) => safeSetState(() {}));
                                                    },
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 148.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme.of(context).secondary,
                                                        borderRadius: BorderRadius.circular(16.0),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize: MainAxisSize.max,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                  child: SvgPicture.asset(
                                                                    'assets/images/plus_add.svg',
                                                                    width: 48.0,
                                                                    height: 48.0,
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                  child: Text(
                                                                    'Фото анфас',
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
                                                          if (_model.photo01 != null && (_model.photo01?.bytes?.isNotEmpty ?? false))
                                                            Container(
                                                              width: double.infinity,
                                                              height: double.infinity,
                                                              decoration: const BoxDecoration(),
                                                              child: Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                    child: Image.memory(
                                                                      _model.photo01?.bytes ?? Uint8List.fromList([]),
                                                                      width: double.infinity,
                                                                      height: double.infinity,
                                                                      fit: BoxFit.cover,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment: const AlignmentDirectional(1.0, -1.0),
                                                                    child: Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                      child: InkWell(
                                                                        splashColor: Colors.transparent,
                                                                        focusColor: Colors.transparent,
                                                                        hoverColor: Colors.transparent,
                                                                        highlightColor: Colors.transparent,
                                                                        onTap: () async {
                                                                          _model.photo01 = null;
                                                                          safeSetState(() {});
                                                                        },
                                                                        child: ClipRRect(
                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                          child: SvgPicture.asset(
                                                                            'assets/images/remove_photo.svg',
                                                                            width: 36.0,
                                                                            height: 36.0,
                                                                            fit: BoxFit.cover,
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
                                                ),
                                                Expanded(
                                                  child: InkWell(
                                                    splashColor: Colors.transparent,
                                                    focusColor: Colors.transparent,
                                                    hoverColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled: true,
                                                        backgroundColor: Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(context).unfocus();
                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery.viewInsetsOf(context),
                                                              child: MediaSelectViewWidget(
                                                                onMediaSelect: (media) async {
                                                                  _model.photo02 = media;
                                                                  safeSetState(() {});
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) => safeSetState(() {}));
                                                    },
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 148.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme.of(context).secondary,
                                                        borderRadius: BorderRadius.circular(16.0),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize: MainAxisSize.max,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                  child: SvgPicture.asset(
                                                                    'assets/images/plus_add.svg',
                                                                    width: 48.0,
                                                                    height: 48.0,
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                  child: Text(
                                                                    'Фото со спины',
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
                                                          if (_model.photo02 != null && (_model.photo02?.bytes?.isNotEmpty ?? false))
                                                            Container(
                                                              width: double.infinity,
                                                              height: double.infinity,
                                                              decoration: const BoxDecoration(),
                                                              child: Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                    child: Image.memory(
                                                                      _model.photo02?.bytes ?? Uint8List.fromList([]),
                                                                      width: double.infinity,
                                                                      height: double.infinity,
                                                                      fit: BoxFit.cover,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment: const AlignmentDirectional(1.0, -1.0),
                                                                    child: Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                      child: InkWell(
                                                                        splashColor: Colors.transparent,
                                                                        focusColor: Colors.transparent,
                                                                        hoverColor: Colors.transparent,
                                                                        highlightColor: Colors.transparent,
                                                                        onTap: () async {
                                                                          _model.photo02 = null;
                                                                          safeSetState(() {});
                                                                        },
                                                                        child: ClipRRect(
                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                          child: SvgPicture.asset(
                                                                            'assets/images/remove_photo.svg',
                                                                            width: 36.0,
                                                                            height: 36.0,
                                                                            fit: BoxFit.cover,
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
                                                ),
                                                Expanded(
                                                  child: InkWell(
                                                    splashColor: Colors.transparent,
                                                    focusColor: Colors.transparent,
                                                    hoverColor: Colors.transparent,
                                                    highlightColor: Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled: true,
                                                        backgroundColor: Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(context).unfocus();
                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery.viewInsetsOf(context),
                                                              child: MediaSelectViewWidget(
                                                                onMediaSelect: (media) async {
                                                                  _model.photo03 = media;
                                                                  safeSetState(() {});
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) => safeSetState(() {}));
                                                    },
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 148.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme.of(context).secondary,
                                                        borderRadius: BorderRadius.circular(16.0),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                            child: Column(
                                                              mainAxisSize: MainAxisSize.max,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                  child: SvgPicture.asset(
                                                                    'assets/images/plus_add.svg',
                                                                    width: 48.0,
                                                                    height: 48.0,
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                  child: Text(
                                                                    'Фото боком',
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
                                                          if (_model.photo03 != null && (_model.photo03?.bytes?.isNotEmpty ?? false))
                                                            Container(
                                                              width: double.infinity,
                                                              height: double.infinity,
                                                              decoration: const BoxDecoration(),
                                                              child: Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                    child: Image.memory(
                                                                      _model.photo03?.bytes ?? Uint8List.fromList([]),
                                                                      width: double.infinity,
                                                                      height: double.infinity,
                                                                      fit: BoxFit.cover,
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment: const AlignmentDirectional(1.0, -1.0),
                                                                    child: Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 8.0, 0.0),
                                                                      child: InkWell(
                                                                        splashColor: Colors.transparent,
                                                                        focusColor: Colors.transparent,
                                                                        hoverColor: Colors.transparent,
                                                                        highlightColor: Colors.transparent,
                                                                        onTap: () async {
                                                                          _model.photo03 = null;
                                                                          safeSetState(() {});
                                                                        },
                                                                        child: ClipRRect(
                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                          child: SvgPicture.asset(
                                                                            'assets/images/remove_photo.svg',
                                                                            width: 36.0,
                                                                            height: 36.0,
                                                                            fit: BoxFit.cover,
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
                                                ),
                                              ].divide(const SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 16.0)),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: wrapWithModel(
                  model: _model.generalButtonModel,
                  updateCallback: () => safeSetState(() {}),
                  child: GeneralButtonWidget(
                    title: 'Добавить замер',
                    isActive: (_model.weight != null) &&
                        (_model.shoulderGirth != null) &&
                        (_model.chestGirth != null) &&
                        (_model.waistGirth != null) &&
                        (_model.abdomenGirth != null) &&
                        (_model.thighGirth != null) &&
                        (_model.hipsGirth != null) &&
                        (_model.photo01 != null && (_model.photo01?.bytes?.isNotEmpty ?? false)) &&
                        (_model.photo02 != null && (_model.photo02?.bytes?.isNotEmpty ?? false)) &&
                        (_model.photo03 != null && (_model.photo03?.bytes?.isNotEmpty ?? false)),
                    onTap: () async {
                      {
                        safeSetState(() => _model.isDataUploading_uploadDataPhoto01 = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];
                        var selectedMedia = <SelectedFile>[];
                        var downloadUrls = <String>[];
                        try {
                          selectedUploadedFiles = _model.photo01!.bytes!.isNotEmpty ? [_model.photo01!] : <FFUploadedFile>[];
                          selectedMedia = selectedFilesFromUploadedFiles(
                            selectedUploadedFiles,
                            storageFolderPath: 'userMeasures',
                          );
                          downloadUrls = await uploadSupabaseStorageFiles(
                            bucketName: 'boom-bucket',
                            selectedFiles: selectedMedia,
                          );
                        } finally {
                          _model.isDataUploading_uploadDataPhoto01 = false;
                        }
                        if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                          safeSetState(() {
                            _model.uploadedLocalFile_uploadDataPhoto01 = selectedUploadedFiles.first;
                            _model.uploadedFileUrl_uploadDataPhoto01 = downloadUrls.first;
                          });
                        } else {
                          safeSetState(() {});
                          return;
                        }
                      }

                      {
                        safeSetState(() => _model.isDataUploading_uploadDataPhoto01 = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];
                        var selectedMedia = <SelectedFile>[];
                        var downloadUrls = <String>[];
                        try {
                          selectedUploadedFiles = _model.photo02!.bytes!.isNotEmpty ? [_model.photo02!] : <FFUploadedFile>[];
                          selectedMedia = selectedFilesFromUploadedFiles(
                            selectedUploadedFiles,
                            storageFolderPath: 'userMeasures',
                          );
                          downloadUrls = await uploadSupabaseStorageFiles(
                            bucketName: 'boom-bucket',
                            selectedFiles: selectedMedia,
                          );
                        } finally {
                          _model.isDataUploading_uploadDataPhoto01 = false;
                        }
                        if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                          safeSetState(() {
                            _model.uploadedLocalFile_uploadDataPhoto02 = selectedUploadedFiles.first;
                            _model.uploadedFileUrl_uploadDataPhoto02 = downloadUrls.first;
                          });
                        } else {
                          safeSetState(() {});
                          return;
                        }
                      }

                      {
                        safeSetState(() => _model.isDataUploading_uploadDataPhoto01 = true);
                        var selectedUploadedFiles = <FFUploadedFile>[];
                        var selectedMedia = <SelectedFile>[];
                        var downloadUrls = <String>[];
                        try {
                          selectedUploadedFiles = _model.photo03!.bytes!.isNotEmpty ? [_model.photo03!] : <FFUploadedFile>[];
                          selectedMedia = selectedFilesFromUploadedFiles(
                            selectedUploadedFiles,
                            storageFolderPath: 'userMeasures',
                          );
                          downloadUrls = await uploadSupabaseStorageFiles(
                            bucketName: 'boom-bucket',
                            selectedFiles: selectedMedia,
                          );
                        } finally {
                          _model.isDataUploading_uploadDataPhoto01 = false;
                        }
                        if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                          safeSetState(() {
                            _model.uploadedLocalFile_uploadDataPhoto03 = selectedUploadedFiles.first;
                            _model.uploadedFileUrl_uploadDataPhoto03 = downloadUrls.first;
                          });
                        } else {
                          safeSetState(() {});
                          return;
                        }
                      }

                      await UserBodyMeasureTable().insert({
                        'created_at': supaSerialize<DateTime>(getCurrentTimestamp),
                        'user': currentUserUid,
                        'weight': _model.weight,
                        'shoulder_girth': _model.shoulderGirth,
                        'chest_girth': _model.chestGirth,
                        'waist_girth': _model.waistGirth,
                        'abdomen_girth': _model.shoulderGirth,
                        'thigh_girth': _model.thighGirth,
                        'hips_girth': _model.hipsGirth,
                        'img_front': _model.uploadedFileUrl_uploadDataPhoto01,
                        'img_back': _model.uploadedFileUrl_uploadDataPhoto02,
                        'img_side': _model.uploadedFileUrl_uploadDataPhoto03,
                      });
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: const Color(0x2D000000),
                        enableDrag: false,
                        isDismissible: false,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: const ProfileMeasurementSuccessfullyAddedPageWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
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
      case 3: return _model.shoulderGirth;
      case 4: return _model.chestGirth;
      case 5: return _model.waistGirth;
      case 6: return _model.abdomenGirth;
      case 7: return _model.thighGirth;
      case 8: return _model.hipsGirth;
      default: return null;
    }
  }
}
