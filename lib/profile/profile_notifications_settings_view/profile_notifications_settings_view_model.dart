import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'profile_notifications_settings_view_widget.dart'
    show ProfileNotificationsSettingsViewWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileNotificationsSettingsViewModel
    extends FlutterFlowModel<ProfileNotificationsSettingsViewWidget> {
  ///  State fields for stateful widgets in this component.

  Stream<List<UserRow>>? containerSupabaseStream;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for Switch widget.
  bool? switchValue4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
