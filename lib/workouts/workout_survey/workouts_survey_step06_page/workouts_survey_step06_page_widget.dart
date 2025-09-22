import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'workouts_survey_step06_page_model.dart';
export 'workouts_survey_step06_page_model.dart';

class WorkoutsSurveyStep06PageWidget extends StatefulWidget {
  const WorkoutsSurveyStep06PageWidget({super.key});

  static String routeName = 'WorkoutsSurveyStep06Page';
  static String routePath = '/workoutsSurveyStep06Page';

  @override
  State<WorkoutsSurveyStep06PageWidget> createState() =>
      _WorkoutsSurveyStep06PageWidgetState();
}

class _WorkoutsSurveyStep06PageWidgetState
    extends State<WorkoutsSurveyStep06PageWidget> {
  late WorkoutsSurveyStep06PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsSurveyStep06PageModel());
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
