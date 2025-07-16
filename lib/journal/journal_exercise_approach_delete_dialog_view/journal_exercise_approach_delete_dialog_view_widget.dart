import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'journal_exercise_approach_delete_dialog_view_model.dart';
export 'journal_exercise_approach_delete_dialog_view_model.dart';

class JournalExerciseApproachDeleteDialogViewWidget extends StatefulWidget {
  const JournalExerciseApproachDeleteDialogViewWidget({super.key});

  @override
  State<JournalExerciseApproachDeleteDialogViewWidget> createState() =>
      _JournalExerciseApproachDeleteDialogViewWidgetState();
}

class _JournalExerciseApproachDeleteDialogViewWidgetState
    extends State<JournalExerciseApproachDeleteDialogViewWidget> {
  late JournalExerciseApproachDeleteDialogViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => JournalExerciseApproachDeleteDialogViewModel());
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
