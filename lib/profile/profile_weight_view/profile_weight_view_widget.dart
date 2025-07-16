import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_weight_view_model.dart';
export 'profile_weight_view_model.dart';

class ProfileWeightViewWidget extends StatefulWidget {
  const ProfileWeightViewWidget({super.key});

  @override
  State<ProfileWeightViewWidget> createState() =>
      _ProfileWeightViewWidgetState();
}

class _ProfileWeightViewWidgetState extends State<ProfileWeightViewWidget> {
  late ProfileWeightViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileWeightViewModel());
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
