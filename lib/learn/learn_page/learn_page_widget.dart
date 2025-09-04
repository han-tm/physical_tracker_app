import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/learn/lesson_cell/lesson_cell_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'learn_page_model.dart';
export 'learn_page_model.dart';

class LearnPageWidget extends StatefulWidget {
  const LearnPageWidget({super.key});

  static String routeName = 'LearnPage';
  static String routePath = '/learnPage';

  @override
  State<LearnPageWidget> createState() => _LearnPageWidgetState();
}

class _LearnPageWidgetState extends State<LearnPageWidget> {
  late LearnPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearnPageModel());
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                  child: Text(
                    'Обучение',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.unbounded(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
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
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                  ),
                                  child: FutureBuilder<List<LessonGroupRow>>(
                                    future: LessonGroupTable().queryRows(
                                      queryFn: (q) => q,
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
                                      List<LessonGroupRow> gridViewLessonGroupRowList = snapshot.data!;
                                      gridViewLessonGroupRowList.sort((a,b)=> a.id.compareTo(b.id));


                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 9.0,
                                          mainAxisSpacing: 9.0,
                                          childAspectRatio: 1.6,
                                        ),
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemCount: gridViewLessonGroupRowList.length,
                                        itemBuilder: (context, gridViewIndex) {
                                          final gridViewLessonGroupRow = gridViewLessonGroupRowList[gridViewIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                LearnGroupPageWidget.routeName,
                                                queryParameters: {
                                                  'group': serializeParam(
                                                    gridViewLessonGroupRow,
                                                    ParamType.SupabaseRow,
                                                  ),
                                                  'isAll': serializeParam(
                                                    gridViewLessonGroupRow.name=="Все уроки"?true:false,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 102.0,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).secondary,
                                                borderRadius: BorderRadius.circular(16.0),
                                              ),
                                              child: Stack(
                                                children: [
                                                  if (gridViewLessonGroupRow.bgImage != null)
                                                    Opacity(
                                                      opacity: 0.2,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(12.0),
                                                        child: Image.network(
                                                          gridViewLessonGroupRow.bgImage!,
                                                          width: double.infinity,
                                                          height: double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      if (gridViewLessonGroupRow.icon != null)
                                                        Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 0.0),
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(0.0),
                                                            child: Image.network(
                                                              gridViewLessonGroupRow.icon!,
                                                              width: 30.0,
                                                              height: 30.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      Padding(
                                                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                                                        child: Text(
                                                          valueOrDefault<String>(
                                                            gridViewLessonGroupRow.name,
                                                            '-',
                                                          ),
                                                          maxLines: 1,
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
                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                                                        child: Text(
                                                          functions.getExperienceString(gridViewLessonGroupRow.lessonsNumber!, 'урок', 'урока', 'уроков', false),
                                                          maxLines: 1,
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
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                                child: Text(
                                  'Новые уроки',
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
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                child: FutureBuilder<List<LessonRow>>(
                                  future: LessonTable().queryRows(
                                    queryFn: (q) => q.order('created_at'),
                                    limit: 5,
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
                                    List<LessonRow> rowLessonRowList = snapshot.data!;

                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(rowLessonRowList.length, (rowIndex) {
                                        final rowLessonRow = rowLessonRowList[rowIndex];
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
                                                  rowLessonRow,
                                                  ParamType.SupabaseRow,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: 264.0,
                                            height: 287.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF242328),
                                              borderRadius: BorderRadius.circular(16.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Stack(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(12.0),
                                                          child: Image.network(
                                                            rowLessonRow.cover!,
                                                            width: double.infinity,
                                                            height: double.infinity,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: AlignmentDirectional(0.0, 0.0),
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: Color(0x20E27B00),
                                                              borderRadius: BorderRadius.circular(50.0),
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                              child: Text(
                                                                'Новое',
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
                                                        Text(
                                                          valueOrDefault<String>(
                                                            rowLessonRow.name,
                                                            '-',
                                                          ),
                                                          maxLines: 1,
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
                                                        Container(
                                                          height: 42.0,
                                                          decoration: BoxDecoration(),
                                                          child: Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                            child: Text(
                                                              valueOrDefault<String>(
                                                                rowLessonRow.description,
                                                                '-',
                                                              ),
                                                              maxLines: 2,
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
                                                        ),
                                                        Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            FutureBuilder<List<LessonGroupRow>>(
                                                              future: LessonGroupTable().querySingleRow(
                                                                queryFn: (q) => q.eqOrNull(
                                                                  'id',
                                                                  rowLessonRow.lessonGroup,
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

                                                                final containerLessonGroupRow = containerLessonGroupRowList.isNotEmpty ? containerLessonGroupRowList.first : null;

                                                                return Container(
                                                                  decoration: BoxDecoration(),
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                        child: Text(
                                                                          valueOrDefault<String>(
                                                                            rowLessonRow.lessonGroupName,
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
                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                  child: Text(
                                                                    valueOrDefault<String>(
                                                                      functions.formatDuration(rowLessonRow.duration ?? 0),
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
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).divide(SizedBox(width: 8.0)).addToStart(SizedBox(width: 16.0)).addToEnd(SizedBox(width: 16.0)),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                                child: Text(
                                  'Популярные уроки',
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
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: FutureBuilder<List<LessonRow>>(
                                    future: LessonTable().queryRows(
                                      queryFn: (q) => q.order('views'),
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
                                      List<LessonRow> gridViewLessonRowList = snapshot.data!;

                                      return GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 9.0,
                                          mainAxisSpacing: 9.0,
                                          childAspectRatio: 0.74,
                                        ),
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemCount: gridViewLessonRowList.length,
                                        itemBuilder: (context, gridViewIndex) {
                                          final gridViewLessonRow = gridViewLessonRowList[gridViewIndex];
                                          return wrapWithModel(
                                            model: _model.lessonCellModels.getModel(
                                              gridViewLessonRow.id.toString(),
                                              gridViewIndex,
                                            ),
                                            updateCallback: () => safeSetState(() {}),
                                            child: LessonCellWidget(
                                              key: Key(
                                                'Keyvzt_${gridViewLessonRow.id.toString()}',
                                              ),
                                              lesson: gridViewLessonRow,
                                            ),
                                          );
                                        },
                                      );
                                    },
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
            ],
          ),
        ),
      ),
    );
  }
}
