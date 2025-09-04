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

class UserHeightViewWidget extends StatefulWidget {
  const UserHeightViewWidget({super.key, required this.initValue, required this.onSelect});

  final double initValue;
  final Function(double) onSelect;

  @override
  State<UserHeightViewWidget> createState() => _UserHeightViewWidgetState();
}

class _UserHeightViewWidgetState extends State<UserHeightViewWidget> {

  double? sliderValue;

  @override
  void initState() {
    super.initState();
    sliderValue = widget.initValue;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {

    }));
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Больше высота слайдера
      child: Row(
        // alignment: Alignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
          ),
          Container(
            height: 300,
            width: 100,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 40,
              diameterRatio: 1.1,
              perspective: 0.002,
              physics: const FixedExtentScrollPhysics(),
              // Устанавливаем начальный индекс на 150 - 100 = 50
              controller: FixedExtentScrollController(initialItem: (sliderValue?.toInt() ?? 150) - 100),
              onSelectedItemChanged: (index) {
                final newValue = index + 100;
                setState(() {
                  sliderValue = newValue.toDouble();
                  if (sliderValue != null) {
                    widget.onSelect(sliderValue!);
                  }

                });
              },
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 151,
                builder: (context, index) {
                  final value = index + 100;
                  final isSelected = sliderValue?.round() == value;
                  return Center(
                    child: Text(
                      '$value',
                      style: TextStyle(
                        fontSize: isSelected ? 34 : 20,
                        fontWeight: FontWeight.bold,
                        color: isSelected
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText.withOpacity(0.8),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            width: 50,
            child: Text(
              'см',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
