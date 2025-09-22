import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'survey03_page_widget.dart' show Survey03PageWidget;
import 'package:flutter/material.dart';

class Survey03PageModel extends FlutterFlowModel<Survey03PageWidget> {
  ///  Local state fields for this page.

  double? weight;

  late FixedExtentScrollController scrollController;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Slider widget.
  double? sliderValue;
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
