// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserBodyMeasureStruct extends FFFirebaseStruct {
  UserBodyMeasureStruct({
    int? type,
    double? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _value = value,
        super(firestoreUtilData);

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  set type(int? val) => _type = val;

  void incrementType(int amount) => type = type + amount;

  bool hasType() => _type != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;

  void incrementValue(double amount) => value = value + amount;

  bool hasValue() => _value != null;

  static UserBodyMeasureStruct fromMap(Map<String, dynamic> data) =>
      UserBodyMeasureStruct(
        type: castToType<int>(data['type']),
        value: castToType<double>(data['value']),
      );

  static UserBodyMeasureStruct? maybeFromMap(dynamic data) => data is Map
      ? UserBodyMeasureStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.int,
        ),
        'value': serializeParam(
          _value,
          ParamType.double,
        ),
      }.withoutNulls;

  static UserBodyMeasureStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserBodyMeasureStruct(
        type: deserializeParam(
          data['type'],
          ParamType.int,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'UserBodyMeasureStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserBodyMeasureStruct &&
        type == other.type &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([type, value]);
}

UserBodyMeasureStruct createUserBodyMeasureStruct({
  int? type,
  double? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserBodyMeasureStruct(
      type: type,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserBodyMeasureStruct? updateUserBodyMeasureStruct(
  UserBodyMeasureStruct? userBodyMeasure, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userBodyMeasure
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserBodyMeasureStructData(
  Map<String, dynamic> firestoreData,
  UserBodyMeasureStruct? userBodyMeasure,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userBodyMeasure == null) {
    return;
  }
  if (userBodyMeasure.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userBodyMeasure.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userBodyMeasureData =
      getUserBodyMeasureFirestoreData(userBodyMeasure, forFieldValue);
  final nestedData =
      userBodyMeasureData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userBodyMeasure.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserBodyMeasureFirestoreData(
  UserBodyMeasureStruct? userBodyMeasure, [
  bool forFieldValue = false,
]) {
  if (userBodyMeasure == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userBodyMeasure.toMap());

  // Add any Firestore field values
  userBodyMeasure.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserBodyMeasureListFirestoreData(
  List<UserBodyMeasureStruct>? userBodyMeasures,
) =>
    userBodyMeasures
        ?.map((e) => getUserBodyMeasureFirestoreData(e, true))
        .toList() ??
    [];
