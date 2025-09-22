import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/learn/lesson_cell/lesson_cell_widget.dart';
import 'learn_group_page_widget.dart' show LearnGroupPageWidget;
import 'package:flutter/material.dart';

class LearnGroupPageModel extends FlutterFlowModel<LearnGroupPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for generalNavBar01 component.
  late GeneralNavBar01Model generalNavBar01Model;
  // Models for lessonCell dynamic component.
  late FlutterFlowDynamicModels<LessonCellModel> lessonCellModels;

  @override
  void initState(BuildContext context) {
    generalNavBar01Model = createModel(context, () => GeneralNavBar01Model());
    lessonCellModels = FlutterFlowDynamicModels(() => LessonCellModel());
  }

  @override
  void dispose() {
    generalNavBar01Model.dispose();
    lessonCellModels.dispose();
  }
}
