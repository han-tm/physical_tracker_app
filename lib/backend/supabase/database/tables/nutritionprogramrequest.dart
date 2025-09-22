import '../database.dart';

class NutritionprogramrequestTable
    extends SupabaseTable<NutritionprogramrequestRow> {
  @override
  String get tableName => 'nutritionprogramrequest';

  @override
  NutritionprogramrequestRow createRow(Map<String, dynamic> data) =>
      NutritionprogramrequestRow(data);
}

class NutritionprogramrequestRow extends SupabaseDataRow {
  NutritionprogramrequestRow(super.data);

  @override
  SupabaseTable get table => NutritionprogramrequestTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  int? get daysCount => getField<int>('days_count');
  set daysCount(int? value) => setField<int>('days_count', value);

  double? get budgetTotal => getField<double>('budget_total');
  set budgetTotal(double? value) => setField<double>('budget_total', value);

  int? get mealsPerDay => getField<int>('meals_per_day');
  set mealsPerDay(int? value) => setField<int>('meals_per_day', value);

  bool? get hasSnacks => getField<bool>('has_snacks');
  set hasSnacks(bool? value) => setField<bool>('has_snacks', value);

  int? get snacksPerDay => getField<int>('snacks_per_day');
  set snacksPerDay(int? value) => setField<int>('snacks_per_day', value);

  List<String> get includedIngredients =>
      getListField<String>('included_ingredients');
  set includedIngredients(List<String>? value) =>
      setListField<String>('included_ingredients', value);

  List<String> get excludedIngredients =>
      getListField<String>('excluded_ingredients');
  set excludedIngredients(List<String>? value) =>
      setListField<String>('excluded_ingredients', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
