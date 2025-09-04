import 'package:auto_size_text/auto_size_text.dart';
import 'package:boom_client/backend/supabase/database/database.dart';
import 'package:boom_client/flutter_flow/size_utils.dart';
import 'package:boom_client/index.dart';
import 'package:boom_client/profile/profile_about_view/profile_about_view_widget.dart';
import 'package:boom_client/profile/subscription/subscriptionActiveTile.dart';
import 'package:flutter_svg/svg.dart';

import '../../auth/firebase_auth/auth_util.dart';
import '../../backend/supabase/database/tables/user.dart';
import '../../components/general_button_widget.dart';
import '../../flutter_flow/custom_image_view.dart';
import '../../flutter_flow/image_constant.dart';
import '../../flutter_flow/text_style_helper.dart';
import '../../flutter_flow/theme_helper.dart';
import '../../start/start_page/start_page_widget.dart';
import '../profile_personal_data_page/profile_personal_data_page_widget.dart';
import '../sign_out_view/sign_out_view_widget.dart';
import '../subscription/subscription_page/subscription_page_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  static String routeName = 'ProfilePage';
  static String routePath = '/profilePage';

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());
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
          child: StreamBuilder<List<UserRow>>(
            stream: _model.containerSupabaseStream1 ??= AppSupabase.instance.client
                .from("User")
                .stream(primaryKey: ['id'])
                .eqOrNull(
              'fb_id',
              currentUserUid,
            )
                .map((list) => list.map((item) => UserRow(item)).toList()),
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
              List<UserRow> containerUserRowList = snapshot.data!;

              final containerUserRow = containerUserRowList.isNotEmpty ? containerUserRowList.first : null;
              // print("asdasd________${currentUserUid}");
              if (containerUserRow == null) {
                return const Center(
                 child: Text("Пользователь отсутствует",style: TextStyle(color: Colors.red),),
                );
              }

              return Container(
                decoration: BoxDecoration(),
                child: StreamBuilder<List<SubscriptionRow>>(
                  stream: _model.containerSupabaseStream2 ??= AppSupabase.instance.client
                      .from("Subscription")
                      .stream(primaryKey: ['id'])
                      .eqOrNull(
                    'user_id',
                    currentUserUid,
                  )
                      .order('created_at')
                      .map((list) =>
                      list.map((item) => SubscriptionRow(item)).toList()),
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
                    List<SubscriptionRow> containerSubscriptionRowList = snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(48.0),
                              child: Image.network(
                                containerUserRow!.image!,
                                width: 96.0,
                                height: 96.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  containerUserRow?.name,
                                  '-',
                                ),
                                textAlign: TextAlign.center,
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                // height: 130.0,
                                margin: const EdgeInsets.only(top: 16),
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage('assets/images/d5a51d9b14d357f9eed651066a3421a786b9a4fe.jpg'),
                                    fit: BoxFit.cover,
                                    opacity: 0.5
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(width: 1, color: const Color(0xff302E36))
                                ),
                                child: Stack(
                                  children: [
                                    if (containerSubscriptionRowList.length == 1)
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              'Оформите премиум',
                                              minFontSize: 7.0,
                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                    font: GoogleFonts.unbounded(
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                    ),
                                                    fontSize: 15.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                  ),
                                            ),
                                            AutoSizeText(
                                              'Срок бесплатного периода заканчивается через: ${_getDaysLeft(containerSubscriptionRowList[0].expirationDate)} дней',
                                              minFontSize: 7.0,
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
                                            Container(
                                              margin: const EdgeInsets.only(top: 8),
                                              height: 32,
                                              width: 180,
                                              child: GeneralButtonWidget(
                                                title: 'Оформить',
                                                isActive: true,
                                                leading: Container(
                                                  child: Center(
                                                    child: SvgPicture.asset(
                                                      'assets/images/Star_Shine.svg',
                                                      width: 16.0,
                                                      height: 16.0,
                                                      fit: BoxFit.cover,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                onTap: () async {
                                                  context.pushNamed(
                                                    SubscriptionPageWidget.routeName,
                                                    queryParameters: {
                                                      'fromReg': serializeParam(
                                                        false,
                                                        ParamType.bool,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (containerSubscriptionRowList.length > 1)
                                      SubscriptionActiveTile(subscription: containerSubscriptionRowList[0])
                                  ],
                                ),
                              ),
                            ),
                            _buildMenuItems(),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierColor: Colors.black.withOpacity(0.5),
                                  builder: (context) => SignOutViewWidget(
                                    onConfirm: () async {
                                      GoRouter.of(context).prepareAuthEvent();
                                      await authManager.signOut();
                                      GoRouter.of(context).clearRedirectLocation();

                                      context.goNamedAuth(StartPageWidget.routeName, context.mounted);
                                      Navigator.pop(context);

                                    },
                                    onCancel: () => Navigator.pop(context),
                                  ),
                                );
                              },
                              child: Container(
                                height: 42,
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                decoration: BoxDecoration(
                                  border: Border.all(color: FlutterFlowTheme.of(context).secondaryText, width: 1),
                                  borderRadius: BorderRadius.circular(99),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Выйти',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Align(
                            //   alignment: AlignmentDirectional(0.0, 0.0),
                            //   child: Padding(
                            //     padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                            //     child: FFButtonWidget(
                            //       onPressed: () async {
                            //         GoRouter.of(context).prepareAuthEvent();
                            //         await authManager.signOut();
                            //         GoRouter.of(context).clearRedirectLocation();
                            //
                            //         context.goNamedAuth(StartPageWidget.routeName, context.mounted);
                            //       },
                            //       text: 'Logout',
                            //       options: FFButtonOptions(
                            //         height: 40.0,
                            //         padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                            //         iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                            //         color: FlutterFlowTheme.of(context).primary,
                            //         textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            //               font: GoogleFonts.unbounded(
                            //                 fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                            //                 fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                            //               ),
                            //               color: Colors.white,
                            //               letterSpacing: 0.0,
                            //               fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                            //               fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                            //             ),
                            //         elevation: 0.0,
                            //         borderRadius: BorderRadius.circular(8.0),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItems() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 16),
          _buildMenuItem(
            iconPath: ImageConstant.imgUsersUserId,
            title: 'Личные данные',
            subtitle: 'Имя, возраст, рост, вес',
            onTap: () async {
              print('Personal data clicked');
              await context.pushNamed(ProfilePersonalDataPageWidget.routeName);
            },
          ),
          SizedBox(height: 16),
          _buildMenuItem(
            iconPath: ImageConstant.imgSportsDumbbells2,
            title: 'Уровень сложности',
            subtitle: 'Ваш уровень сложности',
            onTap: () {
              print('Difficulty level clicked');
              context.pushNamed(ProfileDifficultyPageWidget.routeName);
            },
          ),
          SizedBox(height: 16),
          _buildMenuItem(
            iconPath: ImageConstant.imgSystemBell,
            title: 'Уведомления',
            subtitle: 'Список уведомлений',
            // showBadge: true,
            // badgeCount: '1',
            onTap: () {
              print('Notifications clicked');
              context.pushNamed(ProfileNotificationsPageWidget.routeName);
            },
          ),
          SizedBox(height: 16),
          _buildMenuItem(
            iconPath: ImageConstant.imgSystemRuler,
            title: 'Статистика замеров',
            subtitle: 'Ваши параметры и прогресс',
            onTap: () {
              print('Statistics clicked');
              context.pushNamed(ProfileMeasurementAddPageWidget.routeName);
            },
          ),
          SizedBox(height: 16),
          _buildMenuItem(
            iconPath: ImageConstant.imgSystemIphone,
            title: 'О приложении',
            subtitle: 'Версия приложения: v1.0',
            onTap: () async {
              print('About app clicked');
              await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
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
                    child: const ProfileAboutViewWidget(),
                  ),
                );
              },
              ).then((value) => safeSetState(() {}));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required String iconPath,
    required String title,
    required String subtitle,
    bool showBadge = false,
    String? badgeCount,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: appTheme.colorFF2423,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: appTheme.colorFFE27B.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: CustomImageView(
                  imagePath: iconPath,
                  height: 20,
                  width: 20,
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
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
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: appTheme.colorFF6965,
                      height: 1.23,
                    ),
                  ),
                ],
              ),
            ),
            if (showBadge && badgeCount != null) ...[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: appTheme.colorFFFF43,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  badgeCount,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: appTheme.colorFFF2F2,
                    height: 1.27,
                  ),
                ),
              ),
              SizedBox(width: 8),
            ],
            CustomImageView(
              imagePath: ImageConstant.imgArrowright,
              height: 16,
              width: 16,
            ),
          ],
        ),
      ),
    );
  }

  int _getDaysLeft(DateTime? expirationDate) {
    if (expirationDate == null) return 0;
    final now = DateTime.now();
    final diff = expirationDate.difference(now).inDays;
    return diff > 0 ? diff : 0;
  }
}
