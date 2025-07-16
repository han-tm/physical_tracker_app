import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workouts_exercise_parts_view_model.dart';
export 'workouts_exercise_parts_view_model.dart';

class WorkoutsExercisePartsViewWidget extends StatefulWidget {
  const WorkoutsExercisePartsViewWidget({super.key});

  @override
  State<WorkoutsExercisePartsViewWidget> createState() =>
      _WorkoutsExercisePartsViewWidgetState();
}

class _WorkoutsExercisePartsViewWidgetState
    extends State<WorkoutsExercisePartsViewWidget> {
  late WorkoutsExercisePartsViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsExercisePartsViewModel());
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
