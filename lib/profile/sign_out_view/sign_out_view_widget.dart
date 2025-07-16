import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sign_out_view_model.dart';
export 'sign_out_view_model.dart';

class SignOutViewWidget extends StatefulWidget {
  const SignOutViewWidget({super.key});

  @override
  State<SignOutViewWidget> createState() => _SignOutViewWidgetState();
}

class _SignOutViewWidgetState extends State<SignOutViewWidget> {
  late SignOutViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignOutViewModel());
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
