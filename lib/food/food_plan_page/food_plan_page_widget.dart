import 'package:boom_client/auth/firebase_auth/auth_util.dart';
import 'package:boom_client/flutter_flow/custom_functions.dart';
import 'package:flutter/rendering.dart';

import '../../backend/supabase/supabase.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/food/food_plan_food_list_view/food_plan_food_list_view_widget.dart';
import '/food/food_plan_food_recipe_view/food_plan_food_recipe_view_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_plan_page_model.dart';
export 'food_plan_page_model.dart';

class FoodPlanPageWidget extends StatefulWidget {
  const FoodPlanPageWidget({super.key});

  static String routeName = 'FoodPlanPage';
  static String routePath = '/foodPlanPage';

  @override
  State<FoodPlanPageWidget> createState() => _FoodPlanPageWidgetState();
}

class _FoodPlanPageWidgetState extends State<FoodPlanPageWidget> {
  late FoodPlanPageModel _model;

  // Примерные списки блюд для замены
  final List<Map<String, dynamic>> breakfastMeals = [
    {
      'dish_name': 'Овсянка с фруктами',
      'ingredients': [
        {'name': 'Овсяные хлопья', 'amount': '50г'},
        {'name': 'Яблоко', 'amount': '1 шт'},
        {'name': 'Мёд', 'amount': '1 ч.л.'},
      ],
      'recipe': 'Сварите овсянку, добавьте нарезанные фрукты и мёд.',
    },
    {
      'dish_name': 'Яичница с овощами',
      'ingredients': [
        {'name': 'Яйца', 'amount': '2 шт'},
        {'name': 'Помидор', 'amount': '1 шт'},
        {'name': 'Перец', 'amount': '0.5 шт'},
      ],
      'recipe': 'Обжарьте овощи, добавьте яйца и жарьте до готовности.',
    },
    {
      'dish_name': 'Творог с ягодами',
      'ingredients': [
        {'name': 'Творог', 'amount': '100г'},
        {'name': 'Ягоды', 'amount': '50г'},
        {'name': 'Мёд', 'amount': '1 ч.л.'},
      ],
      'recipe': 'Смешайте творог с ягодами и мёдом.',
    },
  ];

  final List<Map<String, dynamic>> lunchMeals = [
    {
      'dish_name': 'Куриная грудка с рисом',
      'ingredients': [
        {'name': 'Куриная грудка', 'amount': '120г'},
        {'name': 'Рис', 'amount': '60г'},
        {'name': 'Овощи', 'amount': '100г'},
      ],
      'recipe': 'Отварите рис. Обжарьте куриную грудку и овощи.',
    },
    {
      'dish_name': 'Гречка с тушёной говядиной',
      'ingredients': [
        {'name': 'Гречка', 'amount': '60г'},
        {'name': 'Говядина', 'amount': '100г'},
        {'name': 'Лук', 'amount': '0.5 шт'},
      ],
      'recipe': 'Отварите гречку, потушите говядину с луком.',
    },
    {
      'dish_name': 'Паста с курицей и брокколи',
      'ingredients': [
        {'name': 'Паста', 'amount': '60г'},
        {'name': 'Курица', 'amount': '100г'},
        {'name': 'Брокколи', 'amount': '80г'},
      ],
      'recipe': 'Отварите пасту и брокколи, обжарьте курицу, смешайте.',
    },
  ];

  final List<Map<String, dynamic>> dinnerMeals = [
    {
      'dish_name': 'Запечённая рыба с овощами',
      'ingredients': [
        {'name': 'Рыба', 'amount': '120г'},
        {'name': 'Овощи', 'amount': '100г'},
        {'name': 'Лимон', 'amount': '1 долька'},
      ],
      'recipe': 'Запеките рыбу с овощами и лимоном.',
    },
    {
      'dish_name': 'Омлет с зеленью',
      'ingredients': [
        {'name': 'Яйца', 'amount': '2 шт'},
        {'name': 'Молоко', 'amount': '50мл'},
        {'name': 'Зелень', 'amount': 'по вкусу'},
      ],
      'recipe': 'Взбейте яйца с молоком и зеленью, обжарьте.',
    },
    {
      'dish_name': 'Тушёные овощи с индейкой',
      'ingredients': [
        {'name': 'Индейка', 'amount': '100г'},
        {'name': 'Овощи', 'amount': '120г'},
        {'name': 'Масло', 'amount': '1 ч.л.'},
      ],
      'recipe': 'Потушите индейку с овощами на масле.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodPlanPageModel());
    _model.daySelected = 1;

    // Загрузка плана питания из Supabase
    () async {
      // Получаем текущего пользователя
      final uUid = currentUserUid;
      if (uUid == null) return;
      final response = await AppSupabase.instance.client.from('nutrition_program').select('id').eq('user_id', uUid).order('created_at', ascending: false).limit(1).maybeSingle();

      if (response != null) {
        final programId = response['id'] as String;

        final daysResponse = await AppSupabase.instance.client.from('nutrition_day').select('id, date').eq('program_id', programId).order('date');

        final mealsResponse = await AppSupabase.instance.client.from('nutrition_meal').select().inFilter('day_id', daysResponse.map((d) => d['id']).toList());

        setState(() {
          _model.days = List.generate(
            daysResponse.length,
            (i) => i + 1,
          );

          _model.mealsByDay = {
            for (var day in daysResponse) DateTime.parse(day['date']): mealsResponse.where((m) => m['day_id'] == day['id']).toList(),
          };
        });
      }
    }();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.generalNavBar01Model,
                updateCallback: () => safeSetState(() {}),
                child: GeneralNavBar01Widget(
                  title: 'План питания',
                  hideBack: false,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor: Color(0x2D000000),
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () {
                                            FocusScope.of(context).unfocus();
                                            FocusManager.instance.primaryFocus?.unfocus();
                                          },
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(context),
                                            child: FoodPlanFoodListViewWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context).secondary,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
                                              child: SvgPicture.asset(
                                                'assets/images/icon0001.svg',
                                                width: 30.0,
                                                height: 30.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Список продуктов',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        font: GoogleFonts.unbounded(
                                                          fontWeight: FontWeight.w600,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FontWeight.w600,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Список продуктов на (7 дней)',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          font: GoogleFonts.inter(
                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                          letterSpacing: 0.0,
                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            size: 14.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'План питания (7 дней)',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.unbounded(
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                            ),
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                          ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                  //   child: InkWell(
                                  //     splashColor: Colors.transparent,
                                  //     focusColor: Colors.transparent,
                                  //     hoverColor: Colors.transparent,
                                  //     highlightColor: Colors.transparent,
                                  //     onTap: () async {
                                  //       context.safePop();
                                  //     },
                                  //     child: Container(
                                  //       decoration: BoxDecoration(
                                  //         color: FlutterFlowTheme.of(context).secondaryBackground,
                                  //         borderRadius: BorderRadius.circular(100.0),
                                  //         border: Border.all(
                                  //           color: Color(0xFF696576),
                                  //           width: 1.0,
                                  //         ),
                                  //       ),
                                  //       child: Padding(
                                  //         padding: EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 8.0, 6.0),
                                  //         child: Text(
                                  //           'Изменить',
                                  //           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  //                 font: GoogleFonts.unbounded(
                                  //                   fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                   fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //                 ),
                                  //                 fontSize: 11.0,
                                  //                 letterSpacing: 0.0,
                                  //                 fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                  //                 fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  //               ),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final daysList = _model.days.toList();

                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(daysList.length, (daysListIndex) {
                                          final daysListItem = daysList[daysListIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.daySelected = daysListItem;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                borderRadius: BorderRadius.circular(100.0),
                                                border: Border.all(
                                                  color: _model.daySelected == daysListItem ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondaryText,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 8.0, 6.0),
                                                child: Text(
                                                  'День ${daysListItem.toString()}',
                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        font: GoogleFonts.unbounded(
                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                        ),
                                                        color: _model.daySelected == daysListItem ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondaryText,
                                                        fontSize: 11.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).divide(SizedBox(width: 4.0)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      // color: FlutterFlowTheme.of(context).secondary,
                                      // borderRadius: BorderRadius.circular(12.0),
                                      ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // MARK: Пример завтрака. Обед и ужин такие же
                                      if (_model.mealsByDay.isNotEmpty) ...[
                                        // Сортируем блюда по типу приёма пищи
                                        ...(() {
                                          final dayMeals = _model.mealsByDay.values.elementAt(_model.daySelected - 1);
                                          final sortedMeals = List<Map<String, dynamic>>.from(dayMeals)
                                            ..sort((a, b) {
                                              const order = {'завтрак': 0, 'обед': 1, 'ужин': 2};
                                              return (order[a['type']] ?? 99).compareTo(order[b['type']] ?? 99);
                                            });
                                          return [
                                            for (var meal in sortedMeals) renderDayMeal(meal),
                                          ];
                                        })(),
                                      ]
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderDayMeal(Map<String, dynamic> meal) {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
              child: Text(
                capitalize(meal['type'] ?? 'Приём пищи'),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.unbounded(
                        fontWeight: FontWeight.w600,
                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 15,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
              child: Wrap(
                spacing: 8,
                runSpacing: 0,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.horizontal,
                runAlignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                clipBehavior: Clip.none,
                children: [
                  if (meal['kcal'] != null)
                    Text(
                      '${meal['kcal']?.toString() ?? '-'} ккал',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                    ),
                  if (meal['proteins'] != null)
                    Text(
                      '${meal['proteins']?.toString() ?? '-'} г белка',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                    ),
                  if (meal['fats'] != null)
                    Text(
                      '${meal['fats']?.toString() ?? '-'} г жиров',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                    ),
                  if (meal['carbs'] != null)
                    Text(
                      '${meal['carbs']?.toString() ?? '-'} г углеводов',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 12,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                    ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              decoration: const BoxDecoration(
                color: Color(0xFF302E36),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: SvgPicture.asset(
                            'assets/images/star0001.svg',
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              meal['dish_name'] ?? '',
                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.unbounded(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                    ),
                                    fontSize: 15,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                            ),
                            if (meal['dish_description'] != null)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                child: Text(
                                  meal['dish_description'] ?? '',
                                  style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        fontSize: 12,
                                      ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Color(0xFF302E36),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: Color(0x43000000),
                  enableDrag: false,
                  context: context,
                  builder: (context) {
                    final rawIngredients = meal['ingredients'];
                    final ingredients = rawIngredients is String
                        ? (jsonDecode(rawIngredients) as List<dynamic>).cast<Map<String, dynamic>>()
                        : (rawIngredients as List<dynamic>).cast<Map<String, dynamic>>();
                    return GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: FoodPlanFoodRecipeViewWidget(
                          title: meal['dish_name'] ?? '',
                          ingredients: ingredients,
                          instructions: meal['recipe'] ?? '',
                        ),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0),
                      child: SvgPicture.asset(
                        'assets/images/Eye.svg',
                        width: 16,
                        height: 16,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                      child: Text(
                        'Рецепт',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.unbounded(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              ),
                              fontSize: 12,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                final currentType = meal['type'] ?? '';
                final mealsList = currentType == 'завтрак'
                    ? breakfastMeals
                    : currentType == 'обед'
                        ? lunchMeals
                        : dinnerMeals;

                final newMeal = (mealsList.toList()
                      ..removeWhere((m) => m['dish_name'] == meal['dish_name']))
                    .toList()
                  ..shuffle();
                if (newMeal.isEmpty) return;

                final selected = newMeal.first;

                final updatedMeal = {
                  'dish_name': selected['dish_name'],
                  'ingredients': selected['ingredients'],
                  'recipe': selected['recipe'],
                };

                await AppSupabase.instance.client
                    .from('nutrition_meal')
                    .update(updatedMeal)
                    .eq('id', meal['id']);

                setState(() {
                  final dayMeals = _model.mealsByDay.values.elementAt(_model.daySelected - 1);
                  final index = dayMeals.indexWhere((m) => m['id'] == meal['id']);
                  if (index != -1) {
                    dayMeals[index] = Map<String, dynamic>.from({
                      ...dayMeals[index] as Map,
                      ...updatedMeal,
                    });
                  }
                });
              },
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/Restart_Circle.svg',
                      width: 16,
                      height: 16,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                      child: Text(
                        'Заменить блюдо',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.unbounded(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                              ),
                              fontSize: 12,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Widget renderDayMeal() {
//   return Container(
//     margin: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
//     child: Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: FlutterFlowTheme
//             .of(context)
//             .secondary,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.max,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
//             child: Text(
//               //MARK: Завтрак, обед или ужин
//               'Завтрак',
//               style: FlutterFlowTheme
//                   .of(context)
//                   .bodyMedium
//                   .override(
//                 font: GoogleFonts.unbounded(
//                   fontWeight: FontWeight.w600,
//                   fontStyle: FlutterFlowTheme
//                       .of(context)
//                       .bodyMedium
//                       .fontStyle,
//                 ),
//                 fontSize: 15,
//                 letterSpacing: 0.0,
//                 fontWeight: FontWeight.w600,
//                 fontStyle:
//                 FlutterFlowTheme
//                     .of(context)
//                     .bodyMedium
//                     .fontStyle,
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
//             child: Wrap(
//               spacing: 8,
//               runSpacing: 0,
//               alignment: WrapAlignment.start,
//               crossAxisAlignment: WrapCrossAlignment.start,
//               direction: Axis.horizontal,
//               runAlignment: WrapAlignment.start,
//               verticalDirection: VerticalDirection.down,
//               clipBehavior: Clip.none,
//               children: [
//                 //MARK: Калории
//                 Text(
//                   '400 ккал',
//                   style: FlutterFlowTheme
//                       .of(context)
//                       .bodyMedium
//                       .override(
//                     font: GoogleFonts.inter(
//                       fontWeight: FlutterFlowTheme
//                           .of(context)
//                           .bodyMedium
//                           .fontWeight,
//                       fontStyle: FlutterFlowTheme
//                           .of(context)
//                           .bodyMedium
//                           .fontStyle,
//                     ),
//                     color: FlutterFlowTheme
//                         .of(context)
//                         .secondaryText,
//                     fontSize: 12,
//                     letterSpacing: 0.0,
//                     fontWeight: FlutterFlowTheme
//                         .of(context)
//                         .bodyMedium
//                         .fontWeight,
//                     fontStyle: FlutterFlowTheme
//                         .of(context)
//                         .bodyMedium
//                         .fontStyle,
//                   ),
//                 ),
//                 //MARK: белки
//                 Text(
//                   '12 г белка',
//                   style: FlutterFlowTheme
//                       .of(context)
//                       .bodyMedium
//                       .override(
//                     font: GoogleFonts.inter(
//                       fontWeight: FlutterFlowTheme
//                           .of(context)
//                           .bodyMedium
//                           .fontWeight,
//                       fontStyle: FlutterFlowTheme
//                           .of(context)
//                           .bodyMedium
//                           .fontStyle,
//                     ),
//                     color: FlutterFlowTheme
//                         .of(context)
//                         .secondaryText,
//                     fontSize: 12,
//                     letterSpacing: 0.0,
//                     fontWeight: FlutterFlowTheme
//                         .of(context)
//                         .bodyMedium
//                         .fontWeight,
//                     fontStyle: FlutterFlowTheme
//                         .of(context)
//                         .bodyMedium
//                         .fontStyle,
//                   ),
//                 ),
//                 //MARK: Жиры
//                 Text(
//                   '10 г жиров',
//                   style: FlutterFlowTheme
//                       .of(context)
//                       .bodyMedium
//                       .override(
//                     font: GoogleFonts.inter(
//                       fontWeight: FlutterFlowTheme
//                           .of(context)
//                           .bodyMedium
//                           .fontWeight,
//                       fontStyle: FlutterFlowTheme
//                           .of(context)
//                           .bodyMedium
//                           .fontStyle,
//                     ),
//                     color: FlutterFlowTheme
//                         .of(context)
//                         .secondaryText,
//                     fontSize: 12,
//                     letterSpacing: 0.0,
//                     fontWeight: FlutterFlowTheme
//                         .of(context)
//                         .bodyMedium
//                         .fontWeight,
//                     fontStyle: FlutterFlowTheme
//                         .of(context)
//                         .bodyMedium
//                         .fontStyle,
//                   ),
//                 ),
//                 //MARK: Углеводы
//                 Text(
//                   '65 г углеводов',
//                   style: FlutterFlowTheme
//                       .of(context)
//                       .bodyMedium
//                       .override(
//                     font: GoogleFonts.inter(
//                       fontWeight: FlutterFlowTheme
//                           .of(context)
//                           .bodyMedium
//                           .fontWeight,
//                       fontStyle: FlutterFlowTheme
//                           .of(context)
//                           .bodyMedium
//                           .fontStyle,
//                     ),
//                     color: FlutterFlowTheme
//                         .of(context)
//                         .secondaryText,
//                     fontSize: 12,
//                     letterSpacing: 0.0,
//                     fontWeight: FlutterFlowTheme
//                         .of(context)
//                         .bodyMedium
//                         .fontWeight,
//                     fontStyle: FlutterFlowTheme
//                         .of(context)
//                         .bodyMedium
//                         .fontStyle,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             height: 1,
//             decoration: BoxDecoration(
//               color: Color(0xFF302E36),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
//             child: InkWell(
//               splashColor: Colors.transparent,
//               focusColor: Colors.transparent,
//               hoverColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//               onTap: () async {
//                 context.safePop();
//               },
//               child: Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: FlutterFlowTheme
//                       .of(context)
//                       .secondary,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding:
//                         EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(8),
//                           child: SvgPicture.asset(
//                             'assets/images/star0001.svg',
//                             width: 30,
//                             height: 30,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // MARK: Название блюда
//                             Text(
//                               'Овсянка с фруктами',
//                               style: FlutterFlowTheme
//                                   .of(context)
//                                   .bodyMedium
//                                   .override(
//                                 font: GoogleFonts.unbounded(
//                                   fontWeight: FontWeight.w600,
//                                   fontStyle:
//                                   FlutterFlowTheme
//                                       .of(context)
//                                       .bodyMedium
//                                       .fontStyle,
//                                 ),
//                                 fontSize: 15,
//                                 letterSpacing: 0.0,
//                                 fontWeight: FontWeight.w600,
//                                 fontStyle:
//                                 FlutterFlowTheme
//                                     .of(context)
//                                     .bodyMedium
//                                     .fontStyle,
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsetsDirectional.fromSTEB(
//                                   0, 4, 0, 0),
//                               child: Text(
//                                 'Улучшает пищеварение, энергия на весь день, полезно для мозга',
//                                 style: FlutterFlowTheme
//                                     .of(context)
//                                     .bodyMedium
//                                     .override(
//                                   font: GoogleFonts.inter(
//                                     fontWeight:
//                                     FlutterFlowTheme
//                                         .of(context)
//                                         .bodyMedium
//                                         .fontWeight,
//                                     fontStyle:
//                                     FlutterFlowTheme
//                                         .of(context)
//                                         .bodyMedium
//                                         .fontStyle,
//                                   ),
//                                   color: FlutterFlowTheme
//                                       .of(context)
//                                       .secondaryText,
//                                   letterSpacing: 0.0,
//                                   fontWeight:
//                                   FlutterFlowTheme
//                                       .of(context)
//                                       .bodyMedium
//                                       .fontWeight,
//                                   fontStyle:
//                                   FlutterFlowTheme
//                                       .of(context)
//                                       .bodyMedium
//                                       .fontStyle,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             height: 1,
//             decoration: BoxDecoration(
//               color: Color(0xFF302E36),
//             ),
//           ),
//           InkWell(
//             splashColor: Colors.transparent,
//             focusColor: Colors.transparent,
//             hoverColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//             onTap: () async {
//               context.safePop();
//             },
//             child: Container(
//               width: double.infinity,
//               height: 48,
//               decoration: BoxDecoration(),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(0),
//                     child: SvgPicture.asset(
//                       'assets/images/Eye.svg',
//                       width: 16,
//                       height: 16,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
//                     child: Text(
//                       'Рецепт',
//                       style: FlutterFlowTheme
//                           .of(context)
//                           .bodyMedium
//                           .override(
//                         font: GoogleFonts.unbounded(
//                           fontWeight: FontWeight.w500,
//                           fontStyle: FlutterFlowTheme
//                               .of(context)
//                               .bodyMedium
//                               .fontStyle,
//                         ),
//                         fontSize: 12,
//                         letterSpacing: 0.0,
//                         fontWeight: FontWeight.w500,
//                         fontStyle: FlutterFlowTheme
//                             .of(context)
//                             .bodyMedium
//                             .fontStyle,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           InkWell(
//             splashColor: Colors.transparent,
//             focusColor: Colors.transparent,
//             hoverColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//             onTap: () async {
//               await showModalBottomSheet(
//                 isScrollControlled: true,
//                 backgroundColor: Colors.transparent,
//                 barrierColor: Color(0x25000000),
//                 enableDrag: false,
//                 context: context,
//                 builder: (context) {
//                   return GestureDetector(
//                     onTap: () {
//                       FocusScope.of(context).unfocus();
//                       FocusManager.instance.primaryFocus?.unfocus();
//                     },
//                     child: Padding(
//                       padding: MediaQuery.viewInsetsOf(context),
//                       child: FoodPlanFoodRecipeViewWidget(),
//                     ),
//                   );
//                 },
//               ).then((value) => safeSetState(() {}));
//             },
//             child: Container(
//               width: double.infinity,
//               height: 48,
//               decoration: BoxDecoration(
//                 color: FlutterFlowTheme
//                     .of(context)
//                     .primary,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(12),
//                   bottomRight: Radius.circular(12),
//                   topLeft: Radius.circular(0),
//                   topRight: Radius.circular(0),
//                 ),
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.max,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(0),
//                     child: SvgPicture.asset(
//                       'assets/images/Restart_Circle1423523.svg',
//                       width: 16,
//                       height: 16,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
//                     child: Text(
//                       'Заменить блюдо',
//                       style: FlutterFlowTheme
//                           .of(context)
//                           .bodyMedium
//                           .override(
//                         font: GoogleFonts.unbounded(
//                           fontWeight: FontWeight.w500,
//                           fontStyle: FlutterFlowTheme
//                               .of(context)
//                               .bodyMedium
//                               .fontStyle,
//                         ),
//                         fontSize: 12,
//                         letterSpacing: 0.0,
//                         fontWeight: FontWeight.w500,
//                         fontStyle: FlutterFlowTheme
//                             .of(context)
//                             .bodyMedium
//                             .fontStyle,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
}
