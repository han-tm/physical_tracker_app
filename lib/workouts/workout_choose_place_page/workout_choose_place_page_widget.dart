import 'package:boom_client/components/general_button_widget.dart';
import 'package:boom_client/index.dart';

import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workout_choose_place_page_model.dart';
export 'workout_choose_place_page_model.dart';

class WorkoutChoosePlacePageWidget extends StatefulWidget {
  const WorkoutChoosePlacePageWidget({super.key});

  static String routeName = 'WorkoutChoosePlacePage';
  static String routePath = '/workoutChoosePlacePage';

  @override
  State<WorkoutChoosePlacePageWidget> createState() => _WorkoutChoosePlacePageWidgetState();
}

class _WorkoutChoosePlacePageWidgetState extends State<WorkoutChoosePlacePageWidget> {
  late WorkoutChoosePlacePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutChoosePlacePageModel());
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
                child: GeneralNavBar01Widget(
                  title: 'Где будут тренировки?',
                  hideBack: false,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                child: Text(
                                  'где вы хотите заниматься?',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.normal,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  renderItem(
                                      index: 0,
                                      image: 'assets/images/tren_place_01.svg',
                                      title: 'Дома',
                                      subtitle: 'Тренировки без оборудования, или с'
                                  ),
                                  renderItem(
                                      index: 1,
                                      image: 'assets/images/tren_place_02.svg',
                                      title: 'В зале',
                                      subtitle: 'С использованием тренажеров'
                                  ),
                                  renderItem(
                                      index: 2,
                                      image: 'assets/images/tren_place_02.svg',
                                      title: 'Дом+зал',
                                      subtitle: '2 дня в зале 1 дома'
                                  ),
                                ].divide(SizedBox(height: 8.0)),
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
                margin: EdgeInsets.all(16),
                child: GeneralButtonWidget(
                    title: "Далее",
                    isActive: _model.variantSelected != null,
                    onTap: () async{
                      if (_model.variantSelected == 0) {
                        context.pushNamed(WorkoutHomeInventoryPageWidget.routeName);
                      }
                      else {
                        context.pop();
                      }

                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget renderItem({required int index, required String image, required String title, required String subtitle}) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        _model.variantSelected = index;
        safeSetState(() {});
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: _model.variantSelected == index ? Color(0x21E27B00) : FlutterFlowTheme.of(context).secondary,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: _model.variantSelected == index ? FlutterFlowTheme.of(context).primary : Colors.transparent,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SvgPicture.asset(
                    image,
                    width: 30.0,
                    height: 30.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Text(
                        subtitle,
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
            ],
          ),
        ),
      ),
    );
  }
}
