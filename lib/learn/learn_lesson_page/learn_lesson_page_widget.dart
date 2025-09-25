import '/backend/supabase/supabase.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'learn_lesson_page_model.dart';
export 'learn_lesson_page_model.dart';

class LearnLessonPageWidget extends StatefulWidget {
  const LearnLessonPageWidget({
    super.key,
    required this.lesson,
  });

  final LessonRow? lesson;

  static String routeName = 'LearnLessonPage';
  static String routePath = '/learnLessonPage';

  @override
  State<LearnLessonPageWidget> createState() => _LearnLessonPageWidgetState();
}

class _LearnLessonPageWidgetState extends State<LearnLessonPageWidget> {
  late LearnLessonPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearnLessonPageModel());
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
                  title: 'Просмотр урока',
                  hideBack: false,
                ),
              ),
              Expanded(
                child: FutureBuilder<List<LessonRow>>(
                  future: LessonTable().querySingleRow(
                    queryFn: (q) => q.eqOrNull(
                      'id',
                      widget.lesson?.id,
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
                    List<LessonRow> containerLessonRowList = snapshot.data!;

                    final containerLessonRow = containerLessonRowList.isNotEmpty ? containerLessonRowList.first : null;

                    return Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                              child: FlutterFlowVideoPlayer(
                                path: containerLessonRow!.video!,
                                videoType: VideoType.network,
                                height: 296.0,
                                autoPlay: false,
                                looping: true,
                                showControls: true,
                                allowFullScreen: true,
                                allowPlaybackSpeedMenu: false,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  containerLessonRow.name,
                                  '-',
                                ),
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
                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  FutureBuilder<List<LessonGroupRow>>(
                                    future: LessonGroupTable().querySingleRow(
                                      queryFn: (q) => q.eqOrNull(
                                        'id',
                                        containerLessonRow.lessonGroup,
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
                                      List<LessonGroupRow> containerLessonGroupRowList = snapshot.data!;

                                      final containerLessonGroupRow = containerLessonGroupRowList.isNotEmpty
                                          ? containerLessonGroupRowList.first
                                          : null;

                                      return Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0x21E27B00),
                                          borderRadius: BorderRadius.circular(100.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 3.0, 8.0, 3.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(0.0),
                                                child: Image.network(
                                                  containerLessonGroupRow!.icon!,
                                                  width: 12.0,
                                                  height: 12.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    containerLessonGroupRow.name,
                                                    '-',
                                                  ),
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                        color: FlutterFlowTheme.of(context).primary,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF242328),
                                      borderRadius: BorderRadius.circular(100.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(0.0),
                                            child: SvgPicture.asset(
                                              'assets/images/Calendar01.svg',
                                              width: 12.0,
                                              height: 12.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              '${valueOrDefault<String>(containerLessonRow.duration?.toString(), '-')} мин',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(context).primaryText,
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
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 17.0, 16.0, 0.0),
                              child: Text(
                                'Описание видео',
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0xFF302E36),
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          containerLessonRow.description,
                                          '-',
                                        ),
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
