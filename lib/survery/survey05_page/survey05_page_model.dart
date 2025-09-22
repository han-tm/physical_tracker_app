import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'survey05_page_widget.dart' show Survey05PageWidget;
import 'package:flutter/material.dart';

class Survey05PageModel extends FlutterFlowModel<Survey05PageWidget> {
  ///  Local state fields for this page.

  double? shoulderGirth;   // Обхват плечевого пояса
  double? chestGirth;      // Обхват груди
  double? waistGirth;      // Обхват талии
  double? abdomenGirth;    // Обхват живота
  double? thighGirth;      // Обхват бедра (одна нога)
  double? hipsGirth;       // Обхват ягодиц

  ///  State fields for stateful widgets in this page.

  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel;

  @override
  void initState(BuildContext context) {
    generalButtonModel = createModel(context, () => GeneralButtonModel());
    shoulderGirth = FFAppState().shoulderGirth;
    chestGirth = FFAppState().chestGirth;
    waistGirth = FFAppState().waistGirth;
    abdomenGirth = FFAppState().abdomenGirth;
    thighGirth = FFAppState().thighGirth;
    hipsGirth = FFAppState().hipsGirth;
  }

  @override
  void dispose() {
    generalButtonModel.dispose();
  }
}
