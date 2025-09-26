import '../database.dart';

class    IndividualProgramTable extends SupabaseTable<IndividualProgramRow> {
  @override
  String get tableName => 'IndividualProgram';

  @override
  IndividualProgramRow createRow(Map<String, dynamic> data) => IndividualProgramRow(data);
}

class IndividualProgramRow extends SupabaseDataRow {
  IndividualProgramRow(super.data);

  @override
  SupabaseTable get table => IndividualProgramTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get difficulty => getField<int>('difficulty');
  set difficulty(int? value) => setField<int>('difficulty', value);

  List<Map<String, dynamic>> get weeks => getListField<Map<String, dynamic>>('weeks');
  set includedIngredients(List<Map<String, dynamic>>? value) => setListField<Map<String, dynamic>>('weeks', value);

  bool? get isTrial => getField<bool>('isTrial');
  set isTrial(bool? value) => setField<bool>('isTrial', value);

  bool? get isFilled => getField<bool>('isFilled');
  set isFilled(bool? value) => setField<bool>('isFilled', value);

  bool? get ready => getField<bool>('ready');
  set ready(bool? value) => setField<bool>('ready', value);
}
