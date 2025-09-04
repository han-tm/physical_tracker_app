import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workouts_change_program_view_model.dart';
export 'workouts_change_program_view_model.dart';

class WorkoutsChangeProgramViewWidget extends StatefulWidget {
  const WorkoutsChangeProgramViewWidget({super.key});

  @override
  State<WorkoutsChangeProgramViewWidget> createState() =>
      _WorkoutsChangeProgramViewWidgetState();
}

class _WorkoutsChangeProgramViewWidgetState
    extends State<WorkoutsChangeProgramViewWidget> {
  late WorkoutsChangeProgramViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsChangeProgramViewModel());
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
