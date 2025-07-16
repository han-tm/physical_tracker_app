import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_kbzu_summary_view_model.dart';
export 'food_kbzu_summary_view_model.dart';

class FoodKbzuSummaryViewWidget extends StatefulWidget {
  const FoodKbzuSummaryViewWidget({super.key});

  @override
  State<FoodKbzuSummaryViewWidget> createState() =>
      _FoodKbzuSummaryViewWidgetState();
}

class _FoodKbzuSummaryViewWidgetState extends State<FoodKbzuSummaryViewWidget> {
  late FoodKbzuSummaryViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodKbzuSummaryViewModel());
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
