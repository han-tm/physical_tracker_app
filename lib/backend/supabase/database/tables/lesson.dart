import '../database.dart';

class LessonTable extends SupabaseTable<LessonRow> {
  @override
  String get tableName => 'Lesson';

  @override
  LessonRow createRow(Map<String, dynamic> data) => LessonRow(data);
}

class LessonRow extends SupabaseDataRow {
  LessonRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LessonTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get lessonCategory => getField<String>('lesson_category');
  set lessonCategory(String? value) =>
      setField<String>('lesson_category', value);

  String? get cover => getField<String>('cover');
  set cover(String? value) => setField<String>('cover', value);

  String? get video => getField<String>('video');
  set video(String? value) => setField<String>('video', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get lessonGroup => getField<int>('lessonGroup');
  set lessonGroup(int? value) => setField<int>('lessonGroup', value);

  int? get duration => getField<int>('duration');
  set duration(int? value) => setField<int>('duration', value);

  String? get lessonGroupName => getField<String>('lessonGroupName');
  set lessonGroupName(String? value) =>
      setField<String>('lessonGroupName', value);

  int? get views => getField<int>('views');
  set views(int? value) => setField<int>('views', value);
}
