import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'workouts_survey_step08_page_model.dart';
export 'workouts_survey_step08_page_model.dart';

class WorkoutsSurveyStep08PageWidget extends StatefulWidget {
  const WorkoutsSurveyStep08PageWidget({super.key});

  static String routeName = 'WorkoutsSurveyStep08Page';
  static String routePath = '/workoutsSurveyStep08Page';

  @override
  State<WorkoutsSurveyStep08PageWidget> createState() =>
      _WorkoutsSurveyStep08PageWidgetState();
}

class _WorkoutsSurveyStep08PageWidgetState
    extends State<WorkoutsSurveyStep08PageWidget> {
  late WorkoutsSurveyStep08PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsSurveyStep08PageModel());
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
