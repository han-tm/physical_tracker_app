import '../../flutter_flow/custom_functions.dart' as functions;
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lesson_cell_model.dart';
export 'lesson_cell_model.dart';

class LessonCellWidget extends StatefulWidget {
  const LessonCellWidget({
    super.key,
    required this.lesson,
  });

  final LessonRow? lesson;

  @override
  State<LessonCellWidget> createState() => _LessonCellWidgetState();
}

class _LessonCellWidgetState extends State<LessonCellWidget> {
  late LessonCellModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LessonCellModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.pushNamed(
          LearnLessonPageWidget.routeName,
          queryParameters: {
            'lesson': serializeParam(
              widget.lesson,
              ParamType.SupabaseRow,
            ),
          }.withoutNulls,
        );
      },
      child: Container(
        // width: 264.0,
        // height: 287.0,
        decoration: BoxDecoration(
          color: const Color(0xFF242328),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        widget.lesson!.cover!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SvgPicture.asset(
                          'assets/images/play_video.svg',
                          width: 48.0,
                          height: 48.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.lesson?.name,
                          '-',
                        ),
                        maxLines: 2,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.unbounded(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              ),
                              fontSize: 13.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                      ),
                      const SizedBox(height: 8.0),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FutureBuilder<List<LessonGroupRow>>(
                            future: LessonGroupTable().querySingleRow(
                              queryFn: (q) => q.eqOrNull(
                                'id',
                                widget.lesson?.lessonGroup,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<LessonGroupRow> containerLessonGroupRowList = snapshot.data!;
              
                              final containerLessonGroupRow = containerLessonGroupRowList.isNotEmpty ? containerLessonGroupRowList.first : null;
              
                              return Container(
                                decoration: const BoxDecoration(),
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
                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                              color: FlutterFlowTheme.of(context).secondaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Row(
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
                                  valueOrDefault<String>(
                                    functions.formatDuration(widget.lesson?.duration ?? 0),
                                    '-',
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ].divide(const SizedBox(height: 4.0)),
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
  }
}
