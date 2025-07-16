import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_ai_nutritionist_view_model.dart';
export 'food_ai_nutritionist_view_model.dart';

class FoodAiNutritionistViewWidget extends StatefulWidget {
  const FoodAiNutritionistViewWidget({super.key});

  @override
  State<FoodAiNutritionistViewWidget> createState() =>
      _FoodAiNutritionistViewWidgetState();
}

class _FoodAiNutritionistViewWidgetState
    extends State<FoodAiNutritionistViewWidget> {
  late FoodAiNutritionistViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodAiNutritionistViewModel());
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
