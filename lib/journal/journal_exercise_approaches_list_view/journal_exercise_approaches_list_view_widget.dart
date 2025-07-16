import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'journal_exercise_approaches_list_view_model.dart';
export 'journal_exercise_approaches_list_view_model.dart';

class JournalExerciseApproachesListViewWidget extends StatefulWidget {
  const JournalExerciseApproachesListViewWidget({super.key});

  @override
  State<JournalExerciseApproachesListViewWidget> createState() =>
      _JournalExerciseApproachesListViewWidgetState();
}

class _JournalExerciseApproachesListViewWidgetState
    extends State<JournalExerciseApproachesListViewWidget> {
  late JournalExerciseApproachesListViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => JournalExerciseApproachesListViewModel());
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
