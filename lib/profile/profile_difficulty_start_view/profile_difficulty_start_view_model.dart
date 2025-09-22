import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_difficulty_start_view_widget.dart'
    show ProfileDifficultyStartViewWidget;
import 'package:flutter/material.dart';

class ProfileDifficultyStartViewModel
    extends FlutterFlowModel<ProfileDifficultyStartViewWidget> {
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
