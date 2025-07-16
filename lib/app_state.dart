import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
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
      _obboardingShown =
          prefs.getBool('ff_obboardingShown') ?? _obboardingShown;
    });
    _safeInit(() {
      _surveyShown = prefs.getBool('ff_surveyShown') ?? _surveyShown;
    });
    _safeInit(() {
      _UserBodyMeasures = prefs
              .getStringList('ff_UserBodyMeasures')
              ?.map((x) {
                try {
                  return UserBodyMeasureStruct.fromSerializableMap(
                      jsonDecode(x));
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
    prefs.setStringList(
        'ff_UserBodyMeasures', value.map((x) => x.serialize()).toList());
  }

  void addToUserBodyMeasures(UserBodyMeasureStruct value) {
    UserBodyMeasures.add(value);
    prefs.setStringList('ff_UserBodyMeasures',
        _UserBodyMeasures.map((x) => x.serialize()).toList());
  }

  void removeFromUserBodyMeasures(UserBodyMeasureStruct value) {
    UserBodyMeasures.remove(value);
    prefs.setStringList('ff_UserBodyMeasures',
        _UserBodyMeasures.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromUserBodyMeasures(int index) {
    UserBodyMeasures.removeAt(index);
    prefs.setStringList('ff_UserBodyMeasures',
        _UserBodyMeasures.map((x) => x.serialize()).toList());
  }

  void updateUserBodyMeasuresAtIndex(
    int index,
    UserBodyMeasureStruct Function(UserBodyMeasureStruct) updateFn,
  ) {
    UserBodyMeasures[index] = updateFn(_UserBodyMeasures[index]);
    prefs.setStringList('ff_UserBodyMeasures',
        _UserBodyMeasures.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInUserBodyMeasures(int index, UserBodyMeasureStruct value) {
    UserBodyMeasures.insert(index, value);
    prefs.setStringList('ff_UserBodyMeasures',
        _UserBodyMeasures.map((x) => x.serialize()).toList());
  }

  bool _regCompleted = false;
  bool get regCompleted => _regCompleted;
  set regCompleted(bool value) {
    _regCompleted = value;
    prefs.setBool('ff_regCompleted', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
