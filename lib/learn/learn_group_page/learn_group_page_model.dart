import '/backend/supabase/supabase.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/learn/lesson_cell/lesson_cell_widget.dart';
import 'dart:ui';
import 'learn_group_page_widget.dart' show LearnGroupPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
