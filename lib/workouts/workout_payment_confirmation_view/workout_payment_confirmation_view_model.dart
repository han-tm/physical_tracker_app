import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'workout_payment_confirmation_view_widget.dart'
    show WorkoutPaymentConfirmationViewWidget;
import 'package:flutter/material.dart';

class WorkoutPaymentConfirmationViewModel
    extends FlutterFlowModel<WorkoutPaymentConfirmationViewWidget> {
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
