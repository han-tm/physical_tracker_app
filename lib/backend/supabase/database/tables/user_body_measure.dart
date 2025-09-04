import '../database.dart';

class UserBodyMeasureTable extends SupabaseTable<UserBodyMeasureRow> {
  @override
  String get tableName => 'UserBodyMeasure';

  @override
  UserBodyMeasureRow createRow(Map<String, dynamic> data) =>
      UserBodyMeasureRow(data);
}

class UserBodyMeasureRow extends SupabaseDataRow {
  UserBodyMeasureRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserBodyMeasureTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get type => getField<int>('type');
  set type(int? value) => setField<int>('type', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  double? get value => getField<double>('value');
  set value(double? value) => setField<double>('value', value);

  String? get imgFront => getField<String>('img_front');
  set imgFront(String? value) => setField<String>('img_front', value);

  String? get imgBack => getField<String>('img_back');
  set imgBack(String? value) => setField<String>('img_back', value);

  String? get imgSide => getField<String>('img_side');
  set imgSide(String? value) => setField<String>('img_side', value);

  double? get weight => getField<double>('weight');
  set weight(double? value) => setField<double>('weight', value);

  double? get shoulderGirth => getField<double>('shoulder_girth');
  set shoulderGirth(double? value) => setField<double>('shoulder_girth', value);

  double? get chestGirth => getField<double>('chest_girth');
  set chestGirth(double? value) => setField<double>('chest_girth', value);

  double? get waistGirth => getField<double>('waist_girth');
  set waistGirth(double? value) => setField<double>('waist_girth', value);

  double? get abdomenGirth => getField<double>('abdomen_girth');
  set abdomenGirth(double? value) => setField<double>('abdomen_girth', value);

  double? get thighGirth => getField<double>('thigh_girth');
  set thighGirth(double? value) => setField<double>('thigh_girth', value);

  double? get hipsGirth => getField<double>('hips_girth');
  set hipsGirth(double? value) => setField<double>('hips_girth', value);
}
