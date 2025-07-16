import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workouts_individual_program_promo_page_model.dart';
export 'workouts_individual_program_promo_page_model.dart';

class WorkoutsIndividualProgramPromoPageWidget extends StatefulWidget {
  const WorkoutsIndividualProgramPromoPageWidget({super.key});

  static String routeName = 'WorkoutsIndividualProgramPromoPage';
  static String routePath = '/workoutsIndividualProgramPromoPage';

  @override
  State<WorkoutsIndividualProgramPromoPageWidget> createState() =>
      _WorkoutsIndividualProgramPromoPageWidgetState();
}

class _WorkoutsIndividualProgramPromoPageWidgetState
    extends State<WorkoutsIndividualProgramPromoPageWidget> {
  late WorkoutsIndividualProgramPromoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => WorkoutsIndividualProgramPromoPageModel());
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
                  title: 'Индивидуальная програамма',
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
