import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_measurement_successfully_added_page_widget.dart'
    show ProfileMeasurementSuccessfullyAddedPageWidget;
import 'package:flutter/material.dart';

class ProfileMeasurementSuccessfullyAddedPageModel
    extends FlutterFlowModel<ProfileMeasurementSuccessfullyAddedPageWidget> {
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
