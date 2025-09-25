import 'package:flutter_svg/svg.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'media_select_view_model.dart';
export 'media_select_view_model.dart';

class MediaSelectViewWidget extends StatefulWidget {
  const MediaSelectViewWidget({
    super.key,
    required this.onMediaSelect,
  });

  final Function(FFUploadedFile media)? onMediaSelect;

  @override
  State<MediaSelectViewWidget> createState() => _MediaSelectViewWidgetState();
}

class _MediaSelectViewWidgetState extends State<MediaSelectViewWidget> {
  late MediaSelectViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MediaSelectViewModel());
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Загрузка фотографии',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.unbounded(
                      fontWeight: FontWeight.bold,
                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        final selectedMedia = await selectMedia(
                          multiImage: false,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                          safeSetState(() => _model.isDataUploading_uploadDataCamera = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                        

                          try {
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                    ))
                                .toList();
                          } finally {
                            _model.isDataUploading_uploadDataCamera = false;
                          }
                          if (selectedUploadedFiles.length == selectedMedia.length) {
                            safeSetState(() {
                              _model.uploadedLocalFile_uploadDataCamera = selectedUploadedFiles.first;
                            });
                          } else {
                            safeSetState(() {});
                            return;
                          }

                          if (mounted) {
                            widget.onMediaSelect?.call(
                              _model.uploadedLocalFile_uploadDataCamera,
                            );
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: Container(
                        width: 100.0,
                        height: 124.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SvgPicture.asset(
                                'assets/images/media_photo.svg',
                                width: 64.0,
                                height: 64.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Камера',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
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
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        final selectedMedia = await selectMedia(
                          mediaSource: MediaSource.photoGallery,
                          multiImage: false,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                          safeSetState(() => _model.isDataUploading_uploadDataGallery = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                            

                          try {
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                      path: m.filePath,
                                    ))
                                .toList();
                          } finally {
                            _model.isDataUploading_uploadDataGallery = false;
                          }
                          if (selectedUploadedFiles.length == selectedMedia.length) {
                            safeSetState(() {
                              _model.uploadedLocalFile_uploadDataGallery = selectedUploadedFiles.first;
                            });
                          } else {
                            safeSetState(() {});
                            return;
                          }

                          if (mounted) {
                             widget.onMediaSelect?.call(
                              _model.uploadedLocalFile_uploadDataGallery,
                            );
                            Navigator.pop(context);
                          }
                        }
                      },
                      child: Container(
                        width: 100.0,
                        height: 124.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SvgPicture.asset(
                                'assets/images/media_gallery.svg',
                                width: 64.0,
                                height: 64.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Галерея',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                      ),
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
                ].divide(const SizedBox(width: 8.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
