import '../food_page/food_page_widget.dart';
import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'food_kbzu_summary_view_model.dart';
export 'food_kbzu_summary_view_model.dart';

class FoodKbzuSummaryViewWidget extends StatefulWidget {
  final Map<String, dynamic>? kbzu;
  const FoodKbzuSummaryViewWidget({super.key, this.kbzu});

  @override
  State<FoodKbzuSummaryViewWidget> createState() => _FoodKbzuSummaryViewWidgetState();
}

class _FoodKbzuSummaryViewWidgetState extends State<FoodKbzuSummaryViewWidget> {
  late FoodKbzuSummaryViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodKbzuSummaryViewModel());

    _model.kbzu = widget.kbzu;
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final kcal = '${_model.kbzu?['kcal_target'] ?? 0}';
    final carbs = '${_model.kbzu?['carbs_target'] ?? 0}';
    final fats = '${_model.kbzu?['fats_target'] ?? 0}';
    final proteins = '${_model.kbzu?['proteins_target'] ?? 0}';

    print((_model.kbzu?['proteins_target'] ?? 0.0));
    print((_model.kbzu?['carbs_target'] ?? 0.0));
    print((_model.kbzu?['fats_target'] ?? 0.0));
    
    final double proteinsDouble = ((_model.kbzu?['proteins_target'] ?? 0.0) as int).toDouble();
    final double carbsDouble = ((_model.kbzu?['carbs_target'] ?? 0.0) as int).toDouble();
    final double fatsDouble = ((_model.kbzu?['fats_target'] ?? 0.0) as int).toDouble();
    final double sum = (proteinsDouble + carbsDouble + fatsDouble);

    int proteinsInt = ((proteinsDouble / sum) * 100).toInt();
    int carbsInt = ((carbsDouble / sum) * 100).toInt();
    int fatsInt = ((fatsDouble / sum) * 100).toInt();

    print("proteinsInt: $proteinsInt");
    print("carbsInt: $carbsInt");
    print("fatsInt: $fatsInt");

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF121214),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Container(
                //   width: 40.0,
                //   height: 40.0,
                //   decoration: BoxDecoration(
                //     color: FlutterFlowTheme.of(context).secondary,
                //     borderRadius: BorderRadius.circular(16.0),
                //   ),
                //   child: InkWell(
                //     onTap: () {
                //       Navigator.of(context).pop();
                //     },
                //     child: Align(
                //       alignment: AlignmentDirectional(0.0, 0.0),
                //       child: Icon(
                //         Icons.arrow_back_ios_new_sharp,
                //         color: FlutterFlowTheme.of(context).primaryText,
                //         size: 20.0,
                //       ),
                //     ),
                //   ),
                // ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Ваша норма КБЖУ',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.unbounded(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Дневная норма',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.unbounded(
                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 13.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                      ),
                      const Divider(
                        height: 24,
                        color: Color(0xFF302E36),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0x1EE27B00),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 4.0, 12.0),
                                  child: Text(
                                    kcal,
                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                          font: GoogleFonts.unbounded(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context).primary,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              Text(
                                'ккал',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).primary,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              height: 64,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0x1F4DEEBD),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      '$proteins г',
                                      maxLines: 1,
                                      minFontSize: 1.0,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.unbounded(
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            color: const Color(0xFF4DEEBD),
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                    ),
                                    AutoSizeText(
                                      'белка',
                                      maxLines: 1,
                                      minFontSize: 5.0,
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            color: const Color(0xFF4DEEBD),
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 64,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0x24FF6B78),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      '$fats г',
                                      maxLines: 1,
                                      minFontSize: 1.0,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.unbounded(
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            color: const Color(0xFFFF6B78),
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                    ),
                                    AutoSizeText(
                                      'жиров',
                                      maxLines: 1,
                                      minFontSize: 5.0,
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            color: const Color(0xFFFF6B78),
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 64,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0x1EE27B00),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      '$carbs г',
                                      maxLines: 1,
                                      minFontSize: 1.0,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.unbounded(
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            color: const Color(0xFFFFD166),
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                    ),
                                    AutoSizeText(
                                      'углеводов',
                                      maxLines: 1,
                                      minFontSize: 5.0,
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            color: const Color(0xFFFFD166),
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 5.0)),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 12.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: proteinsInt,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF4DEEBD),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(100.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(100.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: fatsInt,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFF6B78),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: carbsInt,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFD166),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(100.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(100.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: Text(
                          'Расчет основан на ваших параметрах и уровне активности. Для более точных рекомендаций воспользуйтесь ИИ-нутрициологом.',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
              child: wrapWithModel(
                model: _model.generalButtonModel1,
                updateCallback: () => safeSetState(() {}),
                child: GeneralButtonWidget(
                  title: 'Получить план питания от ИИ',
                  isActive: true,
                  onTap: () async {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: wrapWithModel(
                model: _model.generalButtonModel2,
                updateCallback: () => safeSetState(() {}),
                child: GeneralButtonWidget(
                  title: 'Продолжить ',
                  isActive: true,
                  backbgoundColor: Colors.transparent,
                  borderColor: const Color(0xFF302E36),
                  onTap: () async {
                    context.goNamed(
                      FoodPageWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
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
