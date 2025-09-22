import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_notifications_settings_view_widget.dart'
    show ProfileNotificationsSettingsViewWidget;
import 'package:flutter/material.dart';

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
