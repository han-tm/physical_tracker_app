import 'package:boom_client/backend/supabase/supabase.dart' hide User;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_code_page_model.dart';
export 'login_code_page_model.dart';

class LoginCodePageWidget extends StatefulWidget {
  const LoginCodePageWidget({
    super.key,
    required this.code,
    required this.phone,
  });

  final String phone;
  final String code;

  static String routeName = 'LoginCodePage';
  static String routePath = '/loginCodePage';

  @override
  State<LoginCodePageWidget> createState() => _LoginCodePageWidgetState();
}

class _LoginCodePageWidgetState extends State<LoginCodePageWidget> {
  late LoginCodePageModel _model;
  late String code;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool codeSending = false;

  @override
  void initState() {
    code = widget.code;
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

  bool loading = false;
  String? errorMessage;

  Future<void> verifyOTP(String otp) async {
    setState(() {
      loading = true;
      errorMessage = null;
    });
    final ff = FirebaseFunctions.instance;
    try {
      final HttpsCallable callable = ff.httpsCallable('verifyCode', options: HttpsCallableOptions());
      final Map<String, dynamic> dataToSend = {'phone': widget.phone, 'code': otp};
      print('Data being sent to Firebase Function: $dataToSend');
      final HttpsCallableResult result = await callable.call(dataToSend);
      print('Result: ${result.data}');

      final String? token = result.data['token'];

      if (token == null) {
        setState(() {
          loading = false;
          errorMessage = 'Токен не найден';
        });
        return;
      }

      if (mounted) {
        GoRouter.of(context).prepareAuthEvent();
        final auth = FirebaseAuth.instance;
        final UserCredential userCredential = await auth.signInWithCustomToken(token);

        if (userCredential.user != null) {
          await maybeCreateUser(userCredential.user!);
          context.goNamedAuth(RouterPageWidget.routeName, context.mounted);
        } else {
          setState(() {
            loading = false;
            errorMessage = 'Ошибка авторизации';
          });
        }
      }
    } on FirebaseFunctionsException catch (e) {
      print('Firebase Functions Error: ${e.code} - ${e.message} - ${e.details}');
      String message = e.message == 'Invalid code provided.' ? 'Код неверный' : e.message ?? e.code;

      setState(() {
        loading = false;
        errorMessage = message;
      });
    } catch (e) {
      print('Error {verifyOTP}: $e');

      setState(() {
        loading = false;
        errorMessage = e.toString();
      });
    }
  }

  Future maybeCreateUser(User user) async {
    final supabase = AppSupabase.instance.client;
    final fbId = user.uid;
    final response = await supabase.from('User').select().eq('fb_id', fbId).maybeSingle();

    final userExists = response != null;

    if (userExists) {
      // currentUserDocument = await UserRecord.getDocumentOnce(userRecord);
      //TODO
      return;
    }

    var dataToSave = {
      'fb_id': fbId,
      'phone_number': widget.phone,
    };
    await supabase.from('User').upsert(dataToSave, onConflict: 'fb_id');

    // await userRecord.set(userData);
    // currentUserDocument = UserRecord.getDocumentFromData(userData, userRecord);
  }

  Future<void> resendCode() async {
    print('send code phone: ${widget.phone}');

    setState(() {
      codeSending = true;
      _model.allowSendAgain = false;
    });

    final ff = FirebaseFunctions.instance;

    try {
      final HttpsCallable callable = ff.httpsCallable('sendCodeDev', options: HttpsCallableOptions());
      final Map<String, dynamic> dataToSend = {'phone': widget.phone};
      print('Data being sent to Firebase Function: $dataToSend');
      final HttpsCallableResult result = await callable.call(dataToSend);
      print('Result: ${result.data}');
      final code = result.data['code'];
      setState(() {
        codeSending = false;
        this.code = code;
        _model.timerController.timer.setPresetTime(mSec: 60000, add: false);
        _model.timerController.onResetTimer();
        _model.timerController.onStartTimer();
      });
    } on FirebaseFunctionsException catch (e) {
      print('Firebase Functions Error: ${e.code} - ${e.message} - ${e.details}');
      String message = e.message == 'Failed to send code due to an internal server error.'
          ? 'Произошла ошибка при отправке кода'
          : e.message == 'Wait before requesting another code.'
              ? 'Подождите, прежде чем запрашивать другой код'
              : e.message ?? e.code;
      setState(() {
        codeSending = false;
        errorMessage = message;
      });
    } catch (e) {
      print('Error {sendCode}: $e');

      setState(() {
        codeSending = false;
        errorMessage = e.toString();
      });
    }
  }

  String formatPhoneNumber(String phone) {
    if (phone.length != 11 || !phone.startsWith('7')) return phone;

    const countryCode = '+7';
    final areaCode = phone.substring(1, 4); // 926
    final firstPart = phone.substring(4, 7); // 199
    final secondPart = phone.substring(7, 9); // 70
    final thirdPart = phone.substring(9, 11); // 02

    return '$countryCode ($areaCode) $firstPart $secondPart $thirdPart';
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
                          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                          child: Text(
                            'Введите код подтверждения из СМС, отправленного на ${formatPhoneNumber(widget.phone)}',
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
                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                          child: loading
                              ? const Center(child: CircularProgressIndicator())
                              : PinCodeTextField(
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
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(16.0),
                                        bottomRight: Radius.circular(16.0),
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                      shape: PinCodeFieldShape.box,
                                      activeColor: Colors.transparent,
                                      inactiveColor: const Color(0x00E0E3E7),
                                      selectedColor: FlutterFlowTheme.of(context).primary,
                                      activeFillColor: const Color(0xFF1A191D),
                                      inactiveFillColor: const Color(0xFF1A191D),
                                      selectedFillColor: FlutterFlowTheme.of(context).primary.withValues(alpha: 0.12)),
                                  controller: _model.pinCodeController,
                                  onChanged: (_) {},
                                  onCompleted: (_) async {
                                    // GoRouter.of(context).prepareAuthEvent();
                                    final smsCodeVal = _model.pinCodeController!.text;
                                    // if (smsCodeVal.isEmpty) {
                                    //   ScaffoldMessenger.of(context).showSnackBar(
                                    //     const SnackBar(
                                    //       content: Text('Enter SMS verification code.'),
                                    //     ),
                                    //   );
                                    //   return;
                                    // }
                                    // final phoneVerifiedUser = await authManager.verifySmsCode(
                                    //   context: context,
                                    //   smsCode: smsCodeVal,
                                    // );
                                    // if (phoneVerifiedUser == null) {
                                    //   return;
                                    // }

                                    // context.goNamedAuth(RouterPageWidget.routeName, context.mounted);
                                    if (smsCodeVal.length == 6) {
                                      verifyOTP(smsCodeVal);
                                    }
                                  },
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  validator: _model.pinCodeControllerValidator.asValidator(context),
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: Text(
                            'Тестовый код: $code',
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                        if (!_model.allowSendAgain)
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
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
                                        child: FlutterFlowTimer(
                                          initialTime: _model.timerInitialTimeMs,
                                          getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                                            value,
                                            hours: false,
                                            milliSecond: false,
                                          ),
                                          controller: _model.timerController,
                                          updateStateInterval: const Duration(milliseconds: 1000),
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
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await resendCode();
                                        // setState(() {
                                        //   codeSending = true;
                                        // });

                                        // final phoneNumberVal = widget.phone!;

                                        // await authManager.beginPhoneAuth(
                                        //   context: context,
                                        //   phoneNumber: phoneNumberVal,
                                        //   onCodeSent: (context) async {
                                        //     _model.allowSendAgain = false;
                                        //     safeSetState(() {});
                                        //     _model.timerController.timer.setPresetTime(mSec: 6000, add: false);
                                        //     _model.timerController.onResetTimer();

                                        //     _model.timerController.onStartTimer();
                                        //   },
                                        // );

                                        // setState(() {
                                        //   codeSending = false;
                                        // });
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
                                                  width: 20,
                                                  height: 20,
                                                  child: CircularProgressIndicator(
                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                  ),
                                                )
                                              : Text(
                                                  'Отправить',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        font: GoogleFonts.unbounded(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(context).bodyMedium.fontWeight,
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
                        if (errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 18, right: 18),
                            child: Column(
                              children: [
                                if (errorMessage == 'Код неверный')
                                  Container(
                                    width: double.infinity,
                                    height: 48,
                                    margin: const EdgeInsets.only(bottom: 16),
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFF4354),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.info_outline,
                                            color: FlutterFlowTheme.of(context).primaryText, size: 24),
                                        const SizedBox(width: 6),
                                        Text(
                                          'Неверный код подтверждения',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                ),
                                                fontSize: 15,
                                                color: FlutterFlowTheme.of(context).primaryText,
                                                letterSpacing: 0.0,
                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                Text(
                                  errorMessage! == 'Код неверный'
                                      ? 'Код не подходит. Проверьте правильность введённых цифр и срок действия кода. Если код устарел, запросите новый'
                                      : errorMessage!,
                                  textAlign: TextAlign.center,
                                  // style: const TextStyle(color: Colors.red),
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                        color: Colors.red,
                                        letterSpacing: 0.0,
                                        fontSize: 13,
                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                ),
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
}
