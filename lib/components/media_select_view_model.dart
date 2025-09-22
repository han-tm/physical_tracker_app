// ignore_for_file: non_constant_identifier_names

import '/flutter_flow/flutter_flow_util.dart';
import 'media_select_view_widget.dart' show MediaSelectViewWidget;
import 'package:flutter/material.dart';

class MediaSelectViewModel extends FlutterFlowModel<MediaSelectViewWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading_uploadDataCamera = false;
  FFUploadedFile uploadedLocalFile_uploadDataCamera =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading_uploadDataGallery = false;
  FFUploadedFile uploadedLocalFile_uploadDataGallery =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
