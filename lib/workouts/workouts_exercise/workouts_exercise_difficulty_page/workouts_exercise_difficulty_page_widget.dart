import '../../../backend/supabase/database/tables/exercise_difficulty.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/general_button_widget.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workouts_exercise_difficulty_page_model.dart';
export 'workouts_exercise_difficulty_page_model.dart';

class WorkoutsExerciseDifficultyPageWidget extends StatefulWidget {
  const WorkoutsExerciseDifficultyPageWidget({
    super.key,
    required this.difficultyId,
  });

  final int? difficultyId;

  static String routeName = 'WorkoutsExerciseDifficultyPage';
  static String routePath = '/workoutsExerciseDifficultyPage';

  @override
  State<WorkoutsExerciseDifficultyPageWidget> createState() => _WorkoutsExerciseDifficultyPageWidgetState();
}

class _WorkoutsExerciseDifficultyPageWidgetState extends State<WorkoutsExerciseDifficultyPageWidget> {
  late WorkoutsExerciseDifficultyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsExerciseDifficultyPageModel());
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
          child: FutureBuilder<List<ExerciseDifficultyRow>>(
            future: ExerciseDifficultyTable().querySingleRow(
              queryFn: (q) => q.eqOrNull(
                'id',
                widget!.difficultyId,
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
              List<ExerciseDifficultyRow> containerExerciseDifficultyRowList = snapshot.data!;

              final containerExerciseDifficultyRow = containerExerciseDifficultyRowList.isNotEmpty ? containerExerciseDifficultyRowList.first : null;

              return Container(
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.generalNavBar01Model,
                      updateCallback: () => safeSetState(() {}),
                      child: GeneralNavBar01Widget(
                        title: containerExerciseDifficultyRow!.name!,
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
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.network(
                                        containerExerciseDifficultyRow!.cover!,
                                        width: double.infinity,
                                        height: 196.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                      child: Text(
                                        'Описание: ',
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
                                      child: Text(
                                        valueOrDefault<String>(
                                          containerExerciseDifficultyRow?.description,
                                          '-',
                                        ),
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                              color: FlutterFlowTheme.of(context).secondaryText,
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width: 100.0,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                borderRadius: BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: Color(0xFF302E36),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        containerExerciseDifficultyRow?.days?.toString(),
                                                        '-',
                                                      ),
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            font: GoogleFonts.unbounded(
                                                              fontWeight: FontWeight.w600,
                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FontWeight.w600,
                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                      child: AutoSizeText(
                                                        'Дней в неделю',
                                                        maxLines: 1,
                                                        minFontSize: 1.0,
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              font: GoogleFonts.inter(
                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                              fontSize: 13.0,
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
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 100.0,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                borderRadius: BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: Color(0xFF302E36),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        containerExerciseDifficultyRow?.weeks?.toString(),
                                                        '-',
                                                      ),
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            font: GoogleFonts.unbounded(
                                                              fontWeight: FontWeight.w600,
                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FontWeight.w600,
                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                      child: AutoSizeText(
                                                        'Недель',
                                                        maxLines: 1,
                                                        minFontSize: 1.0,
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              font: GoogleFonts.inter(
                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                              fontSize: 13.0,
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
                                          ),
                                        ].divide(SizedBox(width: 8.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                      child: Text(
                                        'Подходит для:',
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
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                          borderRadius: BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context).secondary,
                                          ),
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            final features = containerExerciseDifficultyRow?.features?.toList() ?? [];

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(features.length, (featuresIndex) {
                                                final featuresItem = features[featuresIndex];
                                                return Padding(
                                                  padding: EdgeInsets.all(12.0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                          child: Text(
                                                            valueOrDefault<String>(
                                                              featuresItem.toString(),
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
                                                    ],
                                                  ),
                                                );
                                              }),
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                      child: wrapWithModel(
                        model: _model.generalButtonModel,
                        updateCallback: () => safeSetState(() {}),
                        child: GeneralButtonWidget(
                          title: 'Начать программу',
                          isActive: true,
                          onTap: () async {
                            await UserTable().update(
                              data: {
                                'exerciseDifficulty': containerExerciseDifficultyRow?.id,
                              },
                              matchingRows: (rows) => rows.eqOrNull(
                                'fb_id',
                                currentUserUid,
                              ),
                            );
                            context.safePop();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
