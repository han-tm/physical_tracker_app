// import 'package:easy_debounce/easy_debounce.dart';
// import 'package:flutter/services.dart';
//
// import '/backend/schema/structs/index.dart';
// import '/backend/supabase/supabase.dart';
// import '/components/general_button_widget.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_video_player.dart';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'measure_add_view_model.dart';
// export 'measure_add_view_model.dart';
//
// class MeasureAddViewWidget extends StatefulWidget {
//   const MeasureAddViewWidget({
//     super.key,
//     required this.measureRow,
//     required this.userBodyMeasure,
//     required this.onValueSave,
//   });
//
//   final BodyMeasureRow? measureRow;
//   final UserBodyMeasureStruct? userBodyMeasure;
//   final Future Function(double value)? onValueSave;
//
//   @override
//   State<MeasureAddViewWidget> createState() => _MeasureAddViewWidgetState();
// }
//
// class _MeasureAddViewWidgetState extends State<MeasureAddViewWidget> {
//   late MeasureAddViewModel _model;
//
//   @override
//   void setState(VoidCallback callback) {
//     super.setState(callback);
//     _model.onUpdate();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => MeasureAddViewModel());
//
//     _model.textController ??=
//         TextEditingController(text: widget!.userBodyMeasure?.value?.toString());
//     _model.textFieldFocusNode ??= FocusNode();
//   }
//
//   @override
//   void dispose() {
//     _model.maybeDispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Color(0xFF1A191D),
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(0.0),
//           bottomRight: Radius.circular(0.0),
//           topLeft: Radius.circular(16.0),
//           topRight: Radius.circular(16.0),
//         ),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               valueOrDefault<String>(
//                 widget!.measureRow?.name,
//                 '-',
//               ),
//               style: FlutterFlowTheme.of(context).bodyMedium.override(
//                     font: GoogleFonts.unbounded(
//                       fontWeight: FontWeight.bold,
//                       fontStyle:
//                           FlutterFlowTheme.of(context).bodyMedium.fontStyle,
//                     ),
//                     fontSize: 20.0,
//                     letterSpacing: 0.0,
//                     fontWeight: FontWeight.bold,
//                     fontStyle:
//                         FlutterFlowTheme.of(context).bodyMedium.fontStyle,
//                   ),
//             ),
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
//               child: Text(
//                 valueOrDefault<String>(
//                   widget!.measureRow?.description,
//                   '-',
//                 ),
//                 style: FlutterFlowTheme.of(context).bodyMedium.override(
//                       font: GoogleFonts.inter(
//                         fontWeight:
//                             FlutterFlowTheme.of(context).bodyMedium.fontWeight,
//                         fontStyle:
//                             FlutterFlowTheme.of(context).bodyMedium.fontStyle,
//                       ),
//                       color: FlutterFlowTheme.of(context).secondaryText,
//                       fontSize: 15.0,
//                       letterSpacing: 0.0,
//                       fontWeight:
//                           FlutterFlowTheme.of(context).bodyMedium.fontWeight,
//                       fontStyle:
//                           FlutterFlowTheme.of(context).bodyMedium.fontStyle,
//                     ),
//               ),
//             ),
//             if (widget!.measureRow!.video != null)
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
//                 child: Container(
//                   width: double.infinity,
//                   height: 196.0,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16.0),
//                   ),
//                   child: FlutterFlowVideoPlayer(
//                     path: widget!.measureRow!.video!,
//                     videoType: VideoType.network,
//                     width: double.infinity,
//                     height: double.infinity,
//                     autoPlay: false,
//                     looping: true,
//                     showControls: false,
//                     allowFullScreen: true,
//                     allowPlaybackSpeedMenu: false,
//                   ),
//                 ),
//               ),
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
//               child: Text(
//                 valueOrDefault<String>(
//                   widget!.measureRow?.name,
//                   '-',
//                 ),
//                 style: FlutterFlowTheme.of(context).bodyMedium.override(
//                       font: GoogleFonts.inter(
//                         fontWeight:
//                             FlutterFlowTheme.of(context).bodyMedium.fontWeight,
//                         fontStyle:
//                             FlutterFlowTheme.of(context).bodyMedium.fontStyle,
//                       ),
//                       color: FlutterFlowTheme.of(context).secondaryText,
//                       fontSize: 12.0,
//                       letterSpacing: 0.0,
//                       fontWeight:
//                           FlutterFlowTheme.of(context).bodyMedium.fontWeight,
//                       fontStyle:
//                           FlutterFlowTheme.of(context).bodyMedium.fontStyle,
//                     ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
//               child: Container(
//                 width: double.infinity,
//                 child: TextFormField(
//                   controller: _model.textController,
//                   focusNode: _model.textFieldFocusNode,
//                   autofocus: false,
//                   obscureText: false,
//                   onChanged: (_) => EasyDebounce.debounce(
//                     '_model.textController',
//                     Duration(milliseconds: 100),
//                         () async {
//                       setState(() {});
//                     },
//                   ),
//                   keyboardType: TextInputType.numberWithOptions(decimal: true),
//                   // inputFormatters: [
//                   //   FilteringTextInputFormatter.allow(RegExp(r'^\d{0,3}([.,]\d{0,2})?$')),
//                   // ],
//                   inputFormatters: [
//                     LengthLimitingDecimalFormatter(),
//                   ],
//                   decoration: InputDecoration(
//                     isDense: true,
//                     labelStyle:
//                         FlutterFlowTheme.of(context).labelMedium.override(
//                               font: GoogleFonts.unbounded(
//                                 fontWeight: FlutterFlowTheme.of(context)
//                                     .labelMedium
//                                     .fontWeight,
//                                 fontStyle: FlutterFlowTheme.of(context)
//                                     .labelMedium
//                                     .fontStyle,
//                               ),
//                               letterSpacing: 0.0,
//                               fontWeight: FlutterFlowTheme.of(context)
//                                   .labelMedium
//                                   .fontWeight,
//                               fontStyle: FlutterFlowTheme.of(context)
//                                   .labelMedium
//                                   .fontStyle,
//                             ),
//                     hintText: 'Укажите значение',
//                     hintStyle:
//                         FlutterFlowTheme.of(context).labelMedium.override(
//                               font: GoogleFonts.inter(
//                                 fontWeight: FlutterFlowTheme.of(context)
//                                     .labelMedium
//                                     .fontWeight,
//                                 fontStyle: FlutterFlowTheme.of(context)
//                                     .labelMedium
//                                     .fontStyle,
//                               ),
//                               fontSize: 15.0,
//                               letterSpacing: 0.0,
//                               fontWeight: FlutterFlowTheme.of(context)
//                                   .labelMedium
//                                   .fontWeight,
//                               fontStyle: FlutterFlowTheme.of(context)
//                                   .labelMedium
//                                   .fontStyle,
//                             ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: (_model.textFieldFocusNode?.hasFocus ?? false)
//                             ? Color(0xFFE27B00)
//                             : FlutterFlowTheme.of(context).secondary,
//                         width: 1.0,
//                       ),
//                       borderRadius: BorderRadius.circular(16.0),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: FlutterFlowTheme.of(context).primary,
//                         width: 1.0,
//                       ),
//                       borderRadius: BorderRadius.circular(16.0),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: FlutterFlowTheme.of(context).error,
//                         width: 1.0,
//                       ),
//                       borderRadius: BorderRadius.circular(16.0),
//                     ),
//                     focusedErrorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: FlutterFlowTheme.of(context).error,
//                         width: 1.0,
//                       ),
//                       borderRadius: BorderRadius.circular(16.0),
//                     ),
//                     filled: true,
//                     fillColor: (_model.textFieldFocusNode?.hasFocus ?? false)
//                         ? Color(0x1EE27B00)
//                         : FlutterFlowTheme.of(context).secondary,
//                     suffixIcon: Padding(
//                       padding: const EdgeInsets.only(right: 8.0),
//                       child: Container(
//                         width: 40, height: 40,
//                         // color: Colors.red,
//                         child: Center(
//                           child: Text(
//                             'см',
//                             style: FlutterFlowTheme.of(context).labelMedium.override(
//                               font: GoogleFonts.unbounded(),
//                               color: FlutterFlowTheme.of(context).secondaryText,
//                               fontSize: 15
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   style: FlutterFlowTheme.of(context).bodyMedium.override(
//                         font: GoogleFonts.unbounded(
//                           fontWeight: FlutterFlowTheme.of(context)
//                               .bodyMedium
//                               .fontWeight,
//                           fontStyle:
//                               FlutterFlowTheme.of(context).bodyMedium.fontStyle,
//                         ),
//                         letterSpacing: 0.0,
//                         fontWeight:
//                             FlutterFlowTheme.of(context).bodyMedium.fontWeight,
//                         fontStyle:
//                             FlutterFlowTheme.of(context).bodyMedium.fontStyle,
//                       ),
//                   cursorColor: FlutterFlowTheme.of(context).primaryText,
//                   validator:
//                       _model.textControllerValidator.asValidator(context),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
//               child: wrapWithModel(
//                 model: _model.generalButtonModel,
//                 updateCallback: () => safeSetState(() {}),
//                 child: GeneralButtonWidget(
//                   title: 'Сохранить',
//                   isActive: _model.textController.text != null &&
//                       _model.textController.text != '',
//                   onTap: () async {
//                     await widget.onValueSave?.call(
//                       double.parse(_model.textController.text),
//                     );
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class LengthLimitingDecimalFormatter extends TextInputFormatter {
//   final int maxDigitsBeforeDecimal;
//   final int maxDigitsAfterDecimal;
//
//   LengthLimitingDecimalFormatter({
//     this.maxDigitsBeforeDecimal = 3,
//     this.maxDigitsAfterDecimal = 2,
//   });
//
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue,
//       TextEditingValue newValue,
//       ) {
//     final text = newValue.text.replaceAll(',', '.');
//
//     final parts = text.split('.');
//     final beforeDecimal = parts[0];
//     final afterDecimal = parts.length > 1 ? parts[1] : '';
//
//     if (beforeDecimal.length > maxDigitsBeforeDecimal ||
//         afterDecimal.length > maxDigitsAfterDecimal) {
//       return oldValue;
//     }
//
//     // only allow valid number characters (digits + optional dot)
//     if (!RegExp(r'^\d{0,3}(\.\d{0,2})?$').hasMatch(text) && text.isNotEmpty) {
//       return oldValue;
//     }
//
//     return newValue;
//   }
// }

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../backend/supabase/database/tables/body_measure.dart';
import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'measure_add_view_model.dart';
export 'measure_add_view_model.dart';

class MeasureAddViewWidget extends StatefulWidget {
  const MeasureAddViewWidget({
    super.key,
    required this.measureRow,
    required this.initialValue,
    required this.onValueSave,
  });

  final BodyMeasureRow? measureRow;
  final double? initialValue;
  final Future Function(double value)? onValueSave;

  @override
  State<MeasureAddViewWidget> createState() => _MeasureAddViewWidgetState();
}

class _MeasureAddViewWidgetState extends State<MeasureAddViewWidget> {
  late MeasureAddViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeasureAddViewModel());

    _model.textController ??= TextEditingController(
      text: widget.initialValue != null
          ? (widget.initialValue! % 1 == 0
          ? widget.initialValue!.toInt().toString()
          : widget.initialValue!.toStringAsFixed(1))
          : '',
    );
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1A191D),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              valueOrDefault<String>(
                widget!.measureRow?.name,
                '-',
              ),
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
            if (widget.measureRow?.description != null)
              Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Text(
                  widget.measureRow!.description!,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(),
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 15.0,
                  ),
                ),
              ),
            if (widget.measureRow?.video != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: FlutterFlowVideoPlayer(
                    path: widget.measureRow!.video!,
                    videoType: VideoType.network,
                    width: double.infinity,
                    height: 196.0,
                    autoPlay: false,
                    looping: false,
                    showControls: true,
                    allowFullScreen: true,
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [LengthLimitingDecimalFormatter()],
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController',
                  Duration(milliseconds: 100),
                      () => setState(() {}),
                ),
                decoration: InputDecoration(
                  isDense: true,
                  labelStyle:
                  FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.unbounded(
                      fontWeight: FlutterFlowTheme.of(context)
                          .labelMedium
                          .fontWeight,
                      fontStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight: FlutterFlowTheme.of(context)
                        .labelMedium
                        .fontWeight,
                    fontStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .fontStyle,
                  ),
                  hintText: 'Укажите значение',
                  hintStyle:
                  FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight: FlutterFlowTheme.of(context)
                          .labelMedium
                          .fontWeight,
                      fontStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .fontStyle,
                    ),
                    fontSize: 15.0,
                    letterSpacing: 0.0,
                    fontWeight: FlutterFlowTheme.of(context)
                        .labelMedium
                        .fontWeight,
                    fontStyle: FlutterFlowTheme.of(context)
                        .labelMedium
                        .fontStyle,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: (_model.textFieldFocusNode?.hasFocus ?? false)
                          ? Color(0xFFE27B00)
                          : FlutterFlowTheme.of(context).secondary,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primary,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  filled: true,
                  fillColor: (_model.textFieldFocusNode?.hasFocus ?? false)
                      ? Color(0x1EE27B00)
                      : FlutterFlowTheme.of(context).secondary,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      width: 40, height: 40,
                      // color: Colors.red,
                      child: Center(
                        child: Text(
                          'см',
                          style: FlutterFlowTheme.of(context).labelMedium.override(
                              font: GoogleFonts.unbounded(),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 15
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.unbounded(),
                ),
                cursorColor: FlutterFlowTheme.of(context).primaryText,
                validator:
                _model.textControllerValidator.asValidator(context),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: wrapWithModel(
                model: _model.generalButtonModel,
                updateCallback: () => setState(() {}),
                child: GeneralButtonWidget(
                  title: 'Сохранить',
                  isActive: _model.textController.text.isNotEmpty,
                  onTap: () async {
                    final parsedValue = double.tryParse(
                        _model.textController.text.replaceAll(',', '.'));
                    if (parsedValue != null) {
                      await widget.onValueSave?.call(parsedValue);
                      Navigator.pop(context);
                    }
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

class LengthLimitingDecimalFormatter extends TextInputFormatter {
  final int maxDigitsBeforeDecimal;
  final int maxDigitsAfterDecimal;

  LengthLimitingDecimalFormatter({
    this.maxDigitsBeforeDecimal = 3,
    this.maxDigitsAfterDecimal = 2,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final text = newValue.text.replaceAll(',', '.');

    final parts = text.split('.');
    final beforeDecimal = parts[0];
    final afterDecimal = parts.length > 1 ? parts[1] : '';

    final isValid = RegExp(r'^\d{0,3}(\.\d{0,2})?$').hasMatch(text);

    if (beforeDecimal.length > maxDigitsBeforeDecimal ||
        afterDecimal.length > maxDigitsAfterDecimal ||
        (!isValid && text.isNotEmpty)) {
      return oldValue;
    }

    return newValue.copyWith(text: text);
  }
}