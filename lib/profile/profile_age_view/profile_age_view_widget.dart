import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_age_view_model.dart';
export 'profile_age_view_model.dart';

class ProfileAgeViewWidget extends StatefulWidget {
  const ProfileAgeViewWidget({super.key});

  @override
  State<ProfileAgeViewWidget> createState() => _ProfileAgeViewWidgetState();
}

class _ProfileAgeViewWidgetState extends State<ProfileAgeViewWidget> {
  late ProfileAgeViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileAgeViewModel());
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
