import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'food_pro_subscription_view_widget.dart'
    show FoodProSubscriptionViewWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodProSubscriptionViewModel
    extends FlutterFlowModel<FoodProSubscriptionViewWidget> {
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
