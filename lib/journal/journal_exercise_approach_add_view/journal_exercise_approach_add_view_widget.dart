import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'journal_exercise_approach_add_view_model.dart';
export 'journal_exercise_approach_add_view_model.dart';

class JournalExerciseApproachAddViewWidget extends StatefulWidget {
  const JournalExerciseApproachAddViewWidget({super.key});

  @override
  State<JournalExerciseApproachAddViewWidget> createState() =>
      _JournalExerciseApproachAddViewWidgetState();
}

class _JournalExerciseApproachAddViewWidgetState
    extends State<JournalExerciseApproachAddViewWidget> {
  late JournalExerciseApproachAddViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalExerciseApproachAddViewModel());
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
