import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_gender_view_model.dart';
export 'profile_gender_view_model.dart';

class ProfileGenderViewWidget extends StatefulWidget {
  const ProfileGenderViewWidget({super.key});

  @override
  State<ProfileGenderViewWidget> createState() =>
      _ProfileGenderViewWidgetState();
}

class _ProfileGenderViewWidgetState extends State<ProfileGenderViewWidget> {
  late ProfileGenderViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileGenderViewModel());
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
