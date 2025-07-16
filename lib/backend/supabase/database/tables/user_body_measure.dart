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
}
