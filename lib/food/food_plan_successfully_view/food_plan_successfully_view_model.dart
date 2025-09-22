import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'food_plan_successfully_view_widget.dart'
    show FoodPlanSuccessfullyViewWidget;
import 'package:flutter/material.dart';

class FoodPlanSuccessfullyViewModel
    extends FlutterFlowModel<FoodPlanSuccessfullyViewWidget> {
  ///  State fields for stateful widgets in this component.

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
