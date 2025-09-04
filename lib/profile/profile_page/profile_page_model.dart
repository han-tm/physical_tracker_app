import '../../backend/supabase/database/tables/subscription.dart';
import '../../backend/supabase/database/tables/user.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {

  Stream<List<UserRow>>? containerSupabaseStream1;
  Stream<List<SubscriptionRow>>? containerSupabaseStream2;
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
