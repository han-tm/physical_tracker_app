import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/learn/lesson_cell/lesson_cell_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'learn_page_widget.dart' show LearnPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
