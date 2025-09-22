import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'journal_exercise_page_widget.dart' show JournalExercisePageWidget;
import 'package:flutter/material.dart';

class JournalExercisePageModel
    extends FlutterFlowModel<JournalExercisePageWidget> {
  ///  Local state fields for this page.

  int part = 0;

  ///  State fields for stateful widgets in this page.

  // Model for generalNavBar01 component.
  late GeneralNavBar01Model generalNavBar01Model;

  @override
  void initState(BuildContext context) {
    generalNavBar01Model = createModel(context, () => GeneralNavBar01Model());
  }

  @override
  void dispose() {
    generalNavBar01Model.dispose();
  }
}
