import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_notifications_settings_view_model.dart';
export 'profile_notifications_settings_view_model.dart';

class ProfileNotificationsSettingsViewWidget extends StatefulWidget {
  const ProfileNotificationsSettingsViewWidget({super.key});

  @override
  State<ProfileNotificationsSettingsViewWidget> createState() => _ProfileNotificationsSettingsViewWidgetState();
}

class _ProfileNotificationsSettingsViewWidgetState extends State<ProfileNotificationsSettingsViewWidget> {
  late ProfileNotificationsSettingsViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileNotificationsSettingsViewModel());
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
        child: StreamBuilder<List<UserRow>>(
          stream: _model.containerSupabaseStream ??= AppSupabase.instance.client
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
              return Container(
                width: double.infinity,
                height: 100,
                child: Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                ),
              );
            }
            List<UserRow> containerUserRowList = snapshot.data!;

            final containerUserRow = containerUserRowList.isNotEmpty ? containerUserRowList.first : null;

            return Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Настройки уведомлений',
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
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
                        color: Color(0xFF242328),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 56.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Пуш-уведомления',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                    ),
                                  ),
                                  Switch.adaptive(
                                    value: _model.switchValue1 ??= containerUserRow!.notifActive ?? true,
                                    onChanged: (newValue) async {
                                      safeSetState(() => _model.switchValue1 = newValue!);
                                      if (newValue!) {
                                        await UserTable().update(
                                          data: {
                                            'notif_active': true,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'fb_id',
                                            currentUserUid,
                                          ),
                                        );
                                      } else {
                                        await UserTable().update(
                                          data: {
                                            'notif_active': false,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'fb_id',
                                            currentUserUid,
                                          ),
                                        );
                                      }
                                    },
                                    activeColor: Color(0xFF36CF77),
                                    activeTrackColor: Color(0xFF36CF77),
                                    inactiveTrackColor: Color(0x8EE0E3E7),
                                    inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 1.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF302E36),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 56.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Уведомления о подписке',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                    ),
                                  ),
                                  Switch.adaptive(
                                    value: _model.switchValue2 ??= containerUserRow!.notifSup ?? true,
                                    onChanged: (newValue) async {
                                      safeSetState(() => _model.switchValue2 = newValue!);
                                      if (newValue!) {
                                        await UserTable().update(
                                          data: {
                                            'notif_sup': true,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'fb_id',
                                            currentUserUid,
                                          ),
                                        );
                                      } else {
                                        await UserTable().update(
                                          data: {
                                            'notif_sup': false,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'fb_id',
                                            currentUserUid,
                                          ),
                                        );
                                      }
                                    },
                                    activeColor: Color(0xFF36CF77),
                                    activeTrackColor: Color(0xFF36CF77),
                                    inactiveTrackColor: Color(0x8EE0E3E7),
                                    inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 1.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF302E36),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 56.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Напоминать сделать замеры',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                    ),
                                  ),
                                  Switch.adaptive(
                                    value: _model.switchValue3 ??= containerUserRow!.notifMeasure ?? true,
                                    onChanged: (newValue) async {
                                      safeSetState(() => _model.switchValue3 = newValue!);
                                      if (newValue!) {
                                        await UserTable().update(
                                          data: {
                                            'notif_measure': true,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'fb_id',
                                            currentUserUid,
                                          ),
                                        );
                                      } else {
                                        await UserTable().update(
                                          data: {
                                            'notif_measure': false,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'fb_id',
                                            currentUserUid,
                                          ),
                                        );
                                      }
                                    },
                                    activeColor: Color(0xFF36CF77),
                                    activeTrackColor: Color(0xFF36CF77),
                                    inactiveTrackColor: Color(0x8EE0E3E7),
                                    inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 1.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF302E36),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 56.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Новости и обновления',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                    ),
                                  ),
                                  Switch.adaptive(
                                    value: _model.switchValue4 ??= containerUserRow!.notifNews ?? true,
                                    onChanged: (newValue) async {
                                      safeSetState(() => _model.switchValue4 = newValue!);
                                      if (newValue!) {
                                        await UserTable().update(
                                          data: {
                                            'notif_news': true,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'fb_id',
                                            currentUserUid,
                                          ),
                                        );
                                      } else {
                                        await UserTable().update(
                                          data: {
                                            'notif_news': false,
                                          },
                                          matchingRows: (rows) => rows.eqOrNull(
                                            'fb_id',
                                            currentUserUid,
                                          ),
                                        );
                                      }
                                    },
                                    activeColor: Color(0xFF36CF77),
                                    activeTrackColor: Color(0xFF36CF77),
                                    inactiveTrackColor: Color(0x8EE0E3E7),
                                    inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
