import '/backend/supabase/supabase.dart';
import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IndividualProgramPurchaseConfirmViewWidget extends StatefulWidget {
  const IndividualProgramPurchaseConfirmViewWidget({
    super.key,
    required this.plan,
  });

  final SubscriptionPlanRow? plan;

  @override
  State<IndividualProgramPurchaseConfirmViewWidget> createState() => _IndividualProgramPurchaseConfirmViewWidgetState();
}

class _IndividualProgramPurchaseConfirmViewWidgetState extends State<IndividualProgramPurchaseConfirmViewWidget> {
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
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
              child: Text(
                'Подтверждение покупки',
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
            const Divider(
              height: 24,
              thickness: 1,
              color: Color(0xFF302E36),
            ),
            RichText(
              text: TextSpan(
                text: 'Вы собираетесь приобрести индивидуальную программу тренировок за',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.normal,
                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 15.0,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontWeight: FontWeight.normal,
                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                children: [
                  TextSpan(
                    text: ' ${widget.plan?.price?.floor()} ₽',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                          fontSize: 15.0,
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'После оплаты вы будете перенаправлены в Telegram-чат с куратором для составления персонализированной программы.',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.normal,
                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    fontSize: 15.0,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontWeight: FontWeight.normal,
                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: GeneralButtonWidget(
                title: 'Оплатить',
                isActive: true,
                onTap: () async {
                  context.pop(true);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
