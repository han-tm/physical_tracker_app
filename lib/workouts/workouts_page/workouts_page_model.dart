import 'package:boom_client/backend/supabase/database/tables/training_program.dart';
import 'package:collection/collection.dart';

import '../../backend/supabase/database/tables/individual_program.dart';
import '../../backend/supabase/supabase.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'workouts_page_widget.dart' show WorkoutsPageWidget;
import 'package:flutter/material.dart';

String getTypeName(String type) {
  switch (type) {
    case 'trial':
      return 'Пробный';
    case 'paid':
      return 'Платный';
    case 'individual':
      return 'Индивидуальный';
    default:
      return 'Тренеровка';
  }
}

class TrainingProgramDTO {
  final String type; // trial | paid | individual
  final String name;
  final int currentWeek;
  final int totalWeeks;
  final List<Map<String, dynamic>> weeks;
  final TrainingProgramRow program;
  final UserRow user;

  TrainingProgramDTO({
    required this.type,
    required this.name,
    required this.currentWeek,
    required this.totalWeeks,
    required this.weeks,
    required this.program,
    required this.user,
  });
}

int _calculateWeek(DateTime startDate, int totalWeeks) {
  final now = DateTime.now();
  final diffDays = now.difference(startDate).inDays;
  final week = (diffDays ~/ 7) + 1;
  return week.clamp(1, totalWeeks);
}

class TrainingRepository {
  Future<List<TrainingProgramDTO>> getAvailablePrograms(String currentUserUid) async {
    try {
      // 1. Получаем пользователя
      final user = await UserTable()
          .querySingleRow(queryFn: (q) => q.eq('fb_id', currentUserUid))
          .then((value) => value.firstOrNull);

      if (user == null) {
        return [];
      }

      // 2. Получаем подписки
      final subscriptionsRaw = await SubscriptionTable().queryRows(queryFn: (q) => q.eq('user_id', currentUserUid));

      final now = DateTime.now();
      final subscriptions = subscriptionsRaw.where((sub) {
        if (sub.isIndividual == true) return true; // индивидуальная всегда доступна
        if (sub.expirationDate == null) return false; // нет даты окончания → считаем недействительной
        return sub.expirationDate!.isAfter(now) || sub.expirationDate!.isAtSameMomentAs(now);
      }).toList();

      if (subscriptions.isEmpty) {
        return []; // нет подписок
      }

      // 3. Получаем все базовые программы
      final List<TrainingProgramRow> programs = await TrainingProgramTable().queryRows(queryFn: (q) => q);

      // 4. Получаем индивидуальную (если есть id)
      IndividualProgramRow? individualProgram;
      if (user.individualProgramId != null) {
        individualProgram = await IndividualProgramTable()
            .querySingleRow(queryFn: (q) => q.eq('id', user.individualProgramId!))
            .then((value) => value.firstOrNull);
      }

      // 5. Подбираем trial / paid программы
      final trialProgram = programs.firstWhereOrNull((p) => p.isTrial == true);
      final paidProgram = programs.firstWhereOrNull((p) => p.id == user.selectedProgram);

      // 6. Собираем список
      final List<TrainingProgramDTO> availablePrograms = [];

      for (final sub in subscriptions) {
        if (sub.isIndividual == true) {
          if (individualProgram != null && individualProgram.ready == true) {
            final totalWeeks = individualProgram.weeks.length;
            availablePrograms.add(
              TrainingProgramDTO(
                type: 'individual',
                name: individualProgram.name ?? 'Individual',
                currentWeek: totalWeeks > 0 ? _calculateWeek(sub.createdAt, totalWeeks) : 0,
                totalWeeks: totalWeeks,
                weeks: individualProgram.weeks,
                program: TrainingProgramRow(individualProgram.data),
                user: user,
              ),
            );
          }
        } else if (sub.isTrial == true) {
          if (trialProgram != null) {
            final totalWeeks = trialProgram.weeks.length;
            availablePrograms.add(
              TrainingProgramDTO(
                type: 'trial',
                name: trialProgram.name ?? 'Trial',
                currentWeek: totalWeeks > 0 ? _calculateWeek(sub.createdAt, totalWeeks) : 0,
                totalWeeks: totalWeeks,
                weeks: trialProgram.weeks,
                program: trialProgram,
                user: user,
              ),
            );
          }
        } else {
          if (paidProgram != null) {
            final totalWeeks = paidProgram.weeks.length;
            availablePrograms.add(
              TrainingProgramDTO(
                type: 'paid',
                name: paidProgram.name ?? 'Paid',
                currentWeek: totalWeeks > 0 ? _calculateWeek(sub.createdAt, totalWeeks) : 0,
                totalWeeks: totalWeeks,
                weeks: paidProgram.weeks,
                program: paidProgram,
                user: user,
              ),
            );
          }
        }
      }

      return availablePrograms;
    } catch (e, st) {
      print('❌ Ошибка при получении программ: $e\n$st');
      return [];
    }
  }
}

class WorkoutsPageModel extends FlutterFlowModel<WorkoutsPageWidget> {
  ///  Local state fields for this page.
  // TrainingProgramRow? trainingProgram;
  // IndividualProgramRow? individualProgram;
  // int? currentProgramWeek;
  // bool loading = true;
  // bool isEndOfProgram = false;
  // String? error;
  // Map<String, dynamic>? weekSelected;

  // List<int> days = [1, 2, 3, 4, 5, 6, 7];
  // void addToDays(int item) => days.add(item);
  // void removeFromDays(int item) => days.remove(item);
  // void removeAtIndexFromDays(int index) => days.removeAt(index);
  // void insertAtIndexInDays(int index, int item) => days.insert(index, item);
  // void updateDaysAtIndex(int index, Function(int) updateFn) => days[index] = updateFn(days[index]);

  // int daySelected = 1;

  // bool individualProgramPreparing = false;

  // Map<String, dynamic>? user;
  // List<dynamic> exercises = [];
  // List<dynamic> trainingPrograms = [];
  // List<dynamic> trainingProgramWeeks = [];
  // List<dynamic> trainingProgramWeekDays = [];
  // List<dynamic> trainingTrainingProgramWeekDayExercises = [];

  // ///  State fields for stateful widgets in this page.

  // // Model for generalButton component.
  // late GeneralButtonModel generalButtonModel1;
  // // Model for generalButton component.
  // late GeneralButtonModel generalButtonModel2;

  @override
  void initState(BuildContext context) {}

  // Future<void> loadProgram() async {
  //   try {
  //     final UserRow? user = await UserTable()
  //         .querySingleRow(queryFn: (q) => q.eq('fb_id', currentUserUid))
  //         .then((value) => value.firstOrNull);

  //     if (user == null) {
  //       loading = false;
  //       error = 'Пользователь не найден';
  //       print('Пользователь не найден');
  //       return;
  //     }

  //     final int? individualProgramId = user.individualProgram;

  //     if (individualProgramId != null) {
  //       individualProgram = await IndividualProgramTable()
  //           .querySingleRow(queryFn: (q) => q.eq('id', individualProgramId))
  //           .then((value) => value.firstOrNull);
  //     }

  //     final subscriptions = await SubscriptionTable().queryRows(queryFn: (q) => q.eq('user_id', currentUserUid));

  //     if (subscriptions.isEmpty) {
  //       loading = false;
  //       error = 'Нет действующих подписок';
  //       print('Подписка не найдена');
  //       return;
  //     }

  //     final userSubscription =
  //         subscriptions.where((s) => s.isIndividual != true).reduce((a, b) => a.createdAt.isAfter(b.createdAt) ? a : b);

  //     final List<TrainingProgramRow> programms = await TrainingProgramTable().queryRows(queryFn: (q) => q);

  //     if (userSubscription.isTrial == true) {
  //       // Если тариф пробный, то получаем пробную программу
  //       trainingProgram = programms.firstWhereOrNull((p) => p.isTrial == true);

  //       if (trainingProgram == null) {
  //         loading = false;
  //         error = 'Тренировочные программы не найдены';
  //         print('Тренировочные программы не найдены');
  //         return;
  //       }

  //       currentProgramWeek = 1;

  //       weekSelected = trainingProgram!.weeks[currentProgramWeek! - 1];
  //       loading = false;
  //     } else {
  //       final int? programId = user.selectedProgram;

  //       trainingProgram = programms.firstWhereOrNull((element) => element.id == programId);

  //       final programStartDateString = user.programStartDate;

  //       if (programStartDateString == null) {
  //         loading = false;
  //         error = 'Дата начала программы не найдена';
  //         print('Дата начала программы не найдена');
  //         return;
  //       }

  //       if (trainingProgram == null) {
  //         loading = false;
  //         error = 'Тренировочные программы не найдены';
  //         print('Тренировочные программы не найдены');
  //         return;
  //       }

  //       final programStartDate = DateTime.parse(user.programStartDate!);

  //       final now = DateTime.now();
  //       currentProgramWeek = now.difference(programStartDate).inDays ~/ 7 + 1;

  //       if (currentProgramWeek == null) {
  //         loading = false;
  //         error = 'Текущая неделя не найдена';
  //         print('Текущая неделя не найдена');
  //         return;
  //       }

  //       if ((trainingProgram!.weeks.length < currentProgramWeek!) && (trainingProgram!.isPermanent == false)) {
  //         isEndOfProgram = true;
  //         return;
  //       }

  //       weekSelected = trainingProgram!.weeks[currentProgramWeek! - 1];
  //       loading = false;
  //     }

  //     print('Program: ${trainingProgram!.name}:::\n\nWeek: $currentProgramWeek:::\nisEnd: $isEndOfProgram');
  //   } catch (e) {
  //     loading = false;
  //     error = e.toString();
  //     print(e);
  //   }
  // }

  // Future<void> loadUserData() async {
  //   final userSnapshot = await AppSupabase.instance.client.from('User').select().eq('fb_id', currentUserUid).single();

  //   final difficultyId = userSnapshot['exerciseDifficulty'];

  //   final loadedTrainingProgram =
  //       await AppSupabase.instance.client.from('TrainingProgram').select().eq('difficulty', difficultyId);

  //   final programStart = DateTime.parse(userSnapshot["programStartDate"]);
  //   final now = DateTime.now();
  //   final currentWeek = now.difference(programStart).inDays ~/ 7 + 1;

  //   final loadedTrainingProgramWeek =
  //       await AppSupabase.instance.client.from('TrainingProgramWeek').select().eq('week', currentWeek);

  //   final loadedTrainingProgramWeekDay = await AppSupabase.instance.client.from('TrainingProgramWeekDay').select();

  //   final loadedTrainingProgramWeekDayExercise =
  //       await AppSupabase.instance.client.from('TrainingProgramWeekDayExercise').select();

  //   final loadedExercises =
  //       await AppSupabase.instance.client.from('Exercise').select().eq('difficultyId', difficultyId);

  //   // сохраняем в поля модели
  //   user = userSnapshot;
  //   exercises = loadedExercises;
  //   trainingPrograms = loadedTrainingProgram;
  //   trainingProgramWeeks = loadedTrainingProgramWeek;
  //   trainingProgramWeekDays = loadedTrainingProgramWeekDay;
  //   trainingTrainingProgramWeekDayExercises = loadedTrainingProgramWeekDayExercise;
  // }

  @override
  void dispose() {}
}

final program = {
  "id": 1,
  "name": "Программа 1",
  "difficulty": 1,
  "isPermonent": true,
  "weeks": [
    {
      "week_number": 1,
      "days": [
        {
          "name": "",
          "day_number": 1,
          "exercises": [
            {"exercise_id": 5, "approach": 3, "repetitions": 12, "weight": 4},
            {"exercise_id": 6, "approach": 3, "repetitions": 10, "weight": 10},
            {"exercise_id": 7, "approach": 2, "repetitions": 10, "weight": 10}
          ]
        },
        {
          "day_number": 2,
          "exercises": [1, 2, 3]
        },
        {
          "day_number": 3,
          "exercises": [1, 2, 3]
        },
        {
          "day_number": 4,
          "exercises": [1, 2, 3]
        },
        {
          "day_number": 5,
          "exercises": [1, 2, 3]
        },
        {
          "day_number": 6,
          "exercises": [1, 2, 3]
        },
        {
          "day_number": 7,
          "exercises": [1, 2, 3]
        },
      ]
    }
  ],
};
