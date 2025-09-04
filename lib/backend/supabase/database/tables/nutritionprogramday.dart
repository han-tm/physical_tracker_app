import '../database.dart';

class NutritionprogramdayTable extends SupabaseTable<NutritionprogramdayRow> {
  @override
  String get tableName => 'nutritionprogramday';

  @override
  NutritionprogramdayRow createRow(Map<String, dynamic> data) =>
      NutritionprogramdayRow(data);
}

class NutritionprogramdayRow extends SupabaseDataRow {
  NutritionprogramdayRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NutritionprogramdayTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get programId => getField<String>('program_id');
  set programId(String? value) => setField<String>('program_id', value);

  int? get dayIndex => getField<int>('day_index');
  set dayIndex(int? value) => setField<int>('day_index', value);

  dynamic? get totalKbzu => getField<dynamic>('total_kbzu');
  set totalKbzu(dynamic? value) => setField<dynamic>('total_kbzu', value);

  dynamic? get productList => getField<dynamic>('product_list');
  set productList(dynamic? value) => setField<dynamic>('product_list', value);
}
