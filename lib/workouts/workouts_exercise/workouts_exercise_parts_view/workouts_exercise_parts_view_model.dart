import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'workouts_exercise_parts_view_widget.dart'
    show WorkoutsExercisePartsViewWidget;
import 'package:flutter/material.dart';

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
