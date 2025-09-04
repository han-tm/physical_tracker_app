import '../database.dart';

class TrainingProgramTable extends SupabaseTable<TrainingProgramRow> {
  @override
  String get tableName => 'TrainingProgram';

  @override
  TrainingProgramRow createRow(Map<String, dynamic> data) =>
      TrainingProgramRow(data);
}

class TrainingProgramRow extends SupabaseDataRow {
  TrainingProgramRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingProgramTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get type => getField<int>('type');
  set type(int? value) => setField<int>('type', value);

  int? get difficulty => getField<int>('difficulty');
  set difficulty(int? value) => setField<int>('difficulty', value);

  bool? get isPermanent => getField<bool>('isPermanent');
  set isPermanent(bool? value) => setField<bool>('isPermanent', value);
}
