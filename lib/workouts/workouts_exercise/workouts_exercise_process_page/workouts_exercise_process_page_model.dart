import '/components/general_button_widget.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'workouts_exercise_process_page_widget.dart'
    show WorkoutsExerciseProcessPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkoutsExerciseProcessPageModel
    extends FlutterFlowModel<WorkoutsExerciseProcessPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for generalNavBar01 component.
  late GeneralNavBar01Model generalNavBar01Model;
  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel1;
  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel2;

  @override
  void initState(BuildContext context) {
    generalNavBar01Model = createModel(context, () => GeneralNavBar01Model());
    generalButtonModel1 = createModel(context, () => GeneralButtonModel());
    generalButtonModel2 = createModel(context, () => GeneralButtonModel());
  }

  @override
  void dispose() {
    generalNavBar01Model.dispose();
    generalButtonModel1.dispose();
    generalButtonModel2.dispose();
  }
}
