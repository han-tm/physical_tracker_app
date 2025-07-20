import '../database.dart';

class SubscriptionTable extends SupabaseTable<SubscriptionRow> {
  @override
  String get tableName => 'Subscription';

  @override
  SubscriptionRow createRow(Map<String, dynamic> data) => SubscriptionRow(data);
}

class SubscriptionRow extends SupabaseDataRow {
  SubscriptionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SubscriptionTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get expirationDate => getField<DateTime>('expiration_date');
  set expirationDate(DateTime? value) =>
      setField<DateTime>('expiration_date', value);

  int? get planId => getField<int>('plan_id');
  set planId(int? value) => setField<int>('plan_id', value);
}
