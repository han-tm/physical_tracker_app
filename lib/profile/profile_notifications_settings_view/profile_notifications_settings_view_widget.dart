import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_notifications_settings_view_model.dart';
export 'profile_notifications_settings_view_model.dart';

class ProfileNotificationsSettingsViewWidget extends StatefulWidget {
  const ProfileNotificationsSettingsViewWidget({super.key});

  @override
  State<ProfileNotificationsSettingsViewWidget> createState() =>
      _ProfileNotificationsSettingsViewWidgetState();
}

class _ProfileNotificationsSettingsViewWidgetState
    extends State<ProfileNotificationsSettingsViewWidget> {
  late ProfileNotificationsSettingsViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => ProfileNotificationsSettingsViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
