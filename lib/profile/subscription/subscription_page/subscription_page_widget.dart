import '../subscriptionPlanTile.dart';
import '../subscription_confirm_view/subscription_confirm_view_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/general_button_widget.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subscription_page_model.dart';
export 'subscription_page_model.dart';

class SubscriptionPageWidget extends StatefulWidget {
  const SubscriptionPageWidget({
    super.key,
    bool? fromReg,
  }) : this.fromReg = fromReg ?? false;

  final bool fromReg;

  static String routeName = 'SubscriptionPage';
  static String routePath = '/subscriptionPage';

  @override
  State<SubscriptionPageWidget> createState() => _SubscriptionPageWidgetState();
}

class _SubscriptionPageWidgetState extends State<SubscriptionPageWidget> {
  late SubscriptionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionPageModel());
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
                  title: 'Подписка',
                  // hideBack: widget!.fromReg,
                  hideBack: false,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Выберите свой план',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.unbounded(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  'Получите максимальную пользу от тренировок с нашими планами подписки',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.unbounded(
                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        fontSize: 13.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                ),
                              ),
                              FutureBuilder<List<SubscriptionPlanRow>>(
                                future: SubscriptionPlanTable().queryRows(
                                  queryFn: (q) => q.order('type', ascending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context).primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<SubscriptionPlanRow> listViewSubscriptionPlanRowList = snapshot.data!;

                                  return ListView.separated(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      16.0,
                                      0,
                                      16.0,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewSubscriptionPlanRowList.length,
                                    separatorBuilder: (_, __) => SizedBox(height: 8.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewSubscriptionPlanRow = listViewSubscriptionPlanRowList[listViewIndex];

                                      final List<dynamic> features = listViewSubscriptionPlanRow.features is String
                                          ? jsonDecode(listViewSubscriptionPlanRow.features!)
                                          : (listViewSubscriptionPlanRow.features ?? []);

                                      return SubscriptionPlanTile(
                                        plan: listViewSubscriptionPlanRow,
                                        selected: _model.planSelected?.id == listViewSubscriptionPlanRow.id,
                                        onTap: () {
                                          _model.planSelected = listViewSubscriptionPlanRow;
                                          safeSetState(() {});
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                              Text(
                                'О подписке',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.unbounded(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  fontSize: 13,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                child: Text(
                                  'Подписка автоматически продлевается в конце оплаченного периода. Вы можете отменить автопродление в любое время в настройках аккаунта.\nОтмена подписки не приведёт к возврату средств за текущий оплаченный период, но вы сможете пользоваться всеми функциями до его окончания.',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight:
                                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                      fontStyle:
                                      FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).secondaryText,
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
                      ].addToStart(SizedBox(height: 16.0)).addToEnd(SizedBox(height: 24.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Продолжая, вы соглашаюсь с ',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                            ),
                            TextSpan(
                              text: 'Условиями использования',
                              style: GoogleFonts.inter(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              mouseCursor: SystemMouseCursors.click,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  context.pushNamed(
                                    PolicyTermsPageWidget.routeName,
                                    queryParameters: {
                                      'type': serializeParam(
                                        0,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                            ),
                            TextSpan(
                              text: ' и ',
                              style: GoogleFonts.inter(
                                color: FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                            TextSpan(
                              text: 'Политикой конфиденциальности',
                              style: GoogleFonts.inter(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              mouseCursor: SystemMouseCursors.click,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  context.pushNamed(
                                    PolicyTermsPageWidget.routeName,
                                    queryParameters: {
                                      'type': serializeParam(
                                        1,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                            )
                          ],
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
                        textAlign: TextAlign.center,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.generalButtonModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: GeneralButtonWidget(
                        title: 'Оплатить',
                        isActive: _model.planSelected!=null,
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            barrierColor: Color(0x2B000000),
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
                                  child: SubscriptionConfirmViewWidget(
                                    plan: _model.planSelected!,
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ),
                    // if (widget!.fromReg)
                    //   Padding(
                    //     padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    //     child: wrapWithModel(
                    //       model: _model.generalButtonModel2,
                    //       updateCallback: () => safeSetState(() {}),
                    //       child: GeneralButtonWidget(
                    //         title: 'Пропустить',
                    //         isActive: true,
                    //         backbgoundColor: Colors.transparent,
                    //         borderColor: FlutterFlowTheme.of(context).secondaryText,
                    //         onTap: () async {},
                    //       ),
                    //     ),
                    //   ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
