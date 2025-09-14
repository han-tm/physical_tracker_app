import 'package:flutter_svg/flutter_svg.dart';

import '../../userData/PreRegistrationData.dart';
import '../../userData/PreRegistrationStorage.dart';
import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/survery/skip_personalization/skip_personalization_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserWeightViewWidget extends StatefulWidget {
  const UserWeightViewWidget({super.key, required this.initValue, required this.onSelect});

  final double initValue;
  final Function(double) onSelect;

  @override
  State<UserWeightViewWidget> createState() => _UserWeightViewWidgetState();
}

class _UserWeightViewWidgetState extends State<UserWeightViewWidget> {

  double? sliderValue;
  late FixedExtentScrollController scrollController;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
      sliderValue = widget.initValue;
      scrollController = FixedExtentScrollController(initialItem: sliderValue!.toInt()-20);
    }));
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 120,
            child: RotatedBox(
              quarterTurns: -1,
              child: ListWheelScrollView.useDelegate(
                controller: scrollController,
                itemExtent: 65,
                physics: const FixedExtentScrollPhysics(),
                onSelectedItemChanged: (index) {
                  final newValue = index + 20; // от 20 до 150 кг
                  setState(() {
                    sliderValue = newValue.toDouble();
                    if (sliderValue != null) {
                      widget.onSelect(sliderValue!);
                    }
                  });
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: 131, // 150 - 20 + 1
                  builder: (context, index) {
                    final value = index + 20;
                    final isSelected = sliderValue?.round() == value;
                    return RotatedBox(
                      quarterTurns: 1,
                      child: Center(
                        child: Container(
                          height: 150,
                          // color: Colors.red,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: isSelected?0:15),
                              Text(
                                '$value',
                                style: TextStyle(
                                  fontSize: isSelected ? 32 : 12,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  color: isSelected
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).secondaryText,
                                ),
                              ),
                              SizedBox(height: isSelected?4:25),
                              Container(
                                width: 2,
                                height: value % 5 == 0 ? 54 : 32,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).secondaryText.withOpacity(0.6),
                                  borderRadius: BorderRadius.circular(1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Кг',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
