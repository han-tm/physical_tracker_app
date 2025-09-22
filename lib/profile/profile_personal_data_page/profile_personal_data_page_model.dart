import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_personal_data_page_widget.dart'
    show ProfilePersonalDataPageWidget;
import 'package:flutter/material.dart';

class ProfilePersonalDataPageModel
    extends FlutterFlowModel<ProfilePersonalDataPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for generalNavBar01 component.
  late GeneralNavBar01Model generalNavBar01Model;

  @override
  void initState(BuildContext context) {
    generalNavBar01Model = createModel(context, () => GeneralNavBar01Model());
  }

  @override
  void dispose() {
    generalNavBar01Model.dispose();
  }
}
