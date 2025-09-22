import '/components/checkbox_widget.dart';
import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'survey06_page_widget.dart' show Survey06PageWidget;
import 'package:flutter/material.dart';

class Survey06PageModel extends FlutterFlowModel<Survey06PageWidget> {
  ///  Local state fields for this page.

  bool isAgree = false;

  FFUploadedFile? photo01;

  FFUploadedFile? photo02;

  FFUploadedFile? photo03;

  ///  State fields for stateful widgets in this page.

  // Model for checkbox component.
  late CheckboxModel checkboxModel;
  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel;

  @override
  void initState(BuildContext context) {
    checkboxModel = createModel(context, () => CheckboxModel());
    generalButtonModel = createModel(context, () => GeneralButtonModel());
  }

  @override
  void dispose() {
    checkboxModel.dispose();
    generalButtonModel.dispose();
  }
}
