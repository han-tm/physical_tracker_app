import 'dart:io';

import 'package:boom_client/components/checkbox_widget.dart';
import 'package:boom_client/components/media_select_view_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../components/general_button_widget.dart';
import '../../../index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'workouts_survey_step09_page_model.dart';
export 'workouts_survey_step09_page_model.dart';

class WorkoutsSurveyStep09PageWidget extends StatefulWidget {
  const WorkoutsSurveyStep09PageWidget({super.key});

  static String routeName = 'WorkoutsSurveyStep09Page';
  static String routePath = '/workoutsSurveyStep09Page';

  @override
  State<WorkoutsSurveyStep09PageWidget> createState() => _WorkoutsSurveyStep09PageWidgetState();
}

class _WorkoutsSurveyStep09PageWidgetState extends State<WorkoutsSurveyStep09PageWidget> {
  late WorkoutsSurveyStep09PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsSurveyStep09PageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      final state = context.watch<FFAppState>();
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
                            'Шаг9/9',
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
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Фото \"до\"',
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
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 32.0),
                            child: Text(
                              'Фотографии помогут вам отслеживать прогресс и заметить реальные изменения вашего тела. Замеры и фото делаются на голодный желудок.',
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
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Примеры фото',
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
                                        child: AspectRatio(
                                          aspectRatio: 0.73,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).secondary,
                                              borderRadius: BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      child: Image.asset(
                                                        'assets/images/photo_front.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                    child: Text(
                                                      'Фото анфас',
                                                      textAlign: TextAlign.center,
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            font: GoogleFonts.inter(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: AspectRatio(
                                          aspectRatio: 0.73,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).secondary,
                                              borderRadius: BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      child: Image.asset(
                                                        'assets/images/photo_back.png',
                                                        height: 125.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                    child: Text(
                                                      'Фото со спины',
                                                      textAlign: TextAlign.center,
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            font: GoogleFonts.inter(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: AspectRatio(
                                          aspectRatio: 0.73,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).secondary,
                                              borderRadius: BorderRadius.circular(16.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      child: Image.asset(
                                                        'assets/images/photo_side.png',
                                                        height: 125.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                    child: Text(
                                                      'Фото боком',
                                                      textAlign: TextAlign.center,
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            font: GoogleFonts.inter(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                                                          state.photoFront = media.path;
                                                          // print(media.);
                                                          // _model.photo01 = media;
                                                          // safeSetState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) => safeSetState(() {}));
                                            },
                                            child: AspectRatio(
                                              aspectRatio: 0.73,
                                              child: Container(
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
                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                0.0, 8.0, 0.0, 0.0),
                                                            child: Text(
                                                              'Фото анфас',
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
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (state.photoFront != null)
                                                      Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration: const BoxDecoration(),
                                                        child: Stack(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius: BorderRadius.circular(16.0),
                                                              child: Image.file(
                                                                File(state.photoFront!),
                                                                width: double.infinity,
                                                                height: double.infinity,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment: const AlignmentDirectional(1.0, -1.0),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional.fromSTEB(
                                                                    0.0, 8.0, 8.0, 0.0),
                                                                child: InkWell(
                                                                  splashColor: Colors.transparent,
                                                                  focusColor: Colors.transparent,
                                                                  hoverColor: Colors.transparent,
                                                                  highlightColor: Colors.transparent,
                                                                  onTap: () async {
                                                                    state.photoFront = null;
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
                                                          state.photoBack = media.path;
                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) => safeSetState(() {}));
                                            },
                                            child: AspectRatio(
                                              aspectRatio: 0.73,
                                              child: Container(
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
                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                0.0, 8.0, 0.0, 0.0),
                                                            child: Text(
                                                              'Фото со спины',
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
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (state.photoBack != null)
                                                      Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration: const BoxDecoration(),
                                                        child: Stack(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius: BorderRadius.circular(16.0),
                                                              child: Image.file(
                                                                File(state.photoBack!),
                                                                width: double.infinity,
                                                                height: double.infinity,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment: const AlignmentDirectional(1.0, -1.0),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional.fromSTEB(
                                                                    0.0, 8.0, 8.0, 0.0),
                                                                child: InkWell(
                                                                  splashColor: Colors.transparent,
                                                                  focusColor: Colors.transparent,
                                                                  hoverColor: Colors.transparent,
                                                                  highlightColor: Colors.transparent,
                                                                  onTap: () async {
                                                                    state.photoBack = null;
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
                                                          state.photoSide = media.path;
                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) => safeSetState(() {}));
                                            },
                                            child: AspectRatio(
                                              aspectRatio: 0.73,
                                              child: Container(
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
                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                0.0, 8.0, 0.0, 0.0),
                                                            child: Text(
                                                              'Фото боком',
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
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (state.photoSide != null)
                                                      Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration: const BoxDecoration(),
                                                        child: Stack(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius: BorderRadius.circular(16.0),
                                                              child: Image.file(
                                                                File(state.photoSide!),
                                                                width: double.infinity,
                                                                height: double.infinity,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment: const AlignmentDirectional(1.0, -1.0),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional.fromSTEB(
                                                                    0.0, 8.0, 8.0, 0.0),
                                                                child: InkWell(
                                                                  splashColor: Colors.transparent,
                                                                  focusColor: Colors.transparent,
                                                                  hoverColor: Colors.transparent,
                                                                  highlightColor: Colors.transparent,
                                                                  onTap: () async {
                                                                    state.photoSide = null;
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
                                        ),
                                      ].divide(const SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.isAgree = !_model.isAgree;
                                safeSetState(() {});
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  CheckboxWidget(checked: _model.isAgree),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Я согласен(на) на использование моих фото (без лица и персональных данных) в рекламных целях',
                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                              color: FlutterFlowTheme.of(context).primaryText,
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
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
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                child: GeneralButtonWidget(
                  title: 'Сохранить',
                  isActive: (state.photoBack != null && state.photoFront != null && state.photoSide != null) &&
                      _model.isAgree,
                  onTap: () async {
                        context.pushNamed(WorkoutsSurveryListPageWidget.routeName);
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
