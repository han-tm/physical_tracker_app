import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workouts_survey_step04_page_model.dart';
export 'workouts_survey_step04_page_model.dart';

class WorkoutsSurveyStep04PageWidget extends StatefulWidget {
  const WorkoutsSurveyStep04PageWidget({super.key});

  static String routeName = 'WorkoutsSurveyStep04Page';
  static String routePath = '/workoutsSurveyStep04Page';

  @override
  State<WorkoutsSurveyStep04PageWidget> createState() =>
      _WorkoutsSurveyStep04PageWidgetState();
}

class _WorkoutsSurveyStep04PageWidgetState
    extends State<WorkoutsSurveyStep04PageWidget> {
  late WorkoutsSurveyStep04PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsSurveyStep04PageModel());
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
