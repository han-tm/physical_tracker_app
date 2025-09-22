import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'food_kbzu_summary_view_widget.dart' show FoodKbzuSummaryViewWidget;
import 'package:flutter/material.dart';

class FoodKbzuSummaryViewModel
    extends FlutterFlowModel<FoodKbzuSummaryViewWidget> {
  ///  State fields for stateful widgets in this component.

  Map<String, dynamic>? kbzu;

  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel1;
  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel2;

  @override
  void initState(BuildContext context) {
    generalButtonModel1 = createModel(context, () => GeneralButtonModel());
    generalButtonModel2 = createModel(context, () => GeneralButtonModel());
  }

  @override
  void dispose() {
    generalButtonModel1.dispose();
    generalButtonModel2.dispose();
  }
}
