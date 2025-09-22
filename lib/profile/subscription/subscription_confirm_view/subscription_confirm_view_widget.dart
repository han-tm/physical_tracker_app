import 'package:boom_client/auth/firebase_auth/auth_util.dart';
import 'package:boom_client/profile/subscription/payment_success/payment_success_widget.dart';

import '../subscriptionPlanTile.dart';
import '/backend/supabase/supabase.dart';
import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'subscription_confirm_view_model.dart';
export 'subscription_confirm_view_model.dart';

class SubscriptionConfirmViewWidget extends StatefulWidget {
  const SubscriptionConfirmViewWidget({
    super.key,
    required this.plan,
  });

  final SubscriptionPlanRow? plan;

  @override
  State<SubscriptionConfirmViewWidget> createState() => _SubscriptionConfirmViewWidgetState();
}

class _SubscriptionConfirmViewWidgetState extends State<SubscriptionConfirmViewWidget> {
  late SubscriptionConfirmViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionConfirmViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF1A191D),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
              child: Text(
                'Оплата',
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
            SubscriptionPlanTile(
              plan: widget.plan!,
              selected: false,
              onTap: () {

              },
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: wrapWithModel(
                model: _model.generalButtonModel,
                updateCallback: () => safeSetState(() {}),
                child: GeneralButtonWidget(
                  title: 'Оплатить',
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
                      await SubscriptionTable().insert({
                        'created_at': supaSerialize<DateTime>(getCurrentTimestamp),
                        'expiration_date': supaSerialize<DateTime>(functions.timeAddMonth(getCurrentTimestamp)),
                        'plan_id': widget.plan?.type,
                        'user_id': currentUserUid,
                      });

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
                              child: const PaymentSuccessWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));

                      context.goNamed(
                        ProfilePageWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
