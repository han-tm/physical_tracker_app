import 'package:boom_client/components/user_weight_view.dart';

import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_weight_view_model.dart';
export 'profile_weight_view_model.dart';

class ProfileWeightViewWidget extends StatefulWidget {
  const ProfileWeightViewWidget({super.key, required this.initValue, required this.onSelect});

  final double initValue;
  final Function(double) onSelect;

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

    _model.weight = widget.initValue;


  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF1A191D),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Вес',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.unbounded(
                  fontWeight: FontWeight.bold,
                  fontStyle:
                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                fontSize: 20.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
                fontStyle:
                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                decoration: const BoxDecoration(
                  color: Color(0xFF302E36),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0x00FFFFFF),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: const Color(0xFF302E36),
                    width: 1.0,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UserWeightViewWidget(
                        initValue: widget.initValue,
                        onSelect: (value) {
                          _model.weight = value;
                          setState(() {});
                        }
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: wrapWithModel(
                model: _model.generalButtonModel,
                updateCallback: () => safeSetState(() {}),
                child: GeneralButtonWidget(
                  title: 'Сохранить',
                  isActive: _model.weight != null,
                  onTap: () async {
                    widget.onSelect(_model.weight!);
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
