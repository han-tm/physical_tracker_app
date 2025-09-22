import '../database.dart';

class TrainingProgramWeekDayExerciseTable
    extends SupabaseTable<TrainingProgramWeekDayExerciseRow> {
  @override
  String get tableName => 'TrainingProgramWeekDayExercise';

  @override
  TrainingProgramWeekDayExerciseRow createRow(Map<String, dynamic> data) =>
      TrainingProgramWeekDayExerciseRow(data);
}

class TrainingProgramWeekDayExerciseRow extends SupabaseDataRow {
  TrainingProgramWeekDayExerciseRow(super.data);

  @override
  SupabaseTable get table => TrainingProgramWeekDayExerciseTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get trainingProgramWeekDay => getField<int>('trainingProgramWeekDay');
  set trainingProgramWeekDay(int? value) =>
      setField<int>('trainingProgramWeekDay', value);

  int? get exercise => getField<int>('exercise');
  set exercise(int? value) => setField<int>('exercise', value);
}
