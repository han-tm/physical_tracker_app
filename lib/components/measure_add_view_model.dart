import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'measure_add_view_widget.dart' show MeasureAddViewWidget;
import 'package:flutter/material.dart';

class MeasureAddViewModel extends FlutterFlowModel<MeasureAddViewWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel;

  @override
  void initState(BuildContext context) {
    generalButtonModel = createModel(context, () => GeneralButtonModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    generalButtonModel.dispose();
  }
}
