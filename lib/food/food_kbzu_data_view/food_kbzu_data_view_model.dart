import '/components/general_button_widget.dart';
import '/components/radio_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'food_kbzu_data_view_widget.dart' show FoodKbzuDataViewWidget;
import 'package:flutter/material.dart';

class FoodKbzuDataViewModel extends FlutterFlowModel<FoodKbzuDataViewWidget> {
  ///  Local state fields for this component.

  int? gender;

  int? age;

  double? height;

  double? weight;

  int? activityLevel;

  int? goal;

  ///  State fields for stateful widgets in this component.

  // Model for radioButton component.
  late RadioButtonModel radioButtonModel1;
  // Model for radioButton component.
  late RadioButtonModel radioButtonModel2;
  // Model for radioButton component.
  late RadioButtonModel radioButtonModel3;
  // Model for radioButton component.
  late RadioButtonModel radioButtonModel4;
  // Model for radioButton component.
  late RadioButtonModel radioButtonModel5;
  // Model for radioButton component.
  late RadioButtonModel radioButtonModel6;
  // Model for radioButton component.
  late RadioButtonModel radioButtonModel7;
  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel;

  @override
  void initState(BuildContext context) {
    radioButtonModel1 = createModel(context, () => RadioButtonModel());
    radioButtonModel2 = createModel(context, () => RadioButtonModel());
    radioButtonModel3 = createModel(context, () => RadioButtonModel());
    radioButtonModel4 = createModel(context, () => RadioButtonModel());
    radioButtonModel5 = createModel(context, () => RadioButtonModel());
    radioButtonModel6 = createModel(context, () => RadioButtonModel());
    radioButtonModel7 = createModel(context, () => RadioButtonModel());
    generalButtonModel = createModel(context, () => GeneralButtonModel());
  }

  @override
  void dispose() {
    radioButtonModel1.dispose();
    radioButtonModel2.dispose();
    radioButtonModel3.dispose();
    radioButtonModel4.dispose();
    radioButtonModel5.dispose();
    radioButtonModel6.dispose();
    radioButtonModel7.dispose();
    generalButtonModel.dispose();
  }
}
