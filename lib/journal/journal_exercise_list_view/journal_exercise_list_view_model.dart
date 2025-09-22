import '/flutter_flow/flutter_flow_util.dart';
import 'journal_exercise_list_view_widget.dart'
    show JournalExerciseListViewWidget;
import 'package:flutter/material.dart';

class JournalExerciseListViewModel
    extends FlutterFlowModel<JournalExerciseListViewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
