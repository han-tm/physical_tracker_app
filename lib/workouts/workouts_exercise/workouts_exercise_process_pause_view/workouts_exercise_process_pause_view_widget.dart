import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workouts_exercise_process_pause_view_model.dart';
export 'workouts_exercise_process_pause_view_model.dart';

class WorkoutsExerciseProcessPauseViewWidget extends StatefulWidget {
  const WorkoutsExerciseProcessPauseViewWidget({super.key});

  @override
  State<WorkoutsExerciseProcessPauseViewWidget> createState() =>
      _WorkoutsExerciseProcessPauseViewWidgetState();
}

class _WorkoutsExerciseProcessPauseViewWidgetState
    extends State<WorkoutsExerciseProcessPauseViewWidget> {
  late WorkoutsExerciseProcessPauseViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => WorkoutsExerciseProcessPauseViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
