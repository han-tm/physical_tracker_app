import '/auth/firebase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/general_button_widget.dart';
import '/components/general_nav_bar01_widget.dart';
import '/components/media_select_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/profile/profile_measurement_successfully_added_page/profile_measurement_successfully_added_page_widget.dart';
import '/profile/profile_weight_view/profile_weight_view_widget.dart';
import 'dart:ui';
import 'profile_measurement_add_page_widget.dart'
    show ProfileMeasurementAddPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileMeasurementAddPageModel
    extends FlutterFlowModel<ProfileMeasurementAddPageWidget> {
  ///  Local state fields for this page.

  double? weight;

  double? shoulderGirth;

  double? chestGirth;

  double? waistGirth;

  double? abdomenGirth;

  double? thighGirth;

  double? hipsGirth;

  FFUploadedFile? photo01;

  FFUploadedFile? photo02;

  FFUploadedFile? photo03;

  ///  State fields for stateful widgets in this page.

  // Model for generalNavBar01 component.
  late GeneralNavBar01Model generalNavBar01Model;
  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel;
  bool isDataUploading_uploadDataPhoto01 = false;
  FFUploadedFile uploadedLocalFile_uploadDataPhoto01 = FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataPhoto01 = '';

  FFUploadedFile uploadedLocalFile_uploadDataPhoto02 = FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataPhoto02 = '';

  FFUploadedFile uploadedLocalFile_uploadDataPhoto03 = FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataPhoto03 = '';

  @override
  void initState(BuildContext context) {
    generalNavBar01Model = createModel(context, () => GeneralNavBar01Model());
    generalButtonModel = createModel(context, () => GeneralButtonModel());
  }

  @override
  void dispose() {
    generalNavBar01Model.dispose();
    generalButtonModel.dispose();
  }
}
