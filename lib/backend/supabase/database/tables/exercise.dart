import '../database.dart';

class ExerciseTable extends SupabaseTable<ExerciseRow> {
  @override
  String get tableName => 'Exercise';

  @override
  ExerciseRow createRow(Map<String, dynamic> data) => ExerciseRow(data);
}

class ExerciseRow extends SupabaseDataRow {
  ExerciseRow(super.data);

  @override
  SupabaseTable get table => ExerciseTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  dynamic get muscleGroup => getField<dynamic>('muscleGroup');
  set muscleGroup(dynamic value) => setField<dynamic>('muscleGroup', value);

  String? get video => getField<String>('video');
  set video(String? value) => setField<String>('video', value);

  int? get difficultyId => getField<int>('difficultyId');
  set difficultyId(int? value) => setField<int>('difficultyId', value);

  int? get approach => getField<int>('approach');
  set approach(int? value) => setField<int>('approach', value);

  int? get repetitions => getField<int>('repetitions');
  set repetitions(int? value) => setField<int>('repetitions', value);

  double? get weight => getField<double>('weight');
  set weight(double? value) => setField<double>('weight', value);

  dynamic get alternateExercise => getField<dynamic>('alternateExercise');
  set alternateExercise(dynamic value) =>
      setField<dynamic>('alternateExercise', value);
}
