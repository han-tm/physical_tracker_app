import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'workouts_survey_step03_page_model.dart';
export 'workouts_survey_step03_page_model.dart';

class WorkoutsSurveyStep03PageWidget extends StatefulWidget {
  const WorkoutsSurveyStep03PageWidget({super.key});

  static String routeName = 'WorkoutsSurveyStep03Page';
  static String routePath = '/workoutsSurveyStep03Page';

  @override
  State<WorkoutsSurveyStep03PageWidget> createState() =>
      _WorkoutsSurveyStep03PageWidgetState();
}

class _WorkoutsSurveyStep03PageWidgetState
    extends State<WorkoutsSurveyStep03PageWidget> {
  late WorkoutsSurveyStep03PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsSurveyStep03PageModel());
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
