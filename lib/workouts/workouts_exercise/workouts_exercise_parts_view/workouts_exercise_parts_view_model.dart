import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'workouts_exercise_parts_view_widget.dart'
    show WorkoutsExercisePartsViewWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkoutsExercisePartsViewModel
    extends FlutterFlowModel<WorkoutsExercisePartsViewWidget> {
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
