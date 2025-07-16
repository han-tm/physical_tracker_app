import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workout_payment_success_page_model.dart';
export 'workout_payment_success_page_model.dart';

class WorkoutPaymentSuccessPageWidget extends StatefulWidget {
  const WorkoutPaymentSuccessPageWidget({super.key});

  @override
  State<WorkoutPaymentSuccessPageWidget> createState() =>
      _WorkoutPaymentSuccessPageWidgetState();
}

class _WorkoutPaymentSuccessPageWidgetState
    extends State<WorkoutPaymentSuccessPageWidget> {
  late WorkoutPaymentSuccessPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutPaymentSuccessPageModel());
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
