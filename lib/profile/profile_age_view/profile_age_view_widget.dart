import 'package:boom_client/components/user_age_view.dart';

import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_age_view_model.dart';
export 'profile_age_view_model.dart';

class ProfileAgeViewWidget extends StatefulWidget {
  const ProfileAgeViewWidget({super.key, required this.initDateTime, required this.onSelect});

  final DateTime initDateTime;
  final Function(int) onSelect;


  @override
  State<ProfileAgeViewWidget> createState() => _ProfileAgeViewWidgetState();
}

class _ProfileAgeViewWidgetState extends State<ProfileAgeViewWidget> {
  late ProfileAgeViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileAgeViewModel());
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
      decoration: BoxDecoration(
        color: Color(0xFF1A191D),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Возраст',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.unbounded(
                  fontWeight: FontWeight.bold,
                  fontStyle:
                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                fontSize: 20.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
                fontStyle:
                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                decoration: BoxDecoration(
                  color: Color(0xFF302E36),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Color(0xFF302E36),
                    width: 1.0,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UserAgeViewWidget(
                        initDateTime: widget.initDateTime,
                        onSelect: (value) {
                          _model.age = calculateAge(value);
                          setState(() {});
                        }
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: wrapWithModel(
                model: _model.generalButtonModel,
                updateCallback: () => safeSetState(() {}),
                child: GeneralButtonWidget(
                  title: 'Сохранить',
                  isActive: _model.age != null,
                  onTap: () async {
                    widget.onSelect(_model.age!);
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  int calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;

    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  }
}
