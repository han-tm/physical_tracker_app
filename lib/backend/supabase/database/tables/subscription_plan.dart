import '../database.dart';

class SubscriptionPlanTable extends SupabaseTable<SubscriptionPlanRow> {
  @override
  String get tableName => 'SubscriptionPlan';

  @override
  SubscriptionPlanRow createRow(Map<String, dynamic> data) =>
      SubscriptionPlanRow(data);
}

class SubscriptionPlanRow extends SupabaseDataRow {
  SubscriptionPlanRow(super.data);

  @override
  SupabaseTable get table => SubscriptionPlanTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  dynamic get features => getField<dynamic>('features');
  set features(dynamic value) => setField<dynamic>('features', value);

  int? get type => getField<int>('type');
  set type(int? value) => setField<int>('type', value);

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);
}
