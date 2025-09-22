import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'survey01_page_widget.dart' show Survey01PageWidget;
import 'package:flutter/material.dart';

class Survey01PageModel extends FlutterFlowModel<Survey01PageWidget> {
  ///  Local state fields for this page.

  int? gender;

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
