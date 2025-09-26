import 'dart:io';

import 'package:boom_client/backend/supabase/supabase.dart';
import 'package:boom_client/userData/PreRegistrationStorage.dart';
import 'package:provider/provider.dart';

import '../../../auth/firebase_auth/auth_util.dart';
import '../../../components/general_button_widget.dart';
import '../../../userData/PreRegistrationData.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'workout_survey_success.dart';
import 'workouts_survery_list_page_model.dart';
export 'workouts_survery_list_page_model.dart';

class WorkoutsSurveryListPageWidget extends StatefulWidget {
  const WorkoutsSurveryListPageWidget({super.key});

  static String routeName = 'WorkoutsSurveryListPage';
  static String routePath = '/workoutsSurveryListPage';

  @override
  State<WorkoutsSurveryListPageWidget> createState() => _WorkoutsSurveryListPageWidgetState();
}

class _WorkoutsSurveryListPageWidgetState extends State<WorkoutsSurveryListPageWidget> {
  late WorkoutsSurveryListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  PreRegistrationData? initSurvey;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsSurveryListPageModel());
    initStorage();
  }

  void initStorage() async {
    initSurvey = await PreRegistrationStorage.load();
    print('initSurvey: $initSurvey');
    if (initSurvey != null) {
      final state = FFAppState();
      state.shoulderGirth = initSurvey!.shoulders;
      state.chestGirth = initSurvey!.chest;
      state.waistGirth = initSurvey!.waist;
      state.abdomenGirth = initSurvey!.belly;
      state.thighGirth = initSurvey!.thigh;
      state.hipsGirth = initSurvey!.hips;
      state.photoBack = initSurvey!.photoBack?.path;
      state.photoFront = initSurvey!.photoFront?.path;
      state.photoSide = initSurvey!.photoSide?.path;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> onSave() async {
    try {
      final userSnapshot = await AppSupabase.instance.client.from('User').select().eq('fb_id', currentUserUid).single();

      final int? indId = userSnapshot['individualProgramId'];

      if (indId != null) {
        final state = FFAppState();
        final photoFrontUrl =
            state.photoFront == null ? null : await _uploadSupabaseStorageFile(path: state.photoFront!);
        final photoBackUrl = state.photoBack == null ? null : await _uploadSupabaseStorageFile(path: state.photoBack!);
        final photoSideUrl = state.photoSide == null ? null : await _uploadSupabaseStorageFile(path: state.photoSide!);

        Map<String, dynamic> data = {
          "isFilled": true,
          "train_zone": state.traininPlace,
          "inventory": state.inventory,
          "goal": state.goal,
          "restrictions": state.restrictions,
          "next_cycle_date": state.nextCycle?.toLocal().toIso8601String(),
          "train_exp_duration": state.trainDuration,
          "train_exp_exercise": state.trainExercise,
          "weights": state.trainWeight,
          "body_accent": state.bodyAccent,
          "body_not": state.bodyNotDo,
          "can_count_kbzu": state.canCountKBZU,
          "img_front": photoFrontUrl,
          "img_back": photoBackUrl,
          "img_side": photoSideUrl,
        };
        print(data);

        await AppSupabase.instance.client.from('IndividualProgram').update(data).eq('id', indId);

        if (mounted) {
          context.pushReplacementNamed(WorkoutSurveySuccessPageWidget.routeName);
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Не удалось найти программу')));
        }
      }
    } catch (e) {
      print('Error {onSave}: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  Future<String> _uploadSupabaseStorageFile({required String path}) async {
    final storageBucket = AppSupabase.instance.client.storage.from('boom-bucket');

    final filename = '${currentUserUid}_${DateTime.now().millisecondsSinceEpoch}.jpg';

    await storageBucket.upload(
      'surveys/$filename',
      File(path),
      fileOptions: const FileOptions(contentType: null),
    );

    return storageBucket.getPublicUrl('surveys/$filename');
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
              wrapWithModel(
                model: _model.generalNavBar01Model,
                updateCallback: () => safeSetState(() {}),
                child: const GeneralNavBar01Widget(
                  title: 'Опрос',
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
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                child: Text(
                                  'Чем подробней вы дадите информацию, тем более детально и точно мне сделаем вам программу',
                                  textAlign: TextAlign.start,
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(WorkoutsSurveyBodyMeasurementsPageWidget.routeName);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondary,
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Замеры тела',
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
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: FlutterFlowTheme.of(context).primaryText,
                                              size: 18.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.pushNamed(WorkoutsSurveyStep01PageWidget.routeName);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondary,
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Цель',
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
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  if (state.goal != null)
                                                    Flexible(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: const Color(0x21E27B00),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme.of(context).primary,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                              12.0, 4.0, 12.0, 4.0),
                                                          child: Text(
                                                            state.goal!,
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.unbounded(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                  fontSize: 13.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (state.goal != null)
                                                    GestureDetector(
                                                      onTap: () {
                                                        state.goal = null;
                                                        setState(() {});
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                        child: Icon(
                                                          Icons.close,
                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  if (state.goal == null)
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      size: 18.0,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.pushNamed(WorkoutsSurveyStep02PageWidget.routeName);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondary,
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Ограничения',
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
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (state.restrictions != null)
                                                    Flexible(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: const Color(0x21E27B00),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme.of(context).primary,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                              12.0, 4.0, 12.0, 4.0),
                                                          child: Text(
                                                            state.restrictions!,
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.unbounded(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                  fontSize: 13.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (state.restrictions != null)
                                                    GestureDetector(
                                                      onTap: () {
                                                        state.restrictions = null;
                                                        setState(() {});
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                        child: Icon(
                                                          Icons.close,
                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  if (state.restrictions == null)
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      size: 18.0,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.pushNamed(WorkoutsSurveyStep03PageWidget.routeName);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondary,
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Дата начала следующего цикла',
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
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  if (state.nextCycle != null)
                                                    Flexible(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: const Color(0x21E27B00),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme.of(context).primary,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                              12.0, 4.0, 12.0, 4.0),
                                                          child: Text(
                                                            DateFormat('dd.MM').format(state.nextCycle!),
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.unbounded(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                  fontSize: 13.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (state.nextCycle != null)
                                                    GestureDetector(
                                                      onTap: () {
                                                        state.nextCycle = null;
                                                        setState(() {});
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                        child: Icon(
                                                          Icons.close,
                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  if (state.nextCycle == null)
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      size: 18.0,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.pushNamed(WorkoutsSurveyStep04PageWidget.routeName);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondary,
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Опыт в тренировках',
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
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  if (state.trainDuration != null && state.trainExercise != null)
                                                    Flexible(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: const Color(0x21E27B00),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme.of(context).primary,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                              12.0, 4.0, 12.0, 4.0),
                                                          child: Text(
                                                            '${state.trainDuration!}/${state.trainExercise!}',
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.unbounded(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                  fontSize: 13.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (state.trainDuration != null && state.trainExercise != null)
                                                    GestureDetector(
                                                      onTap: () {
                                                        state.trainDuration = null;
                                                        state.trainExercise = null;
                                                        setState(() {});
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                        child: Icon(
                                                          Icons.close,
                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  if (state.trainDuration == null && state.trainExercise == null)
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      size: 18.0,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.pushNamed(WorkoutsSurveyStep05PageWidget.routeName);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondary,
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Какие веса берете?',
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
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  if (state.trainWeight != null)
                                                    Flexible(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: const Color(0x21E27B00),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme.of(context).primary,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                              12.0, 4.0, 12.0, 4.0),
                                                          child: Text(
                                                            state.trainWeight!,
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.unbounded(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                  fontSize: 13.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (state.trainWeight != null)
                                                    GestureDetector(
                                                      onTap: () {
                                                        state.trainWeight = null;
                                                        setState(() {});
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                        child: Icon(
                                                          Icons.close,
                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  if (state.trainWeight == null)
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      size: 18.0,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.pushNamed(WorkoutsSurveyStep06PageWidget.routeName);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondary,
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Акцентная часть тела',
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
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  if (state.bodyAccent != null)
                                                    Flexible(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: const Color(0x21E27B00),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme.of(context).primary,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                              12.0, 4.0, 12.0, 4.0),
                                                          child: Text(
                                                            state.bodyAccent!,
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.unbounded(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                  fontSize: 13.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (state.bodyAccent != null)
                                                    GestureDetector(
                                                      onTap: () {
                                                        state.bodyAccent = null;
                                                        setState(() {});
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                        child: Icon(
                                                          Icons.close,
                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  if (state.bodyAccent == null)
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      size: 18.0,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.pushNamed(WorkoutsSurveyStep07PageWidget.routeName);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondary,
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Что не трогать',
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
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  if (state.bodyNotDo != null)
                                                    Flexible(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: const Color(0x21E27B00),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme.of(context).primary,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                              12.0, 4.0, 12.0, 4.0),
                                                          child: Text(
                                                            state.bodyNotDo!,
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.unbounded(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                  fontSize: 13.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (state.bodyNotDo != null)
                                                    GestureDetector(
                                                      onTap: () {
                                                        state.bodyNotDo = null;
                                                        setState(() {});
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                        child: Icon(
                                                          Icons.close,
                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  if (state.bodyNotDo == null)
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      size: 18.0,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.pushNamed(WorkoutsSurveyStep08PageWidget.routeName);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondary,
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'КБЖУ',
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
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  if (state.canCountKBZU != null)
                                                    Flexible(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: const Color(0x21E27B00),
                                                          borderRadius: BorderRadius.circular(100.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme.of(context).primary,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                              12.0, 4.0, 12.0, 4.0),
                                                          child: Text(
                                                            state.canCountKBZU!,
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.unbounded(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                  fontSize: 13.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (state.canCountKBZU != null)
                                                    GestureDetector(
                                                      onTap: () {
                                                        state.canCountKBZU = null;
                                                        setState(() {});
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                        child: Icon(
                                                          Icons.close,
                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  if (state.canCountKBZU == null)
                                                    Icon(
                                                      Icons.arrow_forward_ios,
                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                      size: 18.0,
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.pushNamed(WorkoutsSurveyStep09PageWidget.routeName);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondary,
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Фото',
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
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: FlutterFlowTheme.of(context).primaryText,
                                              size: 18.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 16.0)),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 8.0),
                                child: GeneralButtonWidget(
                                  title: 'Сохранить',
                                  isActive: true,
                                  onTap: () async {
                                    await onSave();
                                    // context.pushReplacementNamed(WorkoutSurveySuccessPageWidget.routeName);
                                  },
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
