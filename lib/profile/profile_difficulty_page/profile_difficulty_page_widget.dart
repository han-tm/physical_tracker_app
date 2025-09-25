import 'package:url_launcher/url_launcher.dart';

import '../../workouts/workouts_exercise/workouts_exercise_difficulty_page/workouts_exercise_difficulty_page_widget.dart';
import '../../workouts/workouts_individual_program_promo_page/workouts_individual_program_promo_page_widget.dart';
import '/components/general_button_widget.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_difficulty_page_model.dart';
export 'profile_difficulty_page_model.dart';

class ProfileDifficultyPageWidget extends StatefulWidget {
  const ProfileDifficultyPageWidget({super.key});

  static String routeName = 'ProfileDifficultyPage';
  static String routePath = '/profileDifficultyPage';

  @override
  State<ProfileDifficultyPageWidget> createState() => _ProfileDifficultyPageWidgetState();
}

class _ProfileDifficultyPageWidgetState extends State<ProfileDifficultyPageWidget> {
  late ProfileDifficultyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileDifficultyPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _model.loadInitialData();
      setState(() {loaded = true;});
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
                  title: 'Уровень сложности',
                  hideBack: false,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: !loaded
                      ? Center(
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FutureBuilder(
                                      future: _model.currentDifficultyLabel,
                                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                                        return Text(
                                          'Ваш уровень сложности “${snapshot.data ?? '...'}”. Вы можете изменить его или выбрать индивидуальную программу:',
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
                                        );
                                      },
                                    ),
                                    if (_model.individualProgramIsActive)
                                      Text(
                                        'У вас приобретена индивидуальная программа',
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
                                    if (_model.individualProgramIsActive)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16.0),
                                            border: Border.all(
                                              color: const Color(0xFF302E36),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                                          borderRadius: BorderRadius.circular(16.0),
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
                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
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
                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                            ),
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight: FontWeight.w600,
                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                  Text(
                                                    _model.individualProgramIsActive ? 'Активна' : '4 990 ₽',
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
                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
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
                                                    color: const Color(0x40E27B00),
                                                    borderRadius: BorderRadius.circular(16.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme.of(context).primary,
                                                      width: 1.0,
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
                                                            ClipRRect(
                                                              borderRadius: BorderRadius.circular(8.0),
                                                              child: SvgPicture.asset(
                                                                'assets/images/Check_Circle.svg',
                                                                width: 14.0,
                                                                height: 14.0,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                child: Text(
                                                                  'Индивидуальный план тренировок \nна 12 недель',
                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                        font: GoogleFonts.inter(
                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                        ),
                                                                        letterSpacing: 0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius: BorderRadius.circular(8.0),
                                                              child: SvgPicture.asset(
                                                                'assets/images/Check_Circle.svg',
                                                                width: 14.0,
                                                                height: 14.0,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                child: Text(
                                                                  'Учёт ваших целей, возможностей и ограничений',
                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                        font: GoogleFonts.inter(
                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                        ),
                                                                        letterSpacing: 0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius: BorderRadius.circular(8.0),
                                                              child: SvgPicture.asset(
                                                                'assets/images/Check_Circle.svg',
                                                                width: 14.0,
                                                                height: 14.0,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                child: Text(
                                                                  'Поддержка и консультации от куратора',
                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                        font: GoogleFonts.inter(
                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                        ),
                                                                        letterSpacing: 0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize: MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius: BorderRadius.circular(8.0),
                                                              child: SvgPicture.asset(
                                                                'assets/images/Check_Circle.svg',
                                                                width: 14.0,
                                                                height: 14.0,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                child: Text(
                                                                  'Возможность корректировки программы',
                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                        font: GoogleFonts.inter(
                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                        ),
                                                                        letterSpacing: 0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ].divide(const SizedBox(height: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (!_model.individualProgramIsActive)
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 0.0),
                                                  child: wrapWithModel(
                                                    model: _model.generalButtonModel2,
                                                    updateCallback: () => safeSetState(() {}),
                                                    child: GeneralButtonWidget(
                                                      title: 'Подробнее',
                                                      isActive: true,
                                                      onTap: () async {
                                                        context.pushNamed(WorkoutsIndividualProgramPromoPageWidget.routeName);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                      child: Text(
                                        'Уровень сложности:',
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
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                      // child: Row(
                                      //   mainAxisSize: MainAxisSize.max,
                                      //   children: [
                                      //     Expanded(
                                      //       child: Container(
                                      //         decoration: BoxDecoration(
                                      //           color: Color(0xFF242328),
                                      //           borderRadius: BorderRadius.circular(16.0),
                                      //         ),
                                      //         child: Column(
                                      //           mainAxisSize: MainAxisSize.max,
                                      //           crossAxisAlignment: CrossAxisAlignment.start,
                                      //           children: [
                                      //             Padding(
                                      //               padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                                      //               child: Text(
                                      //                 'Новичок',
                                      //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      //                       font: GoogleFonts.unbounded(
                                      //                         fontWeight: FontWeight.w600,
                                      //                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      //                       ),
                                      //                       fontSize: 11.0,
                                      //                       letterSpacing: 0.0,
                                      //                       fontWeight: FontWeight.w600,
                                      //                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      //                     ),
                                      //               ),
                                      //             ),
                                      //             Container(
                                      //               width: double.infinity,
                                      //               height: 1.0,
                                      //               decoration: BoxDecoration(
                                      //                 color: Color(0xFF302E36),
                                      //               ),
                                      //             ),
                                      //             Container(
                                      //               width: double.infinity,
                                      //               decoration: BoxDecoration(),
                                      //               child: Padding(
                                      //                 padding: EdgeInsetsDirectional.fromSTEB(0.0, 17.0, 0.0, 17.0),
                                      //                 child: Row(
                                      //                   mainAxisSize: MainAxisSize.max,
                                      //                   mainAxisAlignment: MainAxisAlignment.center,
                                      //                   children: [
                                      //                     ClipRRect(
                                      //                       borderRadius: BorderRadius.circular(8.0),
                                      //                       child: SvgPicture.asset(
                                      //                         'assets/images/Eye.svg',
                                      //                         width: 16.0,
                                      //                         height: 16.0,
                                      //                         fit: BoxFit.cover,
                                      //                       ),
                                      //                     ),
                                      //                     Padding(
                                      //                       padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                      //                       child: Text(
                                      //                         'Подробнее',
                                      //                         style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      //                               font: GoogleFonts.unbounded(
                                      //                                 fontWeight: FontWeight.w500,
                                      //                                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      //                               ),
                                      //                               fontSize: 11.0,
                                      //                               letterSpacing: 0.0,
                                      //                               fontWeight: FontWeight.w500,
                                      //                               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      //                             ),
                                      //                       ),
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     Expanded(
                                      //       child: Container(
                                      //         decoration: BoxDecoration(
                                      //           color: Color(0xFF242328),
                                      //           borderRadius: BorderRadius.circular(16.0),
                                      //         ),
                                      //         child: Column(
                                      //           mainAxisSize: MainAxisSize.max,
                                      //           crossAxisAlignment: CrossAxisAlignment.start,
                                      //           children: [
                                      //             Padding(
                                      //               padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                                      //               child: Text(
                                      //                 'Средний',
                                      //                 style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      //                       font: GoogleFonts.unbounded(
                                      //                         fontWeight: FontWeight.w600,
                                      //                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      //                       ),
                                      //                       fontSize: 11.0,
                                      //                       letterSpacing: 0.0,
                                      //                       fontWeight: FontWeight.w600,
                                      //                       fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      //                     ),
                                      //               ),
                                      //             ),
                                      //             Container(
                                      //               width: double.infinity,
                                      //               height: 1.0,
                                      //               decoration: BoxDecoration(
                                      //                 color: Color(0xFF302E36),
                                      //               ),
                                      //             ),
                                      //             Container(
                                      //               width: double.infinity,
                                      //               decoration: BoxDecoration(),
                                      //               child: Padding(
                                      //                 padding: EdgeInsetsDirectional.fromSTEB(0.0, 17.0, 0.0, 17.0),
                                      //                 child: Row(
                                      //                   mainAxisSize: MainAxisSize.max,
                                      //                   mainAxisAlignment: MainAxisAlignment.center,
                                      //                   children: [
                                      //                     ClipRRect(
                                      //                       borderRadius: BorderRadius.circular(8.0),
                                      //                       child: SvgPicture.asset(
                                      //                         'assets/images/Eye.svg',
                                      //                         width: 16.0,
                                      //                         height: 16.0,
                                      //                         fit: BoxFit.cover,
                                      //                       ),
                                      //                     ),
                                      //                     Padding(
                                      //                       padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                      //                       child: Text(
                                      //                         'Подробнее',
                                      //                         style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      //                               font: GoogleFonts.unbounded(
                                      //                                 fontWeight: FontWeight.w500,
                                      //                                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      //                               ),
                                      //                               fontSize: 11.0,
                                      //                               letterSpacing: 0.0,
                                      //                               fontWeight: FontWeight.w500,
                                      //                               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      //                             ),
                                      //                       ),
                                      //                     ),
                                      //                   ],
                                      //                 ),
                                      //               ),
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ].divide(SizedBox(width: 8.0)),
                                      // ),
                                      child: GridView.builder(
                                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 1.76,
                                          mainAxisSpacing: 8,
                                          crossAxisSpacing: 8
                                        ),
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: _model.difficulties.length,
                                        shrinkWrap: true,

                                        itemBuilder: (BuildContext context, int index) {
                                            return renderDifCell(_model.difficulties[index]);
                                        },
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                    //   child: Row(
                                    //     mainAxisSize: MainAxisSize.max,
                                    //     children: [
                                    //       Expanded(
                                    //         child: Container(
                                    //           decoration: BoxDecoration(
                                    //             color: Color(0xFF242328),
                                    //             borderRadius: BorderRadius.circular(16.0),
                                    //           ),
                                    //           child: Column(
                                    //             mainAxisSize: MainAxisSize.max,
                                    //             crossAxisAlignment: CrossAxisAlignment.start,
                                    //             children: [
                                    //               Padding(
                                    //                 padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                                    //                 child: Text(
                                    //                   'Продвинутый',
                                    //                   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //                         font: GoogleFonts.unbounded(
                                    //                           fontWeight: FontWeight.w600,
                                    //                           fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    //                         ),
                                    //                         fontSize: 11.0,
                                    //                         letterSpacing: 0.0,
                                    //                         fontWeight: FontWeight.w600,
                                    //                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    //                       ),
                                    //                 ),
                                    //               ),
                                    //               Container(
                                    //                 width: double.infinity,
                                    //                 height: 1.0,
                                    //                 decoration: BoxDecoration(
                                    //                   color: Color(0xFF302E36),
                                    //                 ),
                                    //               ),
                                    //               Container(
                                    //                 width: double.infinity,
                                    //                 decoration: BoxDecoration(),
                                    //                 child: Padding(
                                    //                   padding: EdgeInsetsDirectional.fromSTEB(0.0, 17.0, 0.0, 17.0),
                                    //                   child: Row(
                                    //                     mainAxisSize: MainAxisSize.max,
                                    //                     mainAxisAlignment: MainAxisAlignment.center,
                                    //                     children: [
                                    //                       ClipRRect(
                                    //                         borderRadius: BorderRadius.circular(8.0),
                                    //                         child: SvgPicture.asset(
                                    //                           'assets/images/Eye.svg',
                                    //                           width: 16.0,
                                    //                           height: 16.0,
                                    //                           fit: BoxFit.cover,
                                    //                         ),
                                    //                       ),
                                    //                       Padding(
                                    //                         padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                    //                         child: Text(
                                    //                           'Подробнее',
                                    //                           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //                                 font: GoogleFonts.unbounded(
                                    //                                   fontWeight: FontWeight.w500,
                                    //                                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    //                                 ),
                                    //                                 fontSize: 11.0,
                                    //                                 letterSpacing: 0.0,
                                    //                                 fontWeight: FontWeight.w500,
                                    //                                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    //                               ),
                                    //                         ),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //               ),
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       ),
                                    //       Expanded(
                                    //         child: Container(
                                    //           decoration: BoxDecoration(
                                    //             color: Color(0xFF242328),
                                    //             borderRadius: BorderRadius.circular(16.0),
                                    //           ),
                                    //           child: Column(
                                    //             mainAxisSize: MainAxisSize.max,
                                    //             crossAxisAlignment: CrossAxisAlignment.start,
                                    //             children: [
                                    //               Padding(
                                    //                 padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
                                    //                 child: Text(
                                    //                   'Ягодицы(без ног)',
                                    //                   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //                         font: GoogleFonts.unbounded(
                                    //                           fontWeight: FontWeight.w600,
                                    //                           fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    //                         ),
                                    //                         fontSize: 11.0,
                                    //                         letterSpacing: 0.0,
                                    //                         fontWeight: FontWeight.w600,
                                    //                         fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    //                       ),
                                    //                 ),
                                    //               ),
                                    //               Container(
                                    //                 width: double.infinity,
                                    //                 height: 1.0,
                                    //                 decoration: BoxDecoration(
                                    //                   color: Color(0xFF302E36),
                                    //                 ),
                                    //               ),
                                    //               Container(
                                    //                 width: double.infinity,
                                    //                 decoration: BoxDecoration(),
                                    //                 child: Padding(
                                    //                   padding: EdgeInsetsDirectional.fromSTEB(0.0, 17.0, 0.0, 17.0),
                                    //                   child: Row(
                                    //                     mainAxisSize: MainAxisSize.max,
                                    //                     mainAxisAlignment: MainAxisAlignment.center,
                                    //                     children: [
                                    //                       ClipRRect(
                                    //                         borderRadius: BorderRadius.circular(8.0),
                                    //                         child: SvgPicture.asset(
                                    //                           'assets/images/Eye.svg',
                                    //                           width: 16.0,
                                    //                           height: 16.0,
                                    //                           fit: BoxFit.cover,
                                    //                         ),
                                    //                       ),
                                    //                       Padding(
                                    //                         padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                    //                         child: Text(
                                    //                           'Подробнее',
                                    //                           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    //                                 font: GoogleFonts.unbounded(
                                    //                                   fontWeight: FontWeight.w500,
                                    //                                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    //                                 ),
                                    //                                 fontSize: 11.0,
                                    //                                 letterSpacing: 0.0,
                                    //                                 fontWeight: FontWeight.w500,
                                    //                                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    //                               ),
                                    //                         ),
                                    //                       ),
                                    //                     ],
                                    //                   ),
                                    //                 ),
                                    //               ),
                                    //             ],
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ].divide(SizedBox(width: 8.0)),
                                    //   ),
                                    // ),
                                    // Padding(
                                    //   padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                                    //   child: wrapWithModel(
                                    //     model: _model.generalButtonModel3,
                                    //     updateCallback: () => safeSetState(() {}),
                                    //     child: GeneralButtonWidget(
                                    //       title: 'Изменить',
                                    //       isActive: true,
                                    //       onTap: () async {},
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
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
    );
  }

  Widget renderDifCell(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: _model.currentDifficulty == item["id"]?FlutterFlowTheme.of(context).primary.withValues(alpha: 0.12):const Color(0xFF242328),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(width: 1, color: _model.currentDifficulty == item["id"]?FlutterFlowTheme.of(context).primary:Colors.transparent)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
            child: Text(
              item["name"],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.unbounded(
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                fontSize: 11.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 1.0,
            decoration: const BoxDecoration(
              color: Color(0xFF302E36),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(),
            child: InkWell(
              onTap: () async {
                await context.pushNamed(
                  WorkoutsExerciseDifficultyPageWidget.routeName,
                  queryParameters: {
                    'difficultyId': serializeParam(
                      item["id"],
                      ParamType.int,
                    ),
                  }.withoutNulls,
                );
                await _model.loadInitialData();
                setState(() {

                });
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 17.0, 0.0, 17.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SvgPicture.asset(
                        'assets/images/Eye.svg',
                        width: 16.0,
                        height: 16.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Подробнее',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.unbounded(
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                          fontSize: 11.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
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
    );
  }
}
