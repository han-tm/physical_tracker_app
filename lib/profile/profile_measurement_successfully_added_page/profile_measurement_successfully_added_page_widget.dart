import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SvgPicture.asset(
                'assets/images/payment_success.svg',
                width: 48.0,
                height: 48.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Text(
                'Новый замер добавлен!',
                textAlign: TextAlign.center,
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
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Text(
                'Можете посмотреть свой прогресс в статистике замеров',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                    FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                    FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0.0,
                  fontWeight:
                  FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle:
                  FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: wrapWithModel(
                model: _model.generalButtonModel,
                updateCallback: () => safeSetState(() {}),
                child: GeneralButtonWidget(
                  title: 'Продолжить',
                  isActive: true,
                  onTap: () async {
                    Navigator.pop(context, true);
                    context.safePop();
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
