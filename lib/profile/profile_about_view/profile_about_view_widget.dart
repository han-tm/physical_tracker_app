import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_about_view_model.dart';
export 'profile_about_view_model.dart';

class ProfileAboutViewWidget extends StatefulWidget {
  const ProfileAboutViewWidget({super.key});

  @override
  State<ProfileAboutViewWidget> createState() => _ProfileAboutViewWidgetState();
}

class _ProfileAboutViewWidgetState extends State<ProfileAboutViewWidget> {
  late ProfileAboutViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileAboutViewModel());
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
