// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class LoadingIndiacator extends StatefulWidget {
  const LoadingIndiacator({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<LoadingIndiacator> createState() => _LoadingIndiacatorState();
}

class _LoadingIndiacatorState extends State<LoadingIndiacator> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width ?? 30,
        height: widget.height ?? 30,
        child: Center(
            child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary)));
  }
}
