import '../database.dart';

class LessonGroupTable extends SupabaseTable<LessonGroupRow> {
  @override
  String get tableName => 'LessonGroup';

  @override
  LessonGroupRow createRow(Map<String, dynamic> data) => LessonGroupRow(data);
}

class LessonGroupRow extends SupabaseDataRow {
  LessonGroupRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LessonGroupTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
