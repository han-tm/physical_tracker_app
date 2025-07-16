import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workouts_exercise_difficulty_page_model.dart';
export 'workouts_exercise_difficulty_page_model.dart';

class WorkoutsExerciseDifficultyPageWidget extends StatefulWidget {
  const WorkoutsExerciseDifficultyPageWidget({super.key});

  static String routeName = 'WorkoutsExerciseDifficultyPage';
  static String routePath = '/workoutsExerciseDifficultyPage';

  @override
  State<WorkoutsExerciseDifficultyPageWidget> createState() =>
      _WorkoutsExerciseDifficultyPageWidgetState();
}

class _WorkoutsExerciseDifficultyPageWidgetState
    extends State<WorkoutsExerciseDifficultyPageWidget> {
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
