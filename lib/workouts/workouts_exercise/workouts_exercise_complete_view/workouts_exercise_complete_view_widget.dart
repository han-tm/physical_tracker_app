import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workouts_exercise_complete_view_model.dart';
export 'workouts_exercise_complete_view_model.dart';

class WorkoutsExerciseCompleteViewWidget extends StatefulWidget {
  const WorkoutsExerciseCompleteViewWidget({super.key});

  @override
  State<WorkoutsExerciseCompleteViewWidget> createState() =>
      _WorkoutsExerciseCompleteViewWidgetState();
}

class _WorkoutsExerciseCompleteViewWidgetState
    extends State<WorkoutsExerciseCompleteViewWidget> {
  late WorkoutsExerciseCompleteViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsExerciseCompleteViewModel());
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
