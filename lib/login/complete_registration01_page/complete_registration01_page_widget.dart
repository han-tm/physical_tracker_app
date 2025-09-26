import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';

import '../../backend/supabase/database/database.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/components/general_button_widget.dart';
import '/components/general_text_field_widget.dart';
import '/components/media_select_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'complete_registration01_page_model.dart';
export 'complete_registration01_page_model.dart';

class CompleteRegistration01PageWidget extends StatefulWidget {
  const CompleteRegistration01PageWidget({super.key});

  static String routeName = 'CompleteRegistration01Page';
  static String routePath = '/completeRegistration01Page';

  @override
  State<CompleteRegistration01PageWidget> createState() => _CompleteRegistration01PageWidgetState();
}

class _CompleteRegistration01PageWidgetState extends State<CompleteRegistration01PageWidget> {
  late CompleteRegistration01PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController textController = TextEditingController();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _model = createModel(context, () => CompleteRegistration01PageModel());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // final token = await FirebaseAuth.instance.currentUser?.getIdToken();
      // final uid = FirebaseAuth.instance.currentUser?.uid;
      // final tokenSupabse = await AppSupabase.instance.client.accessToken?.call();
      // print('Firebase token: $token');
      // print('Firebase UID: $uid');
      // print('Supabase token: $tokenSupabse');

      _loadUserData();

      // final supa = AppSupabase.instance.client;
      //
      // print("accessToken:${supa.auth.currentSession?.accessToken}");   // ≠ null ?
      // print("currentUser_id:${supa.auth.currentUser?.id}");               // uid или null
      // print('currentSession: ${AppSupabase.instance.client.auth.currentSession}');
    });
  }

  Future<void> _loadUserData() async {
    setState(() => _isLoading = true);
    final fbId = currentUserUid;
    final supabase = AppSupabase.instance.client;

    try {
      final response = await supabase.from('User').select('name, image').eq('fb_id', fbId).maybeSingle();

      if (response != null) {
        setState(() {
          _model.name = response['name'];
          textController.text = _model.name!;
          final imageUrl = response['image'] as String?;
          if (imageUrl != null && imageUrl.isNotEmpty) {
            _model.image = FFUploadedFile(name: 'profile.jpg', url: imageUrl);
          }
        });
      }
    } catch (e) {
      print('Ошибка загрузки данных пользователя: $e');
    } finally {
      setState(() => _isLoading = false);
    }
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
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primary,
                ))
              : Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF242328),
                                            borderRadius: BorderRadius.circular(16.0),
                                          ),
                                          child: Align(
                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
                                              child: SvgPicture.asset(
                                                'assets/images/profile_icon.svg',
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Завершите регистрацию',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        font: GoogleFonts.unbounded(
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.w600,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Добавьте информацию о себе',
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
                                        ),
                                      ],
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) => Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: const Color(0x1F000000),
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
                                                  child: MediaSelectViewWidget(
                                                    onMediaSelect: (media) {
                                                      _model.image = media;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => safeSetState(() {}));
                                        },
                                        child: Container(
                                          width: 96.0,
                                          height: 96.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                          ),
                                          child: Stack(
                                            children: [
                                              if (_model.image != null) ...[
                                                if (_model.image!.bytes != null)
                                                  ClipOval(
                                                    child: Image.memory(
                                                      _model.image!.bytes!,
                                                      fit: BoxFit.cover,
                                                      width: 96,
                                                      height: 96,
                                                    ),
                                                  )
                                                else if (_model.image!.url != null)
                                                  ClipOval(
                                                    child: Image.network(
                                                      _model.image!.url!,
                                                      fit: BoxFit.cover,
                                                      width: 96,
                                                      height: 96,
                                                    ),
                                                  )
                                              ] else
                                                Center(
                                                  child: SvgPicture.asset('assets/images/User_Rounded.svg', width: 40),
                                                ),
                                              Align(
                                                alignment: Alignment.bottomRight,
                                                child: SvgPicture.asset('assets/images/edit_icon.svg',
                                                    width: 24, height: 24),
                                              ),
                                              // Container(
                                              //   width: double.infinity,
                                              //   height: double.infinity,
                                              //   decoration: BoxDecoration(
                                              //     color: Color(0xFF242328),
                                              //     shape: BoxShape.circle,
                                              //   ),
                                              //   child: Align(
                                              //     alignment: AlignmentDirectional(0.0, 0.0),
                                              //     child: ClipRRect(
                                              //       borderRadius: BorderRadius.circular(8.0),
                                              //       child: SvgPicture.asset(
                                              //         'assets/images/User_Rounded.svg',
                                              //         width: 40.0,
                                              //         height: 40.0,
                                              //         fit: BoxFit.cover,
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),
                                              // if (_model.image != null && (_model.image?.bytes?.isNotEmpty ?? false))
                                              //   Container(
                                              //     width: double.infinity,
                                              //     height: double.infinity,
                                              //     clipBehavior: Clip.antiAlias,
                                              //     decoration: BoxDecoration(
                                              //       shape: BoxShape.circle,
                                              //     ),
                                              //     child: Image.memory(
                                              //       _model.image?.bytes ?? Uint8List.fromList([]),
                                              //       fit: BoxFit.cover,
                                              //     ),
                                              //   ),
                                              Align(
                                                alignment: const AlignmentDirectional(1.0, 1.0),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  child: SvgPicture.asset(
                                                    'assets/images/edit_icon.svg',
                                                    width: 24.0,
                                                    height: 24.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.generalTextFieldModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: GeneralTextFieldWidget(
                                        title: 'Как вас зовут?',
                                        controller: textController,
                                        maxLength: 50,
                                        initialValue: _model.name,
                                        hintText: 'Введите ваше имя',
                                        onValueEnter: (value) async {
                                          _model.name = value;
                                          safeSetState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: wrapWithModel(
                                model: _model.generalButtonModel,
                                updateCallback: () => safeSetState(() {}),
                                child: GeneralButtonWidget(
                                  title: 'Сохранить',
                                  isActive: _model.name != null && _model.name != '',
                                  onTap: () async {
                                    // final res = await AppSupabase.instance.client.rpc('debug_uid');
                                    // print('UID из Supabase (auth.uid()): ${res}');
                                    // final res = await AppSupabase.instance.client.rpc('firebase_uid');
                                    // print('UID из Postgres: ${res}');

                                    // final res = await AppSupabase.instance.client
                                    //     .from('User')
                                    //     .insert({'fb_id': 'test'})          // любой тестовый insert
                                    //     // .withHeaders({'Prefer': 'return=minimal'})   // ← ничего не возвращать
                                    //     // .debug()                            // главное — получить CURL
                                    //     .execute();
                                    final name = _model.name?.trim();

                                    if (name == null || name.isEmpty) return;

                                    FocusManager.instance.primaryFocus?.unfocus();

                                    final supabase = AppSupabase.instance.client;
                                    final fbId = currentUserUid;

                                    String? publicImageUrl;

                                    // Загрузка изображения, если выбрано
                                    if (_model.image?.bytes != null) {
                                      final fileName = 'user_avatars/$fbId.jpg';
                                      try {
                                        await supabase.storage.from('boom-bucket').uploadBinary(
                                              fileName,
                                              _model.image!.bytes!,
                                              fileOptions: FileOptions(
                                                contentType: 'image/jpeg',
                                                upsert: true,
                                                metadata: {
                                                  'owner': currentUserUid,
                                                },
                                              ),
                                            );
                                        final baseUrl = supabase.storage.from('boom-bucket').getPublicUrl(fileName);
                                        publicImageUrl = '$baseUrl?t=${DateTime.now().millisecondsSinceEpoch}';
                                      } catch (e) {
                                        print('Ошибка загрузки изображения: $e');
                                      }
                                    } else if (_model.image?.url != null) {
                                      publicImageUrl = _model.image!.url;
                                    }

                                    var dataToSave = {
                                      'name': name,
                                      'image': publicImageUrl,
                                    };
                                    print("dataToSave: $dataToSave");

                                    // Добавление или обновление записи в таблице User
                                    try {
                                      await supabase.from('User').update(dataToSave).eq('fb_id', fbId);
                                    } catch (e) {
                                      print('Ошибка сохранения в Supabase: $e');
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Ошибка при сохранении профиля: $e')),
                                      );
                                      return;
                                    }

                                    try {
                                      // 1. Получаем последний план
                                      final plans = await supabase
                                          .from('SubscriptionPlan')
                                          .select()
                                          .eq('isTrial', true)
                                          .limit(1)
                                          .maybeSingle();

                                      if (plans == null) {
                                        print('Нет доступных планов.');
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Не удалось найти тарифный план.')),
                                        );
                                        return;
                                      }

                                      final planId = plans['id'] as int;

                                      // 2. Создаём подписку
                                      final expirationDate = DateTime.now().add(const Duration(days: 5));
                                      await supabase.from('Subscription').insert({
                                        'user_id': fbId,
                                        'plan_id': planId,
                                        'expiration_date': expirationDate.toIso8601String(),
                                      });

                                      print('Подписка активирована до: $expirationDate');
                                    } catch (e) {
                                      print('Ошибка при создании подписки: $e');
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text('Ошибка при активации подписки: $e')),
                                      );
                                      return;
                                    }

                                    FFAppState().regCompleted = true;
                                    safeSetState(() {});

                                    context.pushNamed(CompleteRegistration02PageWidget.routeName);
                                  },
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
    );
  }
}
