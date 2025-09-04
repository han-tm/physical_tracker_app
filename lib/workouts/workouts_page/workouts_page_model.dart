import 'package:firebase_auth/firebase_auth.dart';

import '../../auth/firebase_auth/auth_util.dart';
import '../../backend/supabase/supabase.dart';
import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'workouts_page_widget.dart' show WorkoutsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class WorkoutsPageModel extends FlutterFlowModel<WorkoutsPageWidget> {
  ///  Local state fields for this page.

  List<int> days = [1, 2, 3, 4, 5, 6, 7];
  void addToDays(int item) => days.add(item);
  void removeFromDays(int item) => days.remove(item);
  void removeAtIndexFromDays(int index) => days.removeAt(index);
  void insertAtIndexInDays(int index, int item) => days.insert(index, item);
  void updateDaysAtIndex(int index, Function(int) updateFn) =>
      days[index] = updateFn(days[index]);

  int daySelected = 1;

  bool individualProgramPreparing = false;

  Map<String, dynamic>? user;
  List<dynamic> exercises = [];
  List<dynamic> trainingPrograms = [];
  List<dynamic> trainingProgramWeeks = [];
  List<dynamic> trainingProgramWeekDays = [];
  List<dynamic> trainingTrainingProgramWeekDayExercises = [];

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

  Future<void> loadUserData() async {


    final userSnapshot = await AppSupabase.instance.client
        .from('User')
        .select()
        .eq('fb_id', currentUserUid)
        .single();

    final difficultyId = userSnapshot['exerciseDifficulty'];

    final loadedTrainingProgram = await AppSupabase.instance.client
        .from('TrainingProgram')
        .select()
        .eq('difficulty', difficultyId);

    final programStart = DateTime.parse(userSnapshot["programStartDate"]);
    final now = DateTime.now();
    final currentWeek = now.difference(programStart).inDays ~/ 7 + 1;

    final loadedTrainingProgramWeek = await AppSupabase.instance.client
        .from('TrainingProgramWeek')
        .select()
        .eq('week', currentWeek);

    final loadedTrainingProgramWeekDay = await AppSupabase.instance.client
        .from('TrainingProgramWeekDay')
        .select();



    final loadedTrainingProgramWeekDayExercise = await AppSupabase.instance.client
        .from('TrainingProgramWeekDayExercise')
        .select();

    final loadedExercises = await AppSupabase.instance.client
        .from('Exercise')
        .select()
        .eq('difficultyId', difficultyId);

    // сохраняем в поля модели
    user = userSnapshot;
    exercises = loadedExercises;
    trainingPrograms = loadedTrainingProgram;
    trainingProgramWeeks = loadedTrainingProgramWeek;
    trainingProgramWeekDays = loadedTrainingProgramWeekDay;
    trainingTrainingProgramWeekDayExercises = loadedTrainingProgramWeekDayExercise;
  }

  @override
  void dispose() {
    generalButtonModel1.dispose();
    generalButtonModel2.dispose();
  }
}
