import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'workouts_exercise_complete_view_widget.dart'
    show WorkoutsExerciseCompleteViewWidget;
import 'package:flutter/material.dart';

class WorkoutsExerciseCompleteViewModel
    extends FlutterFlowModel<WorkoutsExerciseCompleteViewWidget> {
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
