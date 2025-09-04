import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'workouts_exercise_process_pause_view_widget.dart'
    show WorkoutsExerciseProcessPauseViewWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkoutsExerciseProcessPauseViewModel
    extends FlutterFlowModel<WorkoutsExerciseProcessPauseViewWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel1;
  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel2;

  @override
  void initState(BuildContext context) {
    generalButtonModel1 = createModel(context, () => GeneralButtonModel());
    generalButtonModel2 = createModel(context, () => GeneralButtonModel());
  }

  @override
  void dispose() {
    generalButtonModel1.dispose();
    generalButtonModel2.dispose();
  }
}
