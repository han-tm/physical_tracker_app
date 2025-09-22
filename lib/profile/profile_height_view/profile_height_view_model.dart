import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_height_view_widget.dart' show ProfileHeightViewWidget;
import 'package:flutter/material.dart';

class ProfileHeightViewModel extends FlutterFlowModel<ProfileHeightViewWidget> {
  ///  Local state fields for this component.

  double? height;

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
