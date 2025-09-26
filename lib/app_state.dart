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

  // individual body measures
  String? _traininPlace;
  String? get traininPlace => _traininPlace;
  set traininPlace(String? value) {
    _traininPlace = value;
    notifyListeners();
  }

  String? _inventory;
  String? get inventory => _inventory;
  set inventory(String? value) {
    _inventory = value;
    notifyListeners();
  }

  String? _goal;
  String? get goal => _goal;
  set goal(String? value) {
    _goal = value;
    notifyListeners();
  }

  String? _restrictions;
  String? get restrictions => _restrictions;
  set restrictions(String? value) {
    _restrictions = value;
    notifyListeners();
  }

  DateTime? _nextCycle;
  DateTime? get nextCycle => _nextCycle;
  set nextCycle(DateTime? value) {
    _nextCycle = value;
    notifyListeners();
  }

  String? _trainDuration;
  String? get trainDuration => _trainDuration;
  set trainDuration(String? value) {
    _trainDuration = value;
    notifyListeners();
  }

  String? _trainExercise;
  String? get trainExercise => _trainExercise;
  set trainExercise(String? value) {
    _trainExercise = value;
    notifyListeners();
  }

  String? _trainWeight;
  String? get trainWeight => _trainWeight;
  set trainWeight(String? value) {
    _trainWeight = value;
    notifyListeners();
  }

  String? _bodyAccent;
  String? get bodyAccent => _bodyAccent;
  set bodyAccent(String? value) {
    _bodyAccent = value;
    notifyListeners();
  }

  String? _bodyNotDo;
  String? get bodyNotDo => _bodyNotDo;
  set bodyNotDo(String? value) {
    _bodyNotDo = value;
    notifyListeners();
  }

  String? _canCountKBZU;
  String? get canCountKBZU => _canCountKBZU;
  set canCountKBZU(String? value) {
    _canCountKBZU = value;
    notifyListeners();
  }

  String? _photoSide;
  String? get photoSide => _photoSide;
  set photoSide(String? value) {
    _photoSide = value;
    notifyListeners();
  }

  String? _photoFront;
  String? get photoFront => _photoFront;
  set photoFront(String? value) {
    _photoFront = value;
    notifyListeners();
  }

  String? _photoBack;
  String? get photoBack => _photoBack;
  set photoBack(String? value) {
    _photoBack = value;
    notifyListeners();
  }

  clearIndividualBodyMeasures() {
    _traininPlace = null;
    _inventory = null;
    _goal = null;
    _restrictions = null;
    _nextCycle = null;
    _trainDuration = null;
    _trainExercise = null;
    _trainWeight = null;
    _bodyAccent = null;
    _bodyNotDo = null;
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
