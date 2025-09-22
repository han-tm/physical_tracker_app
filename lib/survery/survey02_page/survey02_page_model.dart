import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'survey02_page_widget.dart' show Survey02PageWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Survey02PageModel extends FlutterFlowModel<Survey02PageWidget> {
  ///  Local state fields for this page.

  DateTime? dateSelected;

  ///  State fields for stateful widgets in this page.

  DateTime? datePicked;
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
