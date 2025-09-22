import '/components/general_button_widget.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'workouts_exercise_difficulty_page_widget.dart'
    show WorkoutsExerciseDifficultyPageWidget;
import 'package:flutter/material.dart';

class WorkoutsExerciseDifficultyPageModel
    extends FlutterFlowModel<WorkoutsExerciseDifficultyPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for generalNavBar01 component.
  late GeneralNavBar01Model generalNavBar01Model;
  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel;

  @override
  void initState(BuildContext context) {
    generalNavBar01Model = createModel(context, () => GeneralNavBar01Model());
    generalButtonModel = createModel(context, () => GeneralButtonModel());
  }

  @override
  void dispose() {
    generalNavBar01Model.dispose();
    generalButtonModel.dispose();
  }
}
