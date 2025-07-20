import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/custom_functions.dart' as functions;

class SubscriptionActiveTile extends StatelessWidget {
  final SubscriptionRow subscription;

  const SubscriptionActiveTile({
    Key? key,
    required this.subscription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<SubscriptionPlanRow>>(
      future: SubscriptionPlanTable().queryRows(
        // queryFn: (q) => q.eq('type', subscription.planId as Object),
        queryFn: (q) => q.eqOrNull(
          'type',
          subscription.planId,
        ),
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(
            color: FlutterFlowTheme.of(context).primary,
          ));
        }
        final plan = snapshot.data!.isNotEmpty ? snapshot.data!.first : null;
        if (plan == null) return SizedBox();

        final List<dynamic> features = plan.features is String
            ? jsonDecode(plan.features!)
            : (plan.features ?? []);

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Color(0xff302E36),
              width: 0.2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/subscr_icon01.svg',
                      width: 16,
                      height: 16,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        plan.title ?? '-',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.unbounded(
                            fontWeight: FontWeight.w600,
                          ),
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    Text(
                      'Активна',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.unbounded(
                          fontWeight: FontWeight.w600,
                        ),
                        color: functions.textToColor(plan.color!),
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  plan.description ?? '-',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 13.0,
                  ),
                ),
                if (features.isNotEmpty)
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                      color: functions.textToColor(plan.color!).withAlpha(51),
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: functions.textToColor(plan.color!),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: features.map<Widget>((f) {
                        final bool available = f['available'] == true;
                        final String title = f['title'] ?? '';
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 6.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/Check_Circle.svg',
                                width: 12,
                                height: 12,
                                fit: BoxFit.cover,
                                color: available
                                    ? FlutterFlowTheme.of(context).primary
                                    : FlutterFlowTheme.of(context).secondaryText,
                              ),
                              SizedBox(width: 9.0),
                              Expanded(
                                child: Text(
                                  title,
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(),
                                    fontSize: 13.0,
                                    color: available
                                        ? FlutterFlowTheme.of(context).primaryText
                                        : FlutterFlowTheme.of(context).secondaryText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                          () {
                        final now = DateTime.now();
                        final expiration = subscription.expirationDate ?? now;
                        final daysLeft = expiration.difference(now).inDays;
                        final formattedDate = DateFormat('dd.MM.yyyy').format(expiration);
                        return 'Следующее списание через: $daysLeft дней ($formattedDate)';
                      }(),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(),
                        fontSize: 13.0,
                        color: functions.textToColor(plan.color!),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}