import 'package:firebase_auth/firebase_auth.dart';

import '../../backend/supabase/supabase.dart';
import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'food_page_widget.dart' show FoodPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodPageModel extends FlutterFlowModel<FoodPageWidget> {
  ///  Local state fields for this page.

  bool showIndividualPlanPromo = true;
  bool forceHideIndividualPlanPromo = false;

  bool hasPlan = false;
  // Map<String, dynamic>? activeProgram;
  List<Map<String, dynamic>>? todayMeals;
  Map<String, dynamic>? todayKbzu;

  Map<String, dynamic>? currentDay;
  List<Map<String, dynamic>> meals = [];

  ///  State fields for stateful widgets in this page.

  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel1;
  // Model for generalButton component.
  late GeneralButtonModel generalButtonModel2;

  @override
  void initState(BuildContext context) {
    generalButtonModel1 = createModel(context, () => GeneralButtonModel());
    generalButtonModel2 = createModel(context, () => GeneralButtonModel());


  }

  @override
  void dispose() {
    generalButtonModel1.dispose();
    generalButtonModel2.dispose();
  }

  Future<void> loadNutritionPlan() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final client = AppSupabase.instance.client;

    // Получаем активный план питания
    print('🔍 Загружаем план питания...');

    // final program = await client
    //     .from('nutritionprogramrequest')
    //     .select()
    //     .eq('user_id', user.uid)
    //     .eq('status', 'generated')
    //     .order('created_at', ascending: false)
    //     .limit(1)
    //     .maybeSingle();
    //
    // if (program == null) {
    //   print('❗️Нет активного плана. Пробуем показать рекомендованное КБЖУ');
    //   // hasPlan = false;
    //
    //
    //
    //   return;
    // }

    final userData = await client
        .from('usernutritiondata')
        .select('recommended_kbzu')
        .eq('user_id', user.uid)
        .order('created_at', ascending: false)
        .limit(1)
        .maybeSingle();

    if (userData != null && userData['recommended_kbzu'] != null) {
      dynamic rawRecommendedKbzu = userData['recommended_kbzu'];
      late final Map<String, dynamic> rec;

      if (rawRecommendedKbzu is String) {
        rec = jsonDecode(rawRecommendedKbzu) as Map<String, dynamic>;
      } else if (rawRecommendedKbzu is Map) {
        rec = Map<String, dynamic>.from(rawRecommendedKbzu);
      } else {
        rec = {};
      }

      // Получаем nutrition_day
      final day = await client
          .from('nutrition_day')
          .select()
          .eq('date', DateFormat('yyyy-MM-dd').format(DateTime.now()))
          .maybeSingle();


      if (day == null) {
        print('❗️ Не найден день');
        todayMeals = [];
        todayKbzu = {};
        return;
      }

      currentDay = day;

      final meals = await client
          .from('nutrition_meal')
          .select()
          .eq('day_id', day['id']);

      todayMeals = List<Map<String, dynamic>>.from(meals);

      final Map<String, Map<String, double>> ingredientKbzuTable = {
        'Курица': {'kcal': 165, 'proteins': 31, 'fats': 3.6, 'carbs': 0},
        'Киноа': {'kcal': 120, 'proteins': 4.4, 'fats': 1.9, 'carbs': 21},
        'Салат': {'kcal': 15, 'proteins': 1.4, 'fats': 0.2, 'carbs': 2.9},
        'Помидоры черри': {'kcal': 18, 'proteins': 0.9, 'fats': 0.2, 'carbs': 3.9},
        'Творог': {'kcal': 121, 'proteins': 17, 'fats': 5, 'carbs': 3},
        'Яйца': {'kcal': 143, 'proteins': 13, 'fats': 10, 'carbs': 1.1},
        'Овсяные хлопья': {'kcal': 366, 'proteins': 11.9, 'fats': 6.9, 'carbs': 61.8},
        'Молоко': {'kcal': 42, 'proteins': 3.4, 'fats': 1, 'carbs': 5},
        'Банан': {'kcal': 89, 'proteins': 1.1, 'fats': 0.3, 'carbs': 22.8},
        'Орехи': {'kcal': 654, 'proteins': 15, 'fats': 65, 'carbs': 14},
      };

      double kcal = 0, carbs = 0, fats = 0, proteins = 0;

      for (final meal in todayMeals!) {
        final ingredientsRaw = meal['ingredients'];
        if (ingredientsRaw == null || ingredientsRaw is! List) continue;

        final List<dynamic> ingredients = ingredientsRaw;

        for (final ing in ingredients) {
          final name = ing['name'];
          final amountStr = ing['amount'] ?? '';

          final kbzuPer100g = ingredientKbzuTable[name];

          if (kbzuPer100g == null) continue;



          final gramsMatch = RegExp(r'(\d+)\s*г').firstMatch(amountStr);
          if (gramsMatch == null) continue;

          final grams = double.tryParse(gramsMatch.group(1) ?? '');
          if (grams == null) continue;

          final factor = grams / 100;

          kcal += kbzuPer100g['kcal']! * factor;
          carbs += kbzuPer100g['carbs']! * factor;
          fats += kbzuPer100g['fats']! * factor;
          proteins += kbzuPer100g['proteins']! * factor;
        }
      }

      todayKbzu = {
        'kcal_target': rec['kcal'] ?? rec['kcal_target'] ?? 0,
        'carbs_target': rec['carbs'] ?? rec['carbs_target'] ?? 0,
        'fats_target': rec['fats'] ?? rec['fats_target'] ?? 0,
        'proteins_target': rec['proteins'] ?? rec['proteins_target'] ?? 0,
        'kcal_consumed': kcal.round(),
        'carbs_consumed': carbs.round(),
        'fats_consumed': fats.round(),
        'proteins_consumed': proteins.round(),
      };
    }

    // hasPlan = true;
    // activeProgram = program;





    // // Новый блок логики получения KBZU дня
    // Map<String, dynamic> kbzuFromDay = {};
    // final rawKbzu = day['total_kbzu'];
    //
    // if (rawKbzu != null && rawKbzu is Map && rawKbzu.isNotEmpty) {
    //   kbzuFromDay = Map<String, dynamic>.from(rawKbzu);
    // } else {
    //   // Если данных по дню нет — пытаемся вычислить из приёмов пищи
    //
    //
    //   // kbzuFromDay = {};
    //   todayKbzu = {
    //     'kcal_target': kbzuFromDay['kcal'] ?? 0,
    //     'carbs_target': kbzuFromDay['carbs'] ?? 0,
    //     'fats_target': kbzuFromDay['fats'] ?? 0,
    //     'proteins_target': kbzuFromDay['proteins'] ?? 0,
    //     'kcal_consumed': kcal.round(),
    //     'carbs_consumed': carbs.round(),
    //     'fats_consumed': fats.round(),
    //     'proteins_consumed': proteins.round(),
    //   };
    //   print("tttttt________________${todayKbzu}");
    //   return;
    // }
    //
    // // Если kbzuFromDay всё ещё пуст — fallback на recommended_kbzu
    // if (kbzuFromDay.isEmpty) {
    //   final userData = await client
    //       .from('usernutritiondata')
    //       .select('recommended_kbzu')
    //       .eq('user_id', user.uid)
    //       .order('created_at', ascending: false)
    //       .limit(1)
    //       .maybeSingle();
    //
    //   if (userData != null && userData['recommended_kbzu'] != null) {
    //     dynamic rawRecommendedKbzu = userData['recommended_kbzu'];
    //     late final Map<String, dynamic> rec;
    //
    //     if (rawRecommendedKbzu is String) {
    //       rec = jsonDecode(rawRecommendedKbzu) as Map<String, dynamic>;
    //     } else if (rawRecommendedKbzu is Map) {
    //       rec = Map<String, dynamic>.from(rawRecommendedKbzu);
    //     } else {
    //       rec = {};
    //     }
    //
    //     kbzuFromDay = {
    //       'kcal': rec['kcal'] ?? rec['kcal_target'] ?? 0,
    //       'carbs': rec['carbs'] ?? rec['carbs_target'] ?? 0,
    //       'fats': rec['fats'] ?? rec['fats_target'] ?? 0,
    //       'proteins': rec['proteins'] ?? rec['proteins_target'] ?? 0,
    //     };
    //   }
    // }
    //
    // todayKbzu = {
    //   'kcal_target': kbzuFromDay['kcal'] ?? 0,
    //   'carbs_target': kbzuFromDay['carbs'] ?? 0,
    //   'fats_target': kbzuFromDay['fats'] ?? 0,
    //   'proteins_target': kbzuFromDay['proteins'] ?? 0,
    //   'kcal_consumed': 0,
    //   'carbs_consumed': 0,
    //   'fats_consumed': 0,
    //   'proteins_consumed': 0,
    // };

    // print("afdasfsdfadfga________${todayKbzu}");
    //
    // // Получаем приёмы пищи
    // final meals = await client
    //     .from('nutritionmeal')
    //     .select()
    //     .eq('day_id', day['id'])
    //     .order('meal_index');
    //
    // todayMeals = List<Map<String, dynamic>>.from(meals);
    // this.meals = todayMeals ?? [];

  }
}
