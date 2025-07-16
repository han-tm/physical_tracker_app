import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'general_button_model.dart';
export 'general_button_model.dart';

class GeneralButtonWidget extends StatefulWidget {
  const GeneralButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
    bool? isActive,
    Color? backbgoundColor,
    Color? borderColor,
  })  : this.isActive = isActive ?? false,
        this.backbgoundColor = backbgoundColor ?? const Color(0xFFE27B00),
        this.borderColor = borderColor ?? const Color(0xFFE27B00);

  final String? title;
  final Future Function()? onTap;
  final bool isActive;
  final Color backbgoundColor;
  final Color borderColor;

  @override
  State<GeneralButtonWidget> createState() => _GeneralButtonWidgetState();
}

class _GeneralButtonWidgetState extends State<GeneralButtonWidget> {
  late GeneralButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GeneralButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        if (widget!.isActive) {
          await widget.onTap?.call();
        }
      },
      text: widget!.title!,
      options: FFButtonOptions(
        width: double.infinity,
        height: 48.0,
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: widget!.backbgoundColor,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              font: GoogleFonts.unbounded(
                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
              ),
              color: Colors.white,
              fontSize: 15.0,
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: widget!.borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(99.0),
      ),
    );
  }
}
