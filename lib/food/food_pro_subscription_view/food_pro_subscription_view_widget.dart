import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_pro_subscription_view_model.dart';
export 'food_pro_subscription_view_model.dart';

class FoodProSubscriptionViewWidget extends StatefulWidget {
  const FoodProSubscriptionViewWidget({super.key});

  @override
  State<FoodProSubscriptionViewWidget> createState() =>
      _FoodProSubscriptionViewWidgetState();
}

class _FoodProSubscriptionViewWidgetState
    extends State<FoodProSubscriptionViewWidget> {
  late FoodProSubscriptionViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodProSubscriptionViewModel());
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
