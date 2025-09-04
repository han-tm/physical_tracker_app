import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'profile_weight_view_widget.dart' show ProfileWeightViewWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileWeightViewModel extends FlutterFlowModel<ProfileWeightViewWidget> {
  ///  Local state fields for this component.

  double? weight;

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
