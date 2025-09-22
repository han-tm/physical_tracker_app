import 'package:boom_client/backend/supabase/database/database.dart';
import 'package:flutter/scheduler.dart';

import '../../auth/firebase_auth/auth_util.dart';
import '../../profile/subscription/subscription_page/subscription_page_widget.dart';
import '../food_ai_nutritionist_view/food_ai_nutritionist_view_widget.dart';
import '../food_kbzu_data_view/food_kbzu_data_view_widget.dart';
import '../food_plan_page/food_plan_page_widget.dart';
import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'food_page_model.dart';
export 'food_page_model.dart';

class FoodPageWidget extends StatefulWidget {
  const FoodPageWidget({super.key});

  static String routeName = 'FoodPage';
  static String routePath = '/foodPage';

  @override
  State<FoodPageWidget> createState() => _FoodPageWidgetState();
}

class _FoodPageWidgetState extends State<FoodPageWidget> {
  late FoodPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool dataLoaded = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodPageModel());

    // _model.hasPlan = true;
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _loadFoodData();
    });
  }

  Future<void> _loadFoodData() async {
    setState(() {
      dataLoaded = false;
    });

    await _model.loadNutritionPlan();

    final response = await Supabase.instance.client
        .from('nutrition_program')
        .select()
        .eq('user_id', currentUserUid)
        .maybeSingle();

    setState(() {
      _model.hasPlan = response != null;
      print("hasPlan_____________${_model.hasPlan}");
      dataLoaded = true;
    });


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
          child: FutureBuilder<List<SubscriptionRow>>(
            future: SubscriptionTable().queryRows(
              queryFn: (q) => q.eqOrNull(
                'user_id',
                currentUserUid,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<SubscriptionRow> containerSubscriptionRowList = snapshot.data!;

              // _model.showIndividualPlanPromo = containerSubscriptionRowList.last.planId != 2;
              _model.showIndividualPlanPromo = containerSubscriptionRowList.isEmpty || containerSubscriptionRowList.last.planId != 2;

              return !dataLoaded
                  ? Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                                  child: Text(
                                    'Питание',
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          font: GoogleFonts.unbounded(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              if (!_model.showIndividualPlanPromo)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0x22E27B00),
                                      borderRadius: BorderRadius.circular(100.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(0.0),
                                            child: SvgPicture.asset(
                                              'assets/images/Star_Shine.svg',
                                              width: 10.0,
                                              height: 10.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Про',
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.unbounded(
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(context).primary,
                                                    fontSize: 11.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        // MARK: План не составлен
                                        if (!_model.showIndividualPlanPromo && !_model.hasPlan)
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).secondary,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  opacity: 0.2,
                                                  image: Image.asset(
                                                    'assets/images/fde4c19748bb82a8a3859f582d4a59f7ebb626cd.jpg',
                                                  ).image,
                                                ),
                                                borderRadius: BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 32.0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(0.0),
                                                          child: SvgPicture.asset(
                                                            'assets/images/Chef_Hat.svg',
                                                            width: 32.0,
                                                            height: 32.0,
                                                            fit: BoxFit.cover,
                                                            alignment: const Alignment(0.0, 0.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                      child: Text(
                                                        'План питания не составлен',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              font: GoogleFonts.unbounded(
                                                                fontWeight: FontWeight.w600,
                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                              ),
                                                              letterSpacing: 0.0,
                                                              fontWeight: FontWeight.w600,
                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                      child: Text(
                                                        'Составьте персональный план питания с помощью ИИ-нутрициолога',
                                                        textAlign: TextAlign.center,
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              font: GoogleFonts.inter(
                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                              letterSpacing: 0.0,
                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                      child: wrapWithModel(
                                                        model: _model.generalButtonModel1,
                                                        updateCallback: () => safeSetState(() {}),
                                                        child: GeneralButtonWidget(
                                                          title: 'Составить',
                                                          isActive: true,
                                                          onTap: () async {
                                                            await showModalBottomSheet(
                                                              isScrollControlled: true,
                                                              backgroundColor: Colors.transparent,
                                                              barrierColor: const Color(0x24000000),
                                                              enableDrag: false,
                                                              context: context,
                                                              builder: (context) {
                                                                return GestureDetector(
                                                                  onTap: () {
                                                                    FocusScope.of(context).unfocus();
                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                  },
                                                                  child: Padding(
                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                    child: const FoodAiNutritionistViewWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) => safeSetState(() {}));
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        // MARK: Промо плашка для покупки Про
                                        if (_model.showIndividualPlanPromo && !_model.forceHideIndividualPlanPromo)
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).secondary,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  opacity: 0.2,
                                                  image: Image.asset(
                                                    'assets/images/fde4c19748bb82a8a3859f582d4a59f7ebb626cd.jpg',
                                                  ).image,
                                                ),
                                                borderRadius: BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 32.0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                              color: const Color(0x1EF2F2F3),
                                                              borderRadius: BorderRadius.circular(100.0),
                                                            ),
                                                            child: Padding(
                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                              child: Row(
                                                                mainAxisSize: MainAxisSize.max,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                    child: SvgPicture.asset(
                                                                      'assets/images/Star_Shine.svg',
                                                                      width: 10.0,
                                                                      height: 10.0,
                                                                      fit: BoxFit.cover,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                    child: Text(
                                                                      'Про',
                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                            font: GoogleFonts.unbounded(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize: 11.0,
                                                                            letterSpacing: 0.0,
                                                                            fontWeight: FontWeight.w600,
                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 30.0,
                                                          height: 30.0,
                                                          decoration: BoxDecoration(
                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                          ),
                                                          child: InkWell(
                                                            splashColor: Colors.transparent,
                                                            focusColor: Colors.transparent,
                                                            hoverColor: Colors.transparent,
                                                            highlightColor: Colors.transparent,
                                                            onTap: () async {
                                                              _model.forceHideIndividualPlanPromo = true;

                                                              setState(() {});
                                                            },
                                                            child: Icon(
                                                              Icons.close,
                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                      child: Text(
                                                        'ИИ-нутрициолог',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              font: GoogleFonts.unbounded(
                                                                fontWeight: FontWeight.bold,
                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                              ),
                                                              fontSize: 17.0,
                                                              letterSpacing: 0.0,
                                                              fontWeight: FontWeight.bold,
                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                      child: Text(
                                                        'Получите персональные рекомендации по питанию и планы на каждый день',
                                                        textAlign: TextAlign.start,
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              font: GoogleFonts.inter(
                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                              letterSpacing: 0.0,
                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                      child: Container(
                                                        width: 180.0,
                                                        height: 30.0,
                                                        decoration: const BoxDecoration(),
                                                        child: wrapWithModel(
                                                          model: _model.generalButtonModel2,
                                                          updateCallback: () => safeSetState(() {}),
                                                          child: GeneralButtonWidget(
                                                            title: 'Получить про',
                                                            isActive: true,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                SubscriptionPageWidget.routeName,
                                                                queryParameters: {
                                                                  'fromReg': serializeParam(
                                                                    false,
                                                                    ParamType.bool,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        // MARK: План питания
                                        // if (!_model.showIndividualPlanPromo)
                                        if (!_model.showIndividualPlanPromo && _model.hasPlan)
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(FoodPlanPageWidget.routeName);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(context).secondary,
                                                  borderRadius: BorderRadius.circular(12.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(8.0),
                                                          child: SvgPicture.asset(
                                                            'assets/images/food0123134.svg',
                                                            width: 30.0,
                                                            height: 30.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize: MainAxisSize.max,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              'План питания',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    font: GoogleFonts.unbounded(
                                                                      fontWeight: FontWeight.w600,
                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                    ),
                                                                    fontSize: 15.0,
                                                                    letterSpacing: 0.0,
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                              child: Text(
                                                                'Ваш персональный план питания',
                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                      font: GoogleFonts.inter(
                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                      letterSpacing: 0.0,
                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.arrow_forward_ios_sharp,
                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                        size: 14.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        // MARK: Рекомендации по КБЖУ
                                        if (_model.todayKbzu == null)
                                          Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).secondary,
                                                borderRadius: BorderRadius.circular(12.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      child: SvgPicture.asset(
                                                        'assets/images/Weigher.svg',
                                                        width: 32.0,
                                                        height: 32.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 10.0, 0.0),
                                                    child: Text(
                                                      'Рекомендации по КБЖУ',
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            font: GoogleFonts.unbounded(
                                                              fontWeight: FontWeight.w600,
                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight: FontWeight.w600,
                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                    child: Text(
                                                      'Удобный и быстрый способ следить за своим  питанием',
                                                      textAlign: TextAlign.center,
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            font: GoogleFonts.inter(
                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 48.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme.of(context).primary,
                                                        borderRadius: const BorderRadius.only(
                                                          bottomLeft: Radius.circular(12.0),
                                                          bottomRight: Radius.circular(12.0),
                                                          topLeft: Radius.circular(0.0),
                                                          topRight: Radius.circular(0.0),
                                                        ),
                                                      ),
                                                      child: InkWell(
                                                        splashColor: Colors.transparent,
                                                        focusColor: Colors.transparent,
                                                        hoverColor: Colors.transparent,
                                                        highlightColor: Colors.transparent,
                                                        onTap: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled: true,
                                                            backgroundColor: Colors.transparent,
                                                            barrierColor: const Color(0x35000000),
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(context).unfocus();
                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                },
                                                                child: Padding(
                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                  child: const FoodKbzuDataViewWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) => safeSetState(() {}));

                                                          await _loadFoodData();
                                                        },
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius: BorderRadius.circular(8.0),
                                                              child: SvgPicture.asset(
                                                                'assets/images/Chef_Hat.svg',
                                                                width: 16.0,
                                                                height: 16.0,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                              child: Text(
                                                                'Рассчитать КБЖУ',
                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                      font: GoogleFonts.unbounded(
                                                                        fontWeight: FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                      ),
                                                                      fontSize: 13.0,
                                                                      letterSpacing: 0.0,
                                                                      fontWeight: FontWeight.w600,
                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context).secondary,
                                              borderRadius: BorderRadius.circular(12.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                // MARK: Данные по текущему дню
                                                if (!_model.showIndividualPlanPromo && _model.todayKbzu != null)
                                                  Builder(
                                                    builder: (context) {
                                                      print("todayKbzu_____${_model.todayKbzu}");

                                                      final kbzu = _model.todayKbzu ?? {};
                                                      final kcal = '${kbzu['kcal_consumed'] ?? 0} / ${kbzu['kcal_target'] ?? 0}';
                                                      final carbs = '${kbzu['carbs_consumed'] ?? 0} / ${kbzu['carbs_target'] ?? 0}';
                                                      final fats = '${kbzu['fats_consumed'] ?? 0} / ${kbzu['fats_target'] ?? 0}';
                                                      final proteins = '${kbzu['proteins_consumed'] ?? 0} / ${kbzu['proteins_target'] ?? 0}';
                                                      return Column(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    'Сегодня',
                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                          font: GoogleFonts.unbounded(
                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  splashColor: Colors.transparent,
                                                                  focusColor: Colors.transparent,
                                                                  hoverColor: Colors.transparent,
                                                                  highlightColor: Colors.transparent,
                                                                  onTap: () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled: true,
                                                                      backgroundColor: Colors.transparent,
                                                                      barrierColor: const Color(0x35000000),
                                                                      enableDrag: false,
                                                                      context: context,
                                                                      builder: (context) {
                                                                        return GestureDetector(
                                                                          onTap: () {
                                                                            FocusScope.of(context).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child: Padding(
                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                            child: const FoodKbzuDataViewWidget(),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) => safeSetState(() {}));

                                                                    await _loadFoodData();
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize: MainAxisSize.max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                        child: Icon(
                                                                          Icons.mode_edit_outline_outlined,
                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                          size: 14.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Пересчитать КБЖУ',
                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              font: GoogleFonts.unbounded(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 11.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
                                                            child: Container(
                                                              width: double.infinity,
                                                              height: 1.0,
                                                              decoration: const BoxDecoration(
                                                                color: Color(0xFF302E36),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    'Потреблено / Норма',
                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                          font: GoogleFonts.inter(
                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  dateTimeFormat(
                                                                    "d MMMM",
                                                                    DateTime.now(),
                                                                    locale: "ru",
                                                                  ),
                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                        font: GoogleFonts.inter(
                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                        letterSpacing: 0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                            child: Container(
                                                              width: double.infinity,
                                                              decoration: BoxDecoration(
                                                                color: const Color(0x1EE27B00),
                                                                borderRadius: BorderRadius.circular(12.0),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize: MainAxisSize.max,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Align(
                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                    child: Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 4.0, 12.0),
                                                                      child: Text(
                                                                        kcal,
                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                              font: GoogleFonts.unbounded(
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 20.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'ккал',
                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                          font: GoogleFonts.inter(
                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                          fontSize: 13.0,
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: [
                                                                Expanded(
                                                                  child: Container(
                                                                    width: double.infinity,
                                                                    decoration: BoxDecoration(
                                                                      color: const Color(0x1EE27B00),
                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                    ),
                                                                    child: Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 12.0),
                                                                      child: Column(
                                                                        mainAxisSize: MainAxisSize.max,
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          AutoSizeText(
                                                                            carbs,
                                                                            maxLines: 1,
                                                                            minFontSize: 1.0,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.unbounded(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: const Color(0xFFFFD166),
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          AutoSizeText(
                                                                            'углеводов (г)',
                                                                            maxLines: 1,
                                                                            minFontSize: 5.0,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: const Color(0xFFFFD166),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Container(
                                                                    width: double.infinity,
                                                                    decoration: BoxDecoration(
                                                                      color: const Color(0x24FF6B78),
                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                    ),
                                                                    child: Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 12.0),
                                                                      child: Column(
                                                                        mainAxisSize: MainAxisSize.max,
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          AutoSizeText(
                                                                            fats,
                                                                            maxLines: 1,
                                                                            minFontSize: 1.0,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.unbounded(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: const Color(0xFFFF6B78),
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          AutoSizeText(
                                                                            'жиров (г)',
                                                                            maxLines: 1,
                                                                            minFontSize: 5.0,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: const Color(0xFFFF6B78),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Container(
                                                                    width: double.infinity,
                                                                    decoration: BoxDecoration(
                                                                      color: const Color(0x1F4DEEBD),
                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                    ),
                                                                    child: Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 12.0),
                                                                      child: Column(
                                                                        mainAxisSize: MainAxisSize.max,
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          AutoSizeText(
                                                                            proteins,
                                                                            maxLines: 1,
                                                                            minFontSize: 1.0,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.unbounded(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: const Color(0xFF4DEEBD),
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          AutoSizeText(
                                                                            'белков (г)',
                                                                            maxLines: 1,
                                                                            minFontSize: 5.0,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: const Color(0xFF4DEEBD),
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(width: 5.0)),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ].addToStart(const SizedBox(height: 8.0)).addToEnd(const SizedBox(height: 16.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
