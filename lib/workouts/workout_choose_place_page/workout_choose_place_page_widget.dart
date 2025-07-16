import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workout_choose_place_page_model.dart';
export 'workout_choose_place_page_model.dart';

class WorkoutChoosePlacePageWidget extends StatefulWidget {
  const WorkoutChoosePlacePageWidget({super.key});

  static String routeName = 'WorkoutChoosePlacePage';
  static String routePath = '/workoutChoosePlacePage';

  @override
  State<WorkoutChoosePlacePageWidget> createState() =>
      _WorkoutChoosePlacePageWidgetState();
}

class _WorkoutChoosePlacePageWidgetState
    extends State<WorkoutChoosePlacePageWidget> {
  late WorkoutChoosePlacePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutChoosePlacePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.generalNavBar01Model,
                updateCallback: () => safeSetState(() {}),
                child: GeneralNavBar01Widget(
                  title: 'Где будут тренировки?',
                  hideBack: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
