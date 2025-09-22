import '../database.dart';

class ExerciseDifficultyTable extends SupabaseTable<ExerciseDifficultyRow> {
  @override
  String get tableName => 'ExerciseDifficulty';

  @override
  ExerciseDifficultyRow createRow(Map<String, dynamic> data) =>
      ExerciseDifficultyRow(data);
}

class ExerciseDifficultyRow extends SupabaseDataRow {
  ExerciseDifficultyRow(super.data);

  @override
  SupabaseTable get table => ExerciseDifficultyTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get days => getField<int>('days');
  set days(int? value) => setField<int>('days', value);

  int? get weeks => getField<int>('weeks');
  set weeks(int? value) => setField<int>('weeks', value);

  dynamic get features => getField<dynamic>('features');
  set features(dynamic value) => setField<dynamic>('features', value);

  String? get cover => getField<String>('cover');
  set cover(String? value) => setField<String>('cover', value);
}
