import '/backend/supabase/supabase.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/learn/lesson_cell/lesson_cell_widget.dart';
import 'package:flutter/material.dart';
import 'learn_group_page_model.dart';
export 'learn_group_page_model.dart';

class LearnGroupPageWidget extends StatefulWidget {
  const LearnGroupPageWidget({
    super.key,
    required this.group,
    bool? isAll,
  }) : isAll = isAll ?? false;

  final LessonGroupRow? group;
  final bool isAll;

  static String routeName = 'LearnGroupPage';
  static String routePath = '/learnGroupPage';

  @override
  State<LearnGroupPageWidget> createState() => _LearnGroupPageWidgetState();
}

class _LearnGroupPageWidgetState extends State<LearnGroupPageWidget> {
  late LearnGroupPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LearnGroupPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('isAll: ${widget.isAll}');
    print('group: ${widget.group}');
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
                  title: valueOrDefault<String>(
                    widget.isAll ? 'Все уроки' : widget.group?.name,
                    '-',
                  ),
                  hideBack: false,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                          child: FutureBuilder<List<LessonRow>>(
                            // future: LessonTable().queryRows(
                            //   queryFn: (q) => widget.isAll
                            //       ? q.order('created_at')
                            //       : q
                            //           .eqOrNull(
                            //             'lessonGroup',
                            //             widget!.group?.id,
                            //           )
                            //           .order('created_at'),
                            // ),
                            // future: widget.isAll
                            //     ? LessonTable().queryRows(
                            //         queryFn: (q) => q.order('created_at'),
                            //       )
                            //     : LessonTable().queryRows(
                            //         queryFn: (q) => q
                            //             .eqOrNull(
                            //               'lessonGroup',
                            //               widget.group?.id,
                            //             )
                            //             .order('created_at'),
                            //       ),
                            future: LessonTable().queryRows(
                              queryFn: (q) {
                                if (!widget.isAll && widget.group?.id != null) {
                                  q = q.eq('lessonGroup', widget.group!.id);
                                }
                                return q.order('created_at');
                              },
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
                                padding: const EdgeInsets.fromLTRB(
                                  0,
                                  8.0,
                                  0,
                                  20.0,
                                ),
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 1.0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
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
                                        'Keyvs4_${gridViewLessonRow.id.toString()}',
                                      ),
                                      lesson: gridViewLessonRow,
                                    ),
                                  );
                                },
                              );
                            },
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
