import 'package:firebase_auth/firebase_auth.dart';

import '../../backend/supabase/supabase.dart';
import '/components/general_button_widget.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_difficulty_page_widget.dart' show ProfileDifficultyPageWidget;
import 'package:flutter/material.dart';

class ProfileDifficultyPageModel
    extends FlutterFlowModel<ProfileDifficultyPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for generalNavBar01 component.
  late GeneralNavBar01Model generalNavBar01Model;
  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel1;
  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel2;
  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel3;

  @override
  void initState(BuildContext context) {
    generalNavBar01Model = createModel(context, () => GeneralNavBar01Model());
    generalButtonModel1 = createModel(context, () => GeneralButtonModel());
    generalButtonModel2 = createModel(context, () => GeneralButtonModel());
    generalButtonModel3 = createModel(context, () => GeneralButtonModel());
  }

  @override
  void dispose() {
    generalNavBar01Model.dispose();
    generalButtonModel1.dispose();
    generalButtonModel2.dispose();
    generalButtonModel3.dispose();
  }

  SupabaseClient supabase = AppSupabase.instance.client;

  Map<String, dynamic>? currentUser;
  List<Map<String, dynamic>> difficulties = [];

  Future<void> loadInitialData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    // Загрузка пользователя
    final userRes = await supabase
        .from('User')
        .select()
        .eq('fb_id', uid)
        .maybeSingle();
    currentUser = userRes;

    // Загрузка уровней сложности
    final difficultyRes = await supabase
        .from('ExerciseDifficulty')
        .select()
        .order('id', ascending: true);
    difficulties = List<Map<String, dynamic>>.from(difficultyRes);

    // Проверка: если текущий уровень неизвестен — назначаем первый
    final userDiffId = currentUser?['exerciseDifficulty'];
    final exists = difficulties.any((d) => d['id'] == userDiffId);

    if (!exists && difficulties.isNotEmpty) {
      final firstId = difficulties.first['id'];
      currentUser!['exerciseDifficulty'] = firstId;

      await supabase.from('User').update({
        'exerciseDifficulty': firstId,
      }).eq('fb_id', currentUser!['fb_id']);
    }
  }

  int? get currentDifficulty {
    if (currentUser == null || difficulties.isEmpty) return null;

    final difficultyId = currentUser!['exerciseDifficulty'];
    return difficultyId;
  }

  Future<String?> get currentDifficultyLabel async {
    if (currentUser == null || difficulties.isEmpty) return null;

    final difficultyId = currentUser!['exerciseDifficulty'];
    final matching = difficulties.firstWhere(
          (d) => d['id'] == difficultyId,
      orElse: () => {},
    );

    // Если не найден — обновляем exerciseDifficulty на первую доступную сложность
    if (matching.isEmpty) {
      final first = difficulties.first;
      currentUser!['exerciseDifficulty'] = first['id'];

      // Сохраняем в Supabase
      await supabase.from('User').update({
        'exerciseDifficulty': first['id'],
      }).eq('fb_id', currentUser!['fb_id']);

      return first['name'];
    }

    return matching['name'];
  }

  bool get individualProgramIsActive {
    return currentUser?['individualProgramIsActive'] == true;
  }

  bool get individualProgramUnderPrepare {
    return currentUser?['individualProgramUnderPrepare'] == true;
  }

}
