import 'package:boom_client/journal/journal_page/journal_statistics.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'journal_calendar.dart';
import 'journal_page_model.dart';
export 'journal_page_model.dart';

class JournalPageWidget extends StatefulWidget {
  const JournalPageWidget({super.key});

  static String routeName = 'JournalPage';
  static String routePath = '/journalPage';

  @override
  State<JournalPageWidget> createState() => _JournalPageWidgetState();
}

class _JournalPageWidgetState extends State<JournalPageWidget> {
  late JournalPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalPageModel());


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
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 32.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondary,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.part = 0;
                              safeSetState(() {});
                            },
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: _model.part == 0 ? FlutterFlowTheme.of(context).primary : const Color(0x00696576),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                  child: Text(
                                    'Календарь',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          font: GoogleFonts.unbounded(
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                          color: _model.part == 0 ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.part = 1;
                              safeSetState(() {});
                            },
                            child: Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: _model.part == 1 ? FlutterFlowTheme.of(context).primary : const Color(0x00696576),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                  child: Text(
                                    'Статистика',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          font: GoogleFonts.unbounded(
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                          color: _model.part == 1 ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
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
                ],
              ),
              if (_model.part == 0)
                const Expanded(
                  child: JournalCalendarWidget(),
                ),
              if (_model.part == 1)
                const Expanded(
                  child: JournalStatisticsWidget(),
                ),
            ].addToEnd(const SizedBox(height: 32.0)),
          ),
        ),
      ),
    );
  }
}
