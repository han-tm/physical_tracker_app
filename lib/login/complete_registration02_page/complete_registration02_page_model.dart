import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'complete_registration02_page_widget.dart'
    show CompleteRegistration02PageWidget;
import 'package:flutter/material.dart';

class CompleteRegistration02PageModel
    extends FlutterFlowModel<CompleteRegistration02PageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel;

  @override
  void initState(BuildContext context) {
    generalButtonModel = createModel(context, () => GeneralButtonModel());
  }

  @override
  void dispose() {
    generalButtonModel.dispose();
  }
}
