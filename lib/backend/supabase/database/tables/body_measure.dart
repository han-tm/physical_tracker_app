import '../database.dart';

class BodyMeasureTable extends SupabaseTable<BodyMeasureRow> {
  @override
  String get tableName => 'BodyMeasure';

  @override
  BodyMeasureRow createRow(Map<String, dynamic> data) => BodyMeasureRow(data);
}

class BodyMeasureRow extends SupabaseDataRow {
  BodyMeasureRow(super.data);

  @override
  SupabaseTable get table => BodyMeasureTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get type => getField<int>('type');
  set type(int? value) => setField<int>('type', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get video => getField<String>('video');
  set video(String? value) => setField<String>('video', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);
}
