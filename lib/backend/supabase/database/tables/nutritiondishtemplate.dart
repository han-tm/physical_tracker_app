import '../database.dart';

class NutritiondishtemplateTable
    extends SupabaseTable<NutritiondishtemplateRow> {
  @override
  String get tableName => 'nutritiondishtemplate';

  @override
  NutritiondishtemplateRow createRow(Map<String, dynamic> data) =>
      NutritiondishtemplateRow(data);
}

class NutritiondishtemplateRow extends SupabaseDataRow {
  NutritiondishtemplateRow(super.data);

  @override
  SupabaseTable get table => NutritiondishtemplateTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  dynamic get ingredients => getField<dynamic>('ingredients');
  set ingredients(dynamic value) => setField<dynamic>('ingredients', value);

  String? get recipe => getField<String>('recipe');
  set recipe(String? value) => setField<String>('recipe', value);

  dynamic get kbzu => getField<dynamic>('kbzu');
  set kbzu(dynamic value) => setField<dynamic>('kbzu', value);

  List<String> get tags => getListField<String>('tags');
  set tags(List<String>? value) => setListField<String>('tags', value);
}
