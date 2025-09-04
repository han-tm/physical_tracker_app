import '/backend/supabase/supabase.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/journal/journal_exercise_history_view/journal_exercise_history_view_widget.dart';
import 'dart:ui';
import 'journal_exercise_page_widget.dart' show JournalExercisePageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JournalExercisePageModel
    extends FlutterFlowModel<JournalExercisePageWidget> {
  ///  Local state fields for this page.

  int part = 0;

  ///  State fields for stateful widgets in this page.

  // Model for generalNavBar01 component.
  late GeneralNavBar01Model generalNavBar01Model;

  @override
  void initState(BuildContext context) {
    generalNavBar01Model = createModel(context, () => GeneralNavBar01Model());
  }

  @override
  void dispose() {
    generalNavBar01Model.dispose();
  }
}
