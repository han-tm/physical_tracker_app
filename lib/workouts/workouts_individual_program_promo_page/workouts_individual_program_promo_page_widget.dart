import 'package:url_launcher/url_launcher.dart';

import '../../auth/firebase_auth/auth_util.dart';
import '../../backend/supabase/supabase.dart';
import '../workout_choose_place_page/workout_choose_place_page_widget.dart';
import '../workout_payment_success_view/workout_payment_success_view_widget.dart';
import '/components/general_button_widget.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'workouts_individual_program_promo_page_model.dart';
export 'workouts_individual_program_promo_page_model.dart';

class WorkoutsIndividualProgramPromoPageWidget extends StatefulWidget {
  const WorkoutsIndividualProgramPromoPageWidget({super.key});

  static String routeName = 'WorkoutsIndividualProgramPromoPage';
  static String routePath = '/workoutsIndividualProgramPromoPage';

  @override
  State<WorkoutsIndividualProgramPromoPageWidget> createState() => _WorkoutsIndividualProgramPromoPageWidgetState();
}

class _WorkoutsIndividualProgramPromoPageWidgetState extends State<WorkoutsIndividualProgramPromoPageWidget> {
  late WorkoutsIndividualProgramPromoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutsIndividualProgramPromoPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _model.loadUserData().then((_) => setState(() {
            loaded = true;
          }));
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.generalNavBar01Model,
                updateCallback: () => safeSetState(() {}),
                child: const GeneralNavBar01Widget(
                  title: 'Индивидуальная програамма',
                  hideBack: false,
                ),
              ),
              Expanded(
                child: !loaded
                    ? Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (_model.user != null && _model.user!["individualProgramUnderPrepare"] == true)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                          borderRadius: BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context).secondary,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              CircularPercentIndicator(
                                                percent: 0.6,
                                                radius: 20.5,
                                                lineWidth: 4.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor: FlutterFlowTheme.of(context).primary,
                                                backgroundColor: const Color(0x23FFFFFF),
                                                center: Text(
                                                  '60%',
                                                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                        font: GoogleFonts.unbounded(
                                                          fontWeight: FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                        ),
                                                        fontSize: 7.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.bold,
                                                        fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  'Программа еще не готова, вам придет уведомление о готовнисти и ссылка на чат в Telegram',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(context).bodyMedium.fontWeight,
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
                                      ),
                                    ),
                                  if (_model.user != null &&
                                      _model.user!["individualProgramUnderPrepare"] != true &&
                                      _model.user!["individualProgramId"] != null)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                          borderRadius: BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context).secondary,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/telegram_icon.svg',
                                                  width: 34.0,
                                                  height: 34.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  't.me/Programm_d/hrrrfgv',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(context).bodyMedium.fontWeight,
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
                                                  height: 40.0,
                                                  decoration: const BoxDecoration(),
                                                  child: wrapWithModel(
                                                    model: _model.generalButtonModel1,
                                                    updateCallback: () => safeSetState(() {}),
                                                    child: GeneralButtonWidget(
                                                      title: 'Перейти',
                                                      isActive: true,
                                                      onTap: () async {
                                                        final Uri url = Uri.parse('t.me/Programm_d/hrrrfgv');

                                                        if (await canLaunchUrl(url)) {
                                                          await launchUrl(url);
                                                        } else {
                                                          throw 'Не удалось открыть ссылку: $url';
                                                        }
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
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondary,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          opacity: 0.2,
                                          image: Image.asset(
                                            'assets/images/1a2c950ebdd006be009161fbb6c5138b58253580.jpg',
                                          ).image,
                                        ),
                                        borderRadius: BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(0.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/Star_Shine.svg',
                                                      width: 16.0,
                                                      height: 16.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Индивидуальная',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          font: GoogleFonts.unbounded(
                                                            fontWeight: FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  '4 990 ₽',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        font: GoogleFonts.unbounded(
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                        color: FlutterFlowTheme.of(context).primary,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.w600,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: Text(
                                                'Программа, составленная специально под ваши цели и возможности',
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
                                                decoration: BoxDecoration(
                                                  color: const Color(0x1EE27B00),
                                                  borderRadius: BorderRadius.circular(12.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(context).primary,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                0.0, 0.0, 8.0, 0.0),
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(0.0),
                                                              child: SvgPicture.asset(
                                                                'assets/images/Check_Circle.svg',
                                                                width: 14.0,
                                                                height: 14.0,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              'Индивидуальный план тренировок \nна 12 недель',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    font: GoogleFonts.inter(
                                                                      fontWeight: FlutterFlowTheme.of(context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize: 13.0,
                                                                    letterSpacing: 0.0,
                                                                    fontWeight: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                0.0, 0.0, 8.0, 0.0),
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(0.0),
                                                              child: SvgPicture.asset(
                                                                'assets/images/Check_Circle.svg',
                                                                width: 14.0,
                                                                height: 14.0,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              'Учёт ваших целей, возможностей и ограничений',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    font: GoogleFonts.inter(
                                                                      fontWeight: FlutterFlowTheme.of(context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize: 13.0,
                                                                    letterSpacing: 0.0,
                                                                    fontWeight: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                0.0, 0.0, 8.0, 0.0),
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(0.0),
                                                              child: SvgPicture.asset(
                                                                'assets/images/Check_Circle.svg',
                                                                width: 14.0,
                                                                height: 14.0,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              'Поддержка и консультации от куратора',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    font: GoogleFonts.inter(
                                                                      fontWeight: FlutterFlowTheme.of(context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize: 13.0,
                                                                    letterSpacing: 0.0,
                                                                    fontWeight: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                0.0, 0.0, 8.0, 0.0),
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(0.0),
                                                              child: SvgPicture.asset(
                                                                'assets/images/Check_Circle.svg',
                                                                width: 14.0,
                                                                height: 14.0,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              'Возможность корректировки программы',
                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                    font: GoogleFonts.inter(
                                                                      fontWeight: FlutterFlowTheme.of(context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize: 13.0,
                                                                    letterSpacing: 0.0,
                                                                    fontWeight: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                    child: Text(
                                      'Как это работает',
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
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                        borderRadius: BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context).secondary,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 32.0,
                                                    height: 32.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFF1A191D),
                                                      borderRadius: BorderRadius.circular(12.0),
                                                    ),
                                                    child: Align(
                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                      child: Text(
                                                        '1',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              font: GoogleFonts.unbounded(
                                                                fontWeight: FontWeight.w600,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                              fontSize: 11.0,
                                                              letterSpacing: 0.0,
                                                              fontWeight: FontWeight.w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'Покупка программы',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.unbounded(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 12.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Оплатите составление индивидуальной программы тренировок',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.inter(
                                                                    fontWeight: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                  fontSize: 13.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FlutterFlowTheme.of(context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 32.0,
                                                    height: 32.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFF1A191D),
                                                      borderRadius: BorderRadius.circular(12.0),
                                                    ),
                                                    child: Align(
                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                      child: Text(
                                                        '2',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              font: GoogleFonts.unbounded(
                                                                fontWeight: FontWeight.w600,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                              fontSize: 11.0,
                                                              letterSpacing: 0.0,
                                                              fontWeight: FontWeight.w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'Связь с куратором',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.unbounded(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 12.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                          Text(
                                                            'После оплаты вы будете перенаправлены в Telegram-чат с куратором',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.inter(
                                                                    fontWeight: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                  fontSize: 13.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FlutterFlowTheme.of(context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 32.0,
                                                    height: 32.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFF1A191D),
                                                      borderRadius: BorderRadius.circular(12.0),
                                                    ),
                                                    child: Align(
                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                      child: Text(
                                                        '3',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              font: GoogleFonts.unbounded(
                                                                fontWeight: FontWeight.w600,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                              fontSize: 11.0,
                                                              letterSpacing: 0.0,
                                                              fontWeight: FontWeight.w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'Разработка программы',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.unbounded(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 12.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Куратор проанализирует ваши данные и составит индивидуальную программу',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.inter(
                                                                    fontWeight: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                  fontSize: 13.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FlutterFlowTheme.of(context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 32.0,
                                                    height: 32.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFF1A191D),
                                                      borderRadius: BorderRadius.circular(12.0),
                                                    ),
                                                    child: Align(
                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                      child: Text(
                                                        '4',
                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              font: GoogleFonts.unbounded(
                                                                fontWeight: FontWeight.w600,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                              fontSize: 11.0,
                                                              letterSpacing: 0.0,
                                                              fontWeight: FontWeight.w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'Получение программы',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.unbounded(
                                                                    fontWeight: FontWeight.w600,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize: 12.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Вы получите уведомление, когда индивидуальная программа будет готова',
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                  font: GoogleFonts.inter(
                                                                    fontWeight: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                  fontSize: 13.0,
                                                                  letterSpacing: 0.0,
                                                                  fontWeight: FlutterFlowTheme.of(context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 4.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                    child: Text(
                                      'Отзывы',
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
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context).secondary,
                                            borderRadius: BorderRadius.circular(12.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 32.0,
                                                      height: 32.0,
                                                      clipBehavior: Clip.antiAlias,
                                                      decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/photo_324523.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                        child: Text(
                                                          'Елена',
                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                font: GoogleFonts.unbounded(
                                                                  fontWeight: FontWeight.w600,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                ),
                                                                letterSpacing: 0.0,
                                                                fontWeight: FontWeight.w600,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      '-8 кг за 3 мес.',
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            font: GoogleFonts.inter(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                            color: const Color(0xFF36CF77),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/Star.svg',
                                                          width: 14.0,
                                                          height: 14.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/Star.svg',
                                                          width: 14.0,
                                                          height: 14.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/Star.svg',
                                                          width: 14.0,
                                                          height: 14.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/Star.svg',
                                                          width: 14.0,
                                                          height: 14.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(0.0),
                                                        child: SvgPicture.asset(
                                                          'assets/images/Star.svg',
                                                          width: 14.0,
                                                          height: 14.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Отличное качество товара, быстрая доставка, все в срок. Очень довольна сотрудничеством!',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          font: GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              if (_model.user != null && _model.user!["individualProgramUnderPrepare"] != true)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                  child: wrapWithModel(
                    model: _model.generalButtonModel2,
                    updateCallback: () => safeSetState(() {}),
                    child: GeneralButtonWidget(
                      title: 'Приобрести',
                      isActive: true,
                      onTap: () async {
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('Нет платежного шлюза'),
                                  content: const Text('Оплата произойдет мнгновенно'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                      child: const Text('Отмена'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                      child: const Text('Продолжить'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          // await UserTable().update(
                          //   data: {
                          //     'individualProgramUnderPrepare': true,
                          //   },
                          //   matchingRows: (rows) => rows.eqOrNull(
                          //     'fb_id',
                          //     currentUserUid,
                          //   ),
                          // );

                          // await _model.loadUserData();

                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: const Color(0x2B000000),
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
                                  child: WorkoutPaymentSuccessViewWidget(
                                    onTap: () {
                                      // context.goNamed(RouterPageWidget.routeName);
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                          if (context.mounted) {
                            context.pushNamed(WorkoutChoosePlacePageWidget.routeName);
                          }
                        }
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
