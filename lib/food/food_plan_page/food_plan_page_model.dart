import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'food_plan_page_widget.dart' show FoodPlanPageWidget;
import 'package:flutter/material.dart';

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
