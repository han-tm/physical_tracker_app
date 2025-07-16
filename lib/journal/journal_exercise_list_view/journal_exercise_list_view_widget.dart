import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'journal_exercise_list_view_model.dart';
export 'journal_exercise_list_view_model.dart';

class JournalExerciseListViewWidget extends StatefulWidget {
  const JournalExerciseListViewWidget({super.key});

  @override
  State<JournalExerciseListViewWidget> createState() =>
      _JournalExerciseListViewWidgetState();
}

class _JournalExerciseListViewWidgetState
    extends State<JournalExerciseListViewWidget> {
  late JournalExerciseListViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalExerciseListViewModel());
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
