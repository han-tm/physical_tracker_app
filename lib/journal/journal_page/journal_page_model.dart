import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'journal_page_widget.dart' show JournalPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class JournalPageModel extends FlutterFlowModel<JournalPageWidget> {
  ///  Local state fields for this page.

  int part = 0;


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
