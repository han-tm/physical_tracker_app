// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
// Imports other custom widgets
// Imports custom functions
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
    return SizedBox(
        width: widget.width ?? 30,
        height: widget.height ?? 30,
        child: Center(
            child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary)));
  }
}
