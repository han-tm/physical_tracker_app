import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_height_view_model.dart';
export 'profile_height_view_model.dart';

class ProfileHeightViewWidget extends StatefulWidget {
  const ProfileHeightViewWidget({super.key});

  @override
  State<ProfileHeightViewWidget> createState() =>
      _ProfileHeightViewWidgetState();
}

class _ProfileHeightViewWidgetState extends State<ProfileHeightViewWidget> {
  late ProfileHeightViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileHeightViewModel());
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
