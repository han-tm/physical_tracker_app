import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_success_widget.dart' show PaymentSuccessWidget;
import 'package:flutter/material.dart';

class PaymentSuccessModel extends FlutterFlowModel<PaymentSuccessWidget> {
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
