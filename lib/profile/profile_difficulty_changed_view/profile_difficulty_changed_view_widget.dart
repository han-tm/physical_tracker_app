import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_difficulty_changed_view_model.dart';
export 'profile_difficulty_changed_view_model.dart';

class ProfileDifficultyChangedViewWidget extends StatefulWidget {
  const ProfileDifficultyChangedViewWidget({super.key});

  @override
  State<ProfileDifficultyChangedViewWidget> createState() =>
      _ProfileDifficultyChangedViewWidgetState();
}

class _ProfileDifficultyChangedViewWidgetState
    extends State<ProfileDifficultyChangedViewWidget> {
  late ProfileDifficultyChangedViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileDifficultyChangedViewModel());
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
