import '/flutter_flow/flutter_flow_util.dart';
import '/learn/lesson_cell/lesson_cell_widget.dart';
import '/index.dart';
import 'learn_page_widget.dart' show LearnPageWidget;
import 'package:flutter/material.dart';

class LearnPageModel extends FlutterFlowModel<LearnPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for lessonCell dynamic component.
  late FlutterFlowDynamicModels<LessonCellModel> lessonCellModels;

  @override
  void initState(BuildContext context) {
    lessonCellModels = FlutterFlowDynamicModels(() => LessonCellModel());
  }

  @override
  void dispose() {
    lessonCellModels.dispose();
  }
}
