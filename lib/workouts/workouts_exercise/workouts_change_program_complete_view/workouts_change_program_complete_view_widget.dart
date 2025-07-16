import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workouts_change_program_complete_view_model.dart';
export 'workouts_change_program_complete_view_model.dart';

class WorkoutsChangeProgramCompleteViewWidget extends StatefulWidget {
  const WorkoutsChangeProgramCompleteViewWidget({super.key});

  @override
  State<WorkoutsChangeProgramCompleteViewWidget> createState() =>
      _WorkoutsChangeProgramCompleteViewWidgetState();
}

class _WorkoutsChangeProgramCompleteViewWidgetState
    extends State<WorkoutsChangeProgramCompleteViewWidget> {
  late WorkoutsChangeProgramCompleteViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => WorkoutsChangeProgramCompleteViewModel());
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
