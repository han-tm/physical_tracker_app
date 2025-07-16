import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'journal_exercise_history_view_model.dart';
export 'journal_exercise_history_view_model.dart';

class JournalExerciseHistoryViewWidget extends StatefulWidget {
  const JournalExerciseHistoryViewWidget({super.key});

  @override
  State<JournalExerciseHistoryViewWidget> createState() =>
      _JournalExerciseHistoryViewWidgetState();
}

class _JournalExerciseHistoryViewWidgetState
    extends State<JournalExerciseHistoryViewWidget> {
  late JournalExerciseHistoryViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalExerciseHistoryViewModel());
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
