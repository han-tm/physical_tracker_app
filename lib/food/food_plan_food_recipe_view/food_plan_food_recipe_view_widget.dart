import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_plan_food_recipe_view_model.dart';
export 'food_plan_food_recipe_view_model.dart';

class FoodPlanFoodRecipeViewWidget extends StatefulWidget {
  const FoodPlanFoodRecipeViewWidget({super.key});

  @override
  State<FoodPlanFoodRecipeViewWidget> createState() =>
      _FoodPlanFoodRecipeViewWidgetState();
}

class _FoodPlanFoodRecipeViewWidgetState
    extends State<FoodPlanFoodRecipeViewWidget> {
  late FoodPlanFoodRecipeViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodPlanFoodRecipeViewModel());
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
