import 'package:flutter_svg/svg.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'radio_button_model.dart';
export 'radio_button_model.dart';

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({
    super.key,
    bool? checked,
  }) : checked = checked ?? false;

  final bool checked;

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  late RadioButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (!widget.checked)
          ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: SvgPicture.asset(
              'assets/images/radio_unselected.svg',
              width: 20.0,
              height: 20.0,
              fit: BoxFit.cover,
            ),
          ),
        if (widget.checked)
          ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: SvgPicture.asset(
              'assets/images/radio_selected.svg',
              width: 20.0,
              height: 20.0,
              fit: BoxFit.cover,
            ),
          ),
      ],
    );
  }
}
