import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'workouts_survery_list_page_widget.dart'
    show WorkoutsSurveryListPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkoutsSurveryListPageModel
    extends FlutterFlowModel<WorkoutsSurveryListPageWidget> {
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
