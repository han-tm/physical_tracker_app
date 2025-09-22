import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_weight_view_widget.dart' show ProfileWeightViewWidget;
import 'package:flutter/material.dart';

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
