// ignore_for_file: non_constant_identifier_names, unnecessary_getters_setters

import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _obboardingShown = prefs.getBool('ff_obboardingShown') ?? _obboardingShown;
    });
    _safeInit(() {
      _surveyShown = prefs.getBool('ff_surveyShown') ?? _surveyShown;
    });
    _safeInit(() {
      _UserBodyMeasures = prefs
              .getStringList('ff_UserBodyMeasures')
              ?.map((x) {
                try {
                  return UserBodyMeasureStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _UserBodyMeasures;
    });
    _safeInit(() {
      _regCompleted = prefs.getBool('ff_regCompleted') ?? _regCompleted;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _obboardingShown = false;
  bool get obboardingShown => _obboardingShown;
  set obboardingShown(bool value) {
    _obboardingShown = value;
    prefs.setBool('ff_obboardingShown', value);
  }

  bool _surveyShown = false;
  bool get surveyShown => _surveyShown;
  set surveyShown(bool value) {
    _surveyShown = value;
    prefs.setBool('ff_surveyShown', value);
  }

  List<UserBodyMeasureStruct> _UserBodyMeasures = [];
  List<UserBodyMeasureStruct> get UserBodyMeasures => _UserBodyMeasures;
  set UserBodyMeasures(List<UserBodyMeasureStruct> value) {
    _UserBodyMeasures = value;
    prefs.setStringList('ff_UserBodyMeasures', value.map((x) => x.serialize()).toList());
  }

  void addToUserBodyMeasures(UserBodyMeasureStruct value) {
    UserBodyMeasures.add(value);
    prefs.setStringList('ff_UserBodyMeasures', _UserBodyMeasures.map((x) => x.serialize()).toList());
  }

  void removeFromUserBodyMeasures(UserBodyMeasureStruct value) {
    UserBodyMeasures.remove(value);
    prefs.setStringList('ff_UserBodyMeasures', _UserBodyMeasures.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromUserBodyMeasures(int index) {
    UserBodyMeasures.removeAt(index);
    prefs.setStringList('ff_UserBodyMeasures', _UserBodyMeasures.map((x) => x.serialize()).toList());
  }

  void updateUserBodyMeasuresAtIndex(
    int index,
    UserBodyMeasureStruct Function(UserBodyMeasureStruct) updateFn,
  ) {
    UserBodyMeasures[index] = updateFn(_UserBodyMeasures[index]);
    prefs.setStringList('ff_UserBodyMeasures', _UserBodyMeasures.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInUserBodyMeasures(int index, UserBodyMeasureStruct value) {
    UserBodyMeasures.insert(index, value);
    prefs.setStringList('ff_UserBodyMeasures', _UserBodyMeasures.map((x) => x.serialize()).toList());
  }

  bool _regCompleted = false;
  bool get regCompleted => _regCompleted;
  set regCompleted(bool value) {
    _regCompleted = value;
    prefs.setBool('ff_regCompleted', value);
  }

  double? _shoulderGirth;
  double? get shoulderGirth => _shoulderGirth;
  set shoulderGirth(double? value) {
    _shoulderGirth = value;
  }

  double? _chestGirth;
  double? get chestGirth => _chestGirth;
  set chestGirth(double? value) {
    _chestGirth = value;
  }

  double? _waistGirth;
  double? get waistGirth => _waistGirth;
  set waistGirth(double? value) {
    _waistGirth = value;
  }

  double? _abdomenGirth;
  double? get abdomenGirth => _abdomenGirth;
  set abdomenGirth(double? value) {
    _abdomenGirth = value;
  }

  double? _thighGirth;
  double? get thighGirth => _thighGirth;
  set thighGirth(double? value) {
    _thighGirth = value;
  }

  double? _hipsGirth;
  double? get hipsGirth => _hipsGirth;
  set hipsGirth(double? value) {
    _hipsGirth = value;
  }

  void clearBodyMeasures() {
    _hipsGirth = null;
    _thighGirth = null;
    _abdomenGirth = null;
    _waistGirth = null;
    _chestGirth = null;
    _shoulderGirth = null;
    notifyListeners();
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

// Future _safeInitAsync(Function() initializeField) async {
//   try {
//     await initializeField();
//   } catch (_) {}
// }
