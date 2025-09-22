import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_age_view_widget.dart' show ProfileAgeViewWidget;
import 'package:flutter/material.dart';

class ProfileAgeViewModel extends FlutterFlowModel<ProfileAgeViewWidget> {
  ///  Local state fields for this component.

  int? age;

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
