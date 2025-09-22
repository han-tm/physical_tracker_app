import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'journal_exercise_approach_add_view_widget.dart'
    show JournalExerciseApproachAddViewWidget;
import 'package:flutter/material.dart';

class JournalExerciseApproachAddViewModel
    extends FlutterFlowModel<JournalExerciseApproachAddViewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel;

  @override
  void initState(BuildContext context) {
    generalButtonModel = createModel(context, () => GeneralButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    generalButtonModel.dispose();
  }
}
