import 'package:firebase_auth/firebase_auth.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_code_page_model.dart';
export 'login_code_page_model.dart';

class LoginCodePageWidget extends StatefulWidget {
  const LoginCodePageWidget({
    super.key,
    required this.phone,
  });

  final String? phone;

  static String routeName = 'LoginCodePage';
  static String routePath = '/loginCodePage';

  @override
  State<LoginCodePageWidget> createState() => _LoginCodePageWidgetState();
}

class _LoginCodePageWidgetState extends State<LoginCodePageWidget> {
  late LoginCodePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool codeSending = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginCodePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
    });

    _model.pinCodeFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
                  title: 'СМС-код',
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
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                          child: Text(
                            'Введите код подтверждения из СМС, отправленного на ${widget!.phone}',
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
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                          child: PinCodeTextField(
                            autoDisposeControllers: false,
                            appContext: context,
                            length: 6,
                            textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                  font: GoogleFonts.unbounded(
                                    fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                ),
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            enableActiveFill: true,
                            autoFocus: true,
                            focusNode: _model.pinCodeFocusNode,
                            enablePinAutofill: false,
                            errorTextSpace: 16.0,
                            showCursor: true,
                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                            obscureText: false,
                            hintCharacter: '-',
                            keyboardType: TextInputType.number,
                            pinTheme: PinTheme(
                              fieldHeight: 52.0,
                              fieldWidth: 52.0,
                              borderWidth: 0.0,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0),
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                              shape: PinCodeFieldShape.box,
                              activeColor: Colors.transparent,
                              inactiveColor: Color(0x00E0E3E7),
                              selectedColor: FlutterFlowTheme.of(context).primary,
                              activeFillColor: Color(0xFF1A191D),
                              inactiveFillColor: Color(0xFF1A191D),
                              selectedFillColor: FlutterFlowTheme.of(context).primary.withValues(alpha: 0.12)
                            ),
                            controller: _model.pinCodeController,
                            onChanged: (_) {},
                            onCompleted: (_) async {
                              GoRouter.of(context).prepareAuthEvent();
                              final smsCodeVal = _model.pinCodeController!.text;
                              if (smsCodeVal == null || smsCodeVal.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Enter SMS verification code.'),
                                  ),
                                );
                                return;
                              }
                              final phoneVerifiedUser = await authManager.verifySmsCode(
                                context: context,
                                smsCode: smsCodeVal,
                              );
                              if (phoneVerifiedUser == null) {
                                return;
                              }

                              context.goNamedAuth(RouterPageWidget.routeName, context.mounted);
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: _model.pinCodeControllerValidator.asValidator(context),
                          ),
                        ),
                        if (!_model.allowSendAgain)
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                              child: Wrap(
                                spacing: 0.0,
                                runSpacing: 0.0,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.center,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  Text(
                                    'Выслать код повторно через:',
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                        borderRadius: BorderRadius.circular(100.0),
                                        border: Border.all(
                                          color: Color(0xFFFDAF20),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(13.0, 8.0, 13.0, 8.0),
                                        child: FlutterFlowTimer(
                                          initialTime: _model.timerInitialTimeMs,
                                          getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                                            value,
                                            hours: false,
                                            milliSecond: false,
                                          ),
                                          controller: _model.timerController,
                                          updateStateInterval: Duration(milliseconds: 1000),
                                          onChanged: (value, displayTime, shouldUpdate) {
                                            _model.timerMilliseconds = value;
                                            _model.timerValue = displayTime;
                                            if (shouldUpdate) safeSetState(() {});
                                          },
                                          onEnded: () async {
                                            _model.allowSendAgain = true;
                                            safeSetState(() {});
                                          },
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                font: GoogleFonts.unbounded(
                                                  fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                  fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                ),
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if (_model.allowSendAgain)
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
                              child: Wrap(
                                spacing: 0.0,
                                runSpacing: 0.0,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                direction: Axis.horizontal,
                                runAlignment: WrapAlignment.center,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.none,
                                children: [
                                  Text(
                                    'Не получили СМС-код?',
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          codeSending = true;
                                        });

                                        final phoneNumberVal = widget.phone!;

                                        await authManager.beginPhoneAuth(
                                          context: context,
                                          phoneNumber: phoneNumberVal,
                                          onCodeSent: (context) async {
                                            _model.allowSendAgain = false;
                                            safeSetState(() {});
                                            _model.timerController.timer.setPresetTime(mSec: 6000, add: false);
                                            _model.timerController.onResetTimer();

                                            _model.timerController.onStartTimer();
                                          },
                                        );

                                        setState(() {
                                          codeSending = false;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                          borderRadius: BorderRadius.circular(100.0),
                                          border: Border.all(
                                            color: const Color(0xFFFDAF20),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(13.0, 8.0, 13.0, 8.0),
                                          child: codeSending
                                              ? Container(
                                            margin: const EdgeInsets.only(left: 35, right: 35),
                                            width: 20,height: 20,
                                            child: CircularProgressIndicator(
                                              color: FlutterFlowTheme.of(context).primaryText,
                                            ),
                                          )
                                              :Text(
                                            'Отправить',
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
