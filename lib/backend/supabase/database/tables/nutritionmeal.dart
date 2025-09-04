import '../database.dart';

class NutritionmealTable extends SupabaseTable<NutritionmealRow> {
  @override
  String get tableName => 'nutritionmeal';

  @override
  NutritionmealRow createRow(Map<String, dynamic> data) =>
      NutritionmealRow(data);
}

class NutritionmealRow extends SupabaseDataRow {
  NutritionmealRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NutritionmealTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get dayId => getField<String>('day_id');
  set dayId(String? value) => setField<String>('day_id', value);

  int? get mealIndex => getField<int>('meal_index');
  set mealIndex(int? value) => setField<int>('meal_index', value);

  String? get mealName => getField<String>('meal_name');
  set mealName(String? value) => setField<String>('meal_name', value);

  String? get dishName => getField<String>('dish_name');
  set dishName(String? value) => setField<String>('dish_name', value);

  dynamic? get ingredients => getField<dynamic>('ingredients');
  set ingredients(dynamic? value) => setField<dynamic>('ingredients', value);

  String? get recipe => getField<String>('recipe');
  set recipe(String? value) => setField<String>('recipe', value);

  dynamic? get kbzu => getField<dynamic>('kbzu');
  set kbzu(dynamic? value) => setField<dynamic>('kbzu', value);
}
