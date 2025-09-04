import 'package:boom_client/flutter_flow/size_utils.dart';
import 'package:boom_client/flutter_flow/theme_helper.dart';
import 'package:flutter/material.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper2 {
  static TextStyleHelper2? _instance;

  TextStyleHelper2._();

  static TextStyleHelper2 get instance {
    _instance ??= TextStyleHelper2._();
    return _instance!;
  }

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get title20Bold => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w700,
        color: appTheme.colorFFF2F2,
      );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body15SemiBold => TextStyle(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
        color: appTheme.colorFFF2F2,
      );

  TextStyle get body13Regular => TextStyle(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w400,
        color: appTheme.color66FFFF,
      );

  TextStyle get body13SemiBold => TextStyle(
        fontSize: 13.fSize,
        fontWeight: FontWeight.w600,
        color: appTheme.colorFFF2F2,
      );

  TextStyle get body12Medium => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
        color: appTheme.colorFFF2F2,
      );

  // Label Styles
  // Small text styles for labels, captions, and hints

  TextStyle get label11SemiBold => TextStyle(
        fontSize: 11.fSize,
        fontWeight: FontWeight.w600,
        color: appTheme.colorFFF2F2,
      );

  TextStyle get label10SemiBold => TextStyle(
        fontSize: 10.fSize,
        fontWeight: FontWeight.w600,
      );
}
