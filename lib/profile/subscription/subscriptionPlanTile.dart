import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/custom_functions.dart' as functions;

class SubscriptionPlanTile extends StatelessWidget {
  final SubscriptionPlanRow plan;
  final bool selected;
  final VoidCallback onTap;

  const SubscriptionPlanTile({
    Key? key,
    required this.plan,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<dynamic> features = plan.features is String
        ? jsonDecode(plan.features!)
        : (plan.features ?? []);

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: selected ? FlutterFlowTheme.of(context).primary : Color(0xFF302E36),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: SvgPicture.asset(
                      'assets/images/subscr_icon01.svg',
                      width: 16,
                      height: 16,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      plan.title ?? '-',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.unbounded(
                          fontWeight: FontWeight.w600,
                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                  Text(
                    '${(plan.price ?? 0) % 1 == 0 ? plan.price!.toInt() : plan.price} ₽/мес',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.unbounded(
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: functions.textToColor(plan.color!),
                      fontSize: 15.0,
                      letterSpacing: 0.0,
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
            ],
          ),
        ),
      ),
    );
  }
}