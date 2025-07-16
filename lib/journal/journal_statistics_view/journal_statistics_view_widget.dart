import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'journal_statistics_view_model.dart';
export 'journal_statistics_view_model.dart';

class JournalStatisticsViewWidget extends StatefulWidget {
  const JournalStatisticsViewWidget({super.key});

  @override
  State<JournalStatisticsViewWidget> createState() =>
      _JournalStatisticsViewWidgetState();
}

class _JournalStatisticsViewWidgetState
    extends State<JournalStatisticsViewWidget> {
  late JournalStatisticsViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JournalStatisticsViewModel());
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
