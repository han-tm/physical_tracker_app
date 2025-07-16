import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_plan_food_list_view_model.dart';
export 'food_plan_food_list_view_model.dart';

class FoodPlanFoodListViewWidget extends StatefulWidget {
  const FoodPlanFoodListViewWidget({super.key});

  @override
  State<FoodPlanFoodListViewWidget> createState() =>
      _FoodPlanFoodListViewWidgetState();
}

class _FoodPlanFoodListViewWidgetState
    extends State<FoodPlanFoodListViewWidget> {
  late FoodPlanFoodListViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodPlanFoodListViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
