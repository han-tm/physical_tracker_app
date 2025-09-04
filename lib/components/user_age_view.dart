import 'package:flutter_svg/flutter_svg.dart';

import '../../userData/PreRegistrationData.dart';
import '../../userData/PreRegistrationStorage.dart';
import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/survery/skip_personalization/skip_personalization_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserAgeViewWidget extends StatefulWidget {
  const UserAgeViewWidget({super.key, required this.initDateTime, required this.onSelect});

  final DateTime initDateTime;
  final Function(DateTime) onSelect;

  @override
  State<UserAgeViewWidget> createState() => _UserAgeViewWidgetState();
}

class _UserAgeViewWidgetState extends State<UserAgeViewWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 216.0,
      child: CupertinoTheme(
        data: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: FlutterFlowTheme.of(context).headlineMedium.override(
              font: GoogleFonts.unbounded(
                fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
              ),
              // color: Color(0xFF696576),
              color: FlutterFlowTheme.of(context).primary,
              fontSize: 20.0,
            ),
          ),
        ),
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          minimumDate: DateTime(1900),
          maximumDate: DateTime.now(),
          initialDateTime: widget.initDateTime,
          onDateTimeChanged: (DateTime value) {
            widget.onSelect(value);
            setState(() {});
          },
        ),
      ),
    );
  }
}
