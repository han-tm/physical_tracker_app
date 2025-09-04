import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/food/food_plan_food_list_view/food_plan_food_list_view_widget.dart';
import '/food/food_plan_food_recipe_view/food_plan_food_recipe_view_widget.dart';
import 'dart:ui';
import 'food_plan_page_widget.dart' show FoodPlanPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodPlanPageModel extends FlutterFlowModel<FoodPlanPageWidget> {
  ///  Local state fields for this page.

  int daySelected = 0;

  Map<DateTime, List<dynamic>> mealsByDay = {};

  List<int> days = [1, 2, 3, 4, 5, 6, 7];
  void addToDays(int item) => days.add(item);
  void removeFromDays(int item) => days.remove(item);
  void removeAtIndexFromDays(int index) => days.removeAt(index);
  void insertAtIndexInDays(int index, int item) => days.insert(index, item);
  void updateDaysAtIndex(int index, Function(int) updateFn) =>
      days[index] = updateFn(days[index]);


  ///  State fields for stateful widgets in this page.

  // Model for generalNavBar01 component.
  late GeneralNavBar01Model generalNavBar01Model;

  @override
  void initState(BuildContext context) {
    generalNavBar01Model = createModel(context, () => GeneralNavBar01Model());
  }

  @override
  void dispose() {
    generalNavBar01Model.dispose();
  }
}
