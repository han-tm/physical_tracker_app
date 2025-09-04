import '/components/general_button_widget.dart';
import '/components/general_nav_bar01_widget.dart';
import '/components/radio_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'workout_home_inventory_page_widget.dart'
    show WorkoutHomeInventoryPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkoutHomeInventoryPageModel
    extends FlutterFlowModel<WorkoutHomeInventoryPageWidget> {
  ///  Local state fields for this page.

  int? dumbbells;

  int? others;

  ///  State fields for stateful widgets in this page.

  // Model for generalNavBar01 component.
  late GeneralNavBar01Model generalNavBar01Model;
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
  // Model for radioButton component.
  late RadioButtonModel radioButtonModel8;
  // Model for radioButton component.
  late RadioButtonModel radioButtonModel9;
  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel;

  @override
  void initState(BuildContext context) {
    generalNavBar01Model = createModel(context, () => GeneralNavBar01Model());
    radioButtonModel1 = createModel(context, () => RadioButtonModel());
    radioButtonModel2 = createModel(context, () => RadioButtonModel());
    radioButtonModel3 = createModel(context, () => RadioButtonModel());
    radioButtonModel4 = createModel(context, () => RadioButtonModel());
    radioButtonModel5 = createModel(context, () => RadioButtonModel());
    radioButtonModel6 = createModel(context, () => RadioButtonModel());
    radioButtonModel7 = createModel(context, () => RadioButtonModel());
    radioButtonModel8 = createModel(context, () => RadioButtonModel());
    radioButtonModel9 = createModel(context, () => RadioButtonModel());
    generalButtonModel = createModel(context, () => GeneralButtonModel());
  }

  @override
  void dispose() {
    generalNavBar01Model.dispose();
    radioButtonModel1.dispose();
    radioButtonModel2.dispose();
    radioButtonModel3.dispose();
    radioButtonModel4.dispose();
    radioButtonModel5.dispose();
    radioButtonModel6.dispose();
    radioButtonModel7.dispose();
    radioButtonModel8.dispose();
    radioButtonModel9.dispose();
    generalButtonModel.dispose();
  }
}
