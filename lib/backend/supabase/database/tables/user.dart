import '../database.dart';

class UserTable extends SupabaseTable<UserRow> {
  @override
  String get tableName => 'User';

  @override
  UserRow createRow(Map<String, dynamic> data) => UserRow(data);
}

class UserRow extends SupabaseDataRow {
  UserRow(super.data);

  @override
  SupabaseTable get table => UserTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  String get fbId => getField<String>('fb_id')!;
  set fbId(String value) => setField<String>('fb_id', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  int? get age => getField<int>('age');
  set age(int? value) => setField<int>('age', value);

  double? get height => getField<double>('height');
  set height(double? value) => setField<double>('height', value);

  double? get weight => getField<double>('weight');
  set weight(double? value) => setField<double>('weight', value);

  bool? get notifActive => getField<bool>('notif_active');
  set notifActive(bool? value) => setField<bool>('notif_active', value);

  bool? get notifSup => getField<bool>('notif_sup');
  set notifSup(bool? value) => setField<bool>('notif_sup', value);

  bool? get notifMeasure => getField<bool>('notif_measure');
  set notifMeasure(bool? value) => setField<bool>('notif_measure', value);

  bool? get notifNews => getField<bool>('notif_news');
  set notifNews(bool? value) => setField<bool>('notif_news', value);

  int? get selectedProgram => getField<int>('selectedProgram');
  set selectedProgram(int? value) => setField<int>('selectedProgram', value);

  String? get programStartDate => getField<String?>('programStartDate');
  set programStartDate(String? value) => setField<String?>('programStartDate', value);

  int? get individualProgramId => getField<int>('individualProgramId');
  set individualProgramId(int? value) => setField<int>('individualProgramId', value);
}
