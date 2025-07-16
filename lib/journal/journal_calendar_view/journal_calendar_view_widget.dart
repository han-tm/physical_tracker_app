import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'journal_calendar_view_model.dart';
export 'journal_calendar_view_model.dart';

class JournalCalendarViewWidget extends StatefulWidget {
  const JournalCalendarViewWidget({super.key});

  @override
  State<JournalCalendarViewWidget> createState() =>
      _JournalCalendarViewWidgetState();
}

class _JournalCalendarViewWidgetState extends State<JournalCalendarViewWidget> {
  late JournalCalendarViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalCalendarViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
