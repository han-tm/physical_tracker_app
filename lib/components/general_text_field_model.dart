import '/flutter_flow/flutter_flow_util.dart';
import 'general_text_field_widget.dart' show GeneralTextFieldWidget;
import 'package:flutter/material.dart';

class GeneralTextFieldModel extends FlutterFlowModel<GeneralTextFieldWidget> {
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
