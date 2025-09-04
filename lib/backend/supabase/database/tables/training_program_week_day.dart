import '../database.dart';

class TrainingProgramWeekDayTable
    extends SupabaseTable<TrainingProgramWeekDayRow> {
  @override
  String get tableName => 'TrainingProgramWeekDay';

  @override
  TrainingProgramWeekDayRow createRow(Map<String, dynamic> data) =>
      TrainingProgramWeekDayRow(data);
}

class TrainingProgramWeekDayRow extends SupabaseDataRow {
  TrainingProgramWeekDayRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingProgramWeekDayTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get trainingProgramWeek => getField<int>('trainingProgramWeek');
  set trainingProgramWeek(int? value) =>
      setField<int>('trainingProgramWeek', value);

  int? get day => getField<int>('day');
  set day(int? value) => setField<int>('day', value);
}
