import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'food_ai_nutritionist_view_widget.dart'
    show FoodAiNutritionistViewWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodAiNutritionistViewModel
    extends FlutterFlowModel<FoodAiNutritionistViewWidget> {

  int selectedDays = 7;
  int selectedMeals = 3;
  int selectedBudget = 2;
  Set<String> requiredProducts = {};
  Set<String> excludedProducts = {};

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
