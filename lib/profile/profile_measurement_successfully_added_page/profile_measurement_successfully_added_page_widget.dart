import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_measurement_successfully_added_page_model.dart';
export 'profile_measurement_successfully_added_page_model.dart';

class ProfileMeasurementSuccessfullyAddedPageWidget extends StatefulWidget {
  const ProfileMeasurementSuccessfullyAddedPageWidget({super.key});

  @override
  State<ProfileMeasurementSuccessfullyAddedPageWidget> createState() =>
      _ProfileMeasurementSuccessfullyAddedPageWidgetState();
}

class _ProfileMeasurementSuccessfullyAddedPageWidgetState
    extends State<ProfileMeasurementSuccessfullyAddedPageWidget> {
  late ProfileMeasurementSuccessfullyAddedPageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(
        context, () => ProfileMeasurementSuccessfullyAddedPageModel());
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
