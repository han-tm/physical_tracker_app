import '../database.dart';

class TrainingProgramWeekTable extends SupabaseTable<TrainingProgramWeekRow> {
  @override
  String get tableName => 'TrainingProgramWeek';

  @override
  TrainingProgramWeekRow createRow(Map<String, dynamic> data) =>
      TrainingProgramWeekRow(data);
}

class TrainingProgramWeekRow extends SupabaseDataRow {
  TrainingProgramWeekRow(super.data);

  @override
  SupabaseTable get table => TrainingProgramWeekTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get trainingProgram => getField<int>('trainingProgram');
  set trainingProgram(int? value) => setField<int>('trainingProgram', value);

  int? get week => getField<int>('week');
  set week(int? value) => setField<int>('week', value);
}
