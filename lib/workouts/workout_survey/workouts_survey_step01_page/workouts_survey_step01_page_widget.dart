import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workouts_survey_step01_page_model.dart';
export 'workouts_survey_step01_page_model.dart';

class WorkoutsSurveyStep01PageWidget extends StatefulWidget {
  const WorkoutsSurveyStep01PageWidget({super.key});

  static String routeName = 'WorkoutsSurveyStep01Page';
  static String routePath = '/workoutsSurveyStep01Page';

  @override
  State<WorkoutsSurveyStep01PageWidget> createState() =>
      _WorkoutsSurveyStep01PageWidgetState();
}

class _WorkoutsSurveyStep01PageWidgetState
    extends State<WorkoutsSurveyStep01PageWidget> {
  late WorkoutsSurveyStep01PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsSurveyStep01PageModel());
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
            children: [],
          ),
        ),
      ),
    );
  }
}
