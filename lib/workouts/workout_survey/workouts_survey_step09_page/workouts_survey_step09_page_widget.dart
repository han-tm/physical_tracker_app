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
  State<WorkoutsSurveyStep09PageWidget> createState() =>
      _WorkoutsSurveyStep09PageWidgetState();
}

class _WorkoutsSurveyStep09PageWidgetState
    extends State<WorkoutsSurveyStep09PageWidget> {
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: const SafeArea(
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
