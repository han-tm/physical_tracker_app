import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_plan_page_model.dart';
export 'food_plan_page_model.dart';

class FoodPlanPageWidget extends StatefulWidget {
  const FoodPlanPageWidget({super.key});

  static String routeName = 'FoodPlanPage';
  static String routePath = '/foodPlanPage';

  @override
  State<FoodPlanPageWidget> createState() => _FoodPlanPageWidgetState();
}

class _FoodPlanPageWidgetState extends State<FoodPlanPageWidget> {
  late FoodPlanPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodPlanPageModel());
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
                  title: 'План питания',
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
