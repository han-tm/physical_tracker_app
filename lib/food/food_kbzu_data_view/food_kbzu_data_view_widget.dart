import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_kbzu_data_view_model.dart';
export 'food_kbzu_data_view_model.dart';

class FoodKbzuDataViewWidget extends StatefulWidget {
  const FoodKbzuDataViewWidget({super.key});

  @override
  State<FoodKbzuDataViewWidget> createState() => _FoodKbzuDataViewWidgetState();
}

class _FoodKbzuDataViewWidgetState extends State<FoodKbzuDataViewWidget> {
  late FoodKbzuDataViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodKbzuDataViewModel());
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
