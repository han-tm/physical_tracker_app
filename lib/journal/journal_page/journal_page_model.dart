import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'journal_page_widget.dart' show JournalPageWidget;
import 'package:flutter/material.dart';

class JournalPageModel extends FlutterFlowModel<JournalPageWidget> {
  ///  Local state fields for this page.

  int part = 0;


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
