import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/general_button_widget.dart';
import '/components/general_text_field_widget.dart';
import '/components/media_select_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'complete_registration01_page_widget.dart'
    show CompleteRegistration01PageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompleteRegistration01PageModel
    extends FlutterFlowModel<CompleteRegistration01PageWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? image;

  String? name;

  ///  State fields for stateful widgets in this page.

  // Model for generalTextField component.
  late GeneralTextFieldModel generalTextFieldModel;
  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel;

  @override
  void initState(BuildContext context) {
    generalTextFieldModel = createModel(context, () => GeneralTextFieldModel());
    generalButtonModel = createModel(context, () => GeneralButtonModel());
  }

  @override
  void dispose() {
    generalTextFieldModel.dispose();
    generalButtonModel.dispose();
  }
}
