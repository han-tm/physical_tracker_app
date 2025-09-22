import 'package:boom_client/flutter_flow/custom_functions.dart';

import '../../auth/firebase_auth/auth_util.dart';
import '../../backend/supabase/database/database.dart';
import '/components/general_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'food_ai_nutritionist_view_model.dart';
export 'food_ai_nutritionist_view_model.dart';

class FoodAiNutritionistViewWidget extends StatefulWidget {
  const FoodAiNutritionistViewWidget({super.key});

  @override
  State<FoodAiNutritionistViewWidget> createState() => _FoodAiNutritionistViewWidgetState();
}

class _FoodAiNutritionistViewWidgetState extends State<FoodAiNutritionistViewWidget> {
  late FoodAiNutritionistViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodAiNutritionistViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        margin: EdgeInsets.only(top: WidgetsBinding.instance.window.padding.top),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF1A191D),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16, left: 16,right: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondary,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'ИИ-нутрициолог',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.unbounded(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                            ),
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Параметры плана питания',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.unbounded(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  'Количество дней',
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [3, 5, 7].map((d) {
                                    final selected = _model.selectedDays == d;
                                    return selected
                                        ? selectedOption(getExperienceString(
                                        d,
                                        "день",
                                        "дня",
                                        "дней",
                                        false
                                    ))
                                        : unselectedOption(getExperienceString(
                                        d,
                                        "день",
                                        "дня",
                                        "дней",
                                        false
                                    ), () {
                                      _model.selectedDays = d;
                                      setState(() {});
                                    });
                                  }).toList(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  'Приемов пищи в день',
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [3, 4, 5].map((d) {
                                    final selected = _model.selectedMeals == d;
                                    return selected
                                        ? selectedOption(
                                        getExperienceString(
                                            d,
                                            "прием",
                                            "приема",
                                            "приемов",
                                            false
                                        ))
                                        : unselectedOption(getExperienceString(
                                        d,
                                        "прием",
                                        "приема",
                                        "приемов",
                                        false
                                    ), () {
                                      _model.selectedMeals = d;
                                      setState(() {});
                                    });
                                  }).toList(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                child: Text(
                                  'Бюджет на неделю',
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                // child: Wrap(
                                //   spacing: 8.0,
                                //   runSpacing: 8.0,
                                //   alignment: WrapAlignment.start,
                                //   crossAxisAlignment: WrapCrossAlignment.start,
                                //   direction: Axis.horizontal,
                                //   runAlignment: WrapAlignment.start,
                                //   verticalDirection: VerticalDirection.down,
                                //   clipBehavior: Clip.none,
                                //   children: [
                                //     Container(
                                //       decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(100.0),
                                //         border: Border.all(
                                //           color: Color(0xFF302E36),
                                //         ),
                                //       ),
                                //       child: Padding(
                                //         padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                //         child: Text(
                                //           'Экономичный (до 3000Р)',
                                //           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //             font: GoogleFonts.inter(
                                //               fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //             ),
                                //             fontSize: 15.0,
                                //             letterSpacing: 0.0,
                                //             fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //             fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //     Container(
                                //       decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(100.0),
                                //         border: Border.all(
                                //           color: Color(0xFF302E36),
                                //         ),
                                //       ),
                                //       child: Padding(
                                //         padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                //         child: Text(
                                //           'Стандартный (3000-5000Р)',
                                //           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //             font: GoogleFonts.inter(
                                //               fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //             ),
                                //             fontSize: 15.0,
                                //             letterSpacing: 0.0,
                                //             fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //             fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //     Container(
                                //       decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(100.0),
                                //         border: Border.all(
                                //           color: Color(0xFF302E36),
                                //         ),
                                //       ),
                                //       child: Padding(
                                //         padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                //         child: Text(
                                //           'Без ограничений (5000P+)',
                                //           style: FlutterFlowTheme.of(context).bodyMedium.override(
                                //             font: GoogleFonts.inter(
                                //               fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //               fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //             ),
                                //             fontSize: 15.0,
                                //             letterSpacing: 0.0,
                                //             fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                //             fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                child: Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      {'label': 'Экономичный (до 3000Р)', 'value': 1},
                                      {'label': 'Стандартный (3000-5000Р)', 'value': 2},
                                      {'label': 'Без ограничений (5000P+)', 'value': 3},
                                    ].map((b) {
                                      final selected = _model.selectedBudget == b['value'];

                                      return selected
                                          ? selectedOption("${b['label']}")
                                          : unselectedOption("${b['label']}", () {
                                        _model.selectedBudget = int.parse("${b['value']}");
                                        setState(() {});
                                      });
                                    }).toList(),
                                  ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Обязательные продукты',
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: ['Курица', 'Рис', 'Творог', 'Бананы'].map((item) {
                                    final selected = _model.requiredProducts.contains(item);
                                    // return selected
                                    //     ? selectedOption("$item")
                                    //     : unselectedOption("$item", () {
                                    //   if (selected) {
                                    //     _model.requiredProducts.remove(item);
                                    //   } else {
                                    //     _model.requiredProducts.add(item);
                                    //   }
                                    //   setState(() {});
                                    // });
                                    return InkWell(
                                      onTap: () => setState(() {
                                        if (selected) {
                                          _model.requiredProducts.remove(item);
                                        } else {
                                          _model.requiredProducts.add(item);
                                        }
                                      }),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: selected
                                              ? FlutterFlowTheme.of(context).primary.withOpacity(0.1)
                                              : FlutterFlowTheme.of(context).secondaryBackground,
                                          border: Border.all(
                                            color: selected
                                                ? FlutterFlowTheme.of(context).primary
                                                : FlutterFlowTheme.of(context).alternate,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          item,
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontWeight: FontWeight.bold,
                                            color: selected
                                                ? FlutterFlowTheme.of(context).primary
                                                : FlutterFlowTheme.of(context).primaryText,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondary,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Исключить из рациона',
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
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: ['Молоко', 'Глютен', 'Сахар', 'Свинина'].map((item) {
                                    final selected = _model.excludedProducts.contains(item);
                                    return InkWell(
                                      onTap: () => setState(() {
                                        if (selected) {
                                          _model.excludedProducts.remove(item);
                                        } else {
                                          _model.excludedProducts.add(item);
                                        }
                                      }),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: selected
                                              ? FlutterFlowTheme.of(context).primary.withOpacity(0.1)
                                              : FlutterFlowTheme.of(context).secondaryBackground,
                                          border: Border.all(
                                            color: selected
                                                ? FlutterFlowTheme.of(context).primary
                                                : FlutterFlowTheme.of(context).alternate,
                                          ),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          item,
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            fontWeight: FontWeight.bold,
                                            color: selected
                                                ? FlutterFlowTheme.of(context).primary
                                                : FlutterFlowTheme.of(context).primaryText,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                child: wrapWithModel(
                  model: _model.generalButtonModel,
                  updateCallback: () => safeSetState(() {}),
                  child: GeneralButtonWidget(
                    title: 'Создать план питания',
                    isActive: _model.selectedMeals != null,
                    onTap: () async {
                      final userId = currentUserUid;

                      final programInsert = await AppSupabase.instance.client
                          .from('nutrition_program')
                          .insert({
                        'user_id': userId,
                        'days_count': _model.selectedDays,
                        'meals_per_day': _model.selectedMeals,
                        'budget_type': _model.selectedBudget,
                        'required_products': _model.requiredProducts.toList(),
                        'excluded_products': _model.excludedProducts.toList(),
                      })
                          .select()
                          .single();

                      final programId = programInsert['id'] as String;
                      final now = DateTime.now();

                      // Добавляем дни
                      final days = List.generate(_model.selectedDays, (i) {
                        final date = now.add(Duration(days: i));
                        return {
                          'program_id': programId,
                          'date': date.toIso8601String(),
                        };
                      });

                      final insertedDays = await AppSupabase.instance.client
                          .from('nutrition_day')
                          .insert(days)
                          .select();

                      // --- Новый код генерации и вставки приёмов пищи ---
                      final breakfastMeals = [
                        {
                          'dish_name': 'Омлет с овощами',
                          'recipe': 'Смешайте яйца с молоком, нарежьте овощи, обжарьте на сковороде. Добавьте яичную смесь, готовьте до готовности.',
                          'ingredients': [
                            {'name': 'Яйца', 'amount': '2 шт'},
                            {'name': 'Помидоры', 'amount': '1 шт'},
                            {'name': 'Перец', 'amount': '0.5 шт'},
                            {'name': 'Молоко', 'amount': '50 мл'},
                          ],
                        },
                        {
                          'dish_name': 'Овсянка с бананом и орехами',
                          'recipe': 'Сварите овсянку на молоке, добавьте нарезанный банан, мёд и орехи.',
                          'ingredients': [
                            {'name': 'Овсяные хлопья', 'amount': '60 г'},
                            {'name': 'Молоко', 'amount': '200 мл'},
                            {'name': 'Банан', 'amount': '1 шт'},
                            {'name': 'Орехи', 'amount': '10 г'},
                          ],
                        },
                        {
                          'dish_name': 'Творожная запеканка',
                          'recipe': 'Смешайте все ингредиенты, выложите в форму и выпекайте при 180°C 20–25 минут.',
                          'ingredients': [
                            {'name': 'Творог', 'amount': '150 г'},
                            {'name': 'Яйцо', 'amount': '1 шт'},
                            {'name': 'Изюм', 'amount': '10 г'},
                            {'name': 'Манка', 'amount': '1 ст.л.'},
                          ],
                        },
                      ];

                      final lunchMeals = [
                        {
                          'dish_name': 'Куриное филе с гречкой',
                          'recipe': 'Отварите гречку. Куриное филе и овощи обжарьте, затем тушите с гречкой до готовности.',
                          'ingredients': [
                            {'name': 'Куриное филе', 'amount': '150 г'},
                            {'name': 'Гречка', 'amount': '70 г'},
                            {'name': 'Морковь', 'amount': '0.5 шт'},
                            {'name': 'Лук', 'amount': '0.5 шт'},
                          ],
                        },
                        {
                          'dish_name': 'Рис с овощами и индейкой',
                          'recipe': 'Отварите рис. Обжарьте индейку и овощи, добавьте рис и немного соевого соуса. Прогрейте всё вместе.',
                          'ingredients': [
                            {'name': 'Индейка', 'amount': '150 г'},
                            {'name': 'Рис', 'amount': '70 г'},
                            {'name': 'Брокколи', 'amount': '50 г'},
                            {'name': 'Морковь', 'amount': '0.5 шт'},
                          ],
                        },
                        {
                          'dish_name': 'Суп из чечевицы',
                          'recipe': 'Отварите чечевицу с овощами до мягкости, добавьте специи. Пробейте блендером (по желанию).',
                          'ingredients': [
                            {'name': 'Чечевица', 'amount': '70 г'},
                            {'name': 'Морковь', 'amount': '1 шт'},
                            {'name': 'Лук', 'amount': '1 шт'},
                            {'name': 'Сельдерей', 'amount': '1 стебель'},
                          ],
                        },
                      ];

                      final dinnerMeals = [
                        {
                          'dish_name': 'Запечённая рыба с овощами',
                          'recipe': 'Выложите рыбу и овощи в форму, сбрызните лимонным соком и запекайте 20–25 мин при 180°C.',
                          'ingredients': [
                            {'name': 'Филе рыбы', 'amount': '150 г'},
                            {'name': 'Цукини', 'amount': '0.5 шт'},
                            {'name': 'Помидор', 'amount': '1 шт'},
                            {'name': 'Лимон', 'amount': 'долька'},
                          ],
                        },
                        {
                          'dish_name': 'Салат с курицей и киноа',
                          'recipe': 'Киноа отварите, смешайте с нарезанными овощами и курицей. Заправьте маслом.',
                          'ingredients': [
                            {'name': 'Курица', 'amount': '100 г'},
                            {'name': 'Киноа', 'amount': '50 г'},
                            {'name': 'Салат', 'amount': '50 г'},
                            {'name': 'Помидоры черри', 'amount': '3 шт'},
                          ],
                        },
                        {
                          'dish_name': 'Овощное рагу с фасолью',
                          'recipe': 'Обжарьте овощи, добавьте фасоль и томатную пасту. Тушите под крышкой до мягкости.',
                          'ingredients': [
                            {'name': 'Фасоль', 'amount': '100 г'},
                            {'name': 'Кабачок', 'amount': '0.5 шт'},
                            {'name': 'Перец', 'amount': '0.5 шт'},
                            {'name': 'Морковь', 'amount': '0.5 шт'},
                          ],
                        },
                      ];

                      for (final day in insertedDays) {
                        final dayId = day['id'];

                        final randomBreakfast = (breakfastMeals..shuffle()).first;
                        final randomLunch = (lunchMeals..shuffle()).first;
                        final randomDinner = (dinnerMeals..shuffle()).first;

                        final meals = [
                          {
                            'day_id': dayId,
                            'type': 'завтрак',
                            'dish_name': randomBreakfast['dish_name'],
                            'recipe': randomBreakfast['recipe'],
                            'ingredients': randomBreakfast['ingredients'],
                          },
                          {
                            'day_id': dayId,
                            'type': 'обед',
                            'dish_name': randomLunch['dish_name'],
                            'recipe': randomLunch['recipe'],
                            'ingredients': randomLunch['ingredients'],
                          },
                          {
                            'day_id': dayId,
                            'type': 'ужин',
                            'dish_name': randomDinner['dish_name'],
                            'recipe': randomDinner['recipe'],
                            'ingredients': randomDinner['ingredients'],
                          },
                        ];

                        for (final meal in meals) {
                          await AppSupabase.instance.client.from('nutrition_meal').insert(meal);
                        }
                      }
                      // --- Конец нового кода ---

                      context.safePop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectedOption(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: FlutterFlowTheme.of(context).primary),
      ),
      child: Text(
        label,
        style: FlutterFlowTheme.of(context).bodyMedium.override(
          fontWeight: FontWeight.bold,
          color: FlutterFlowTheme.of(context).primary,
        ),
      ),
    );
  }

  Widget unselectedOption(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          border: Border.all(
            color: const Color(0xFF302E36),
          ),
        ),
        child: Text(label, style: FlutterFlowTheme.of(context).bodyMedium.override(
          font: GoogleFonts.inter(
            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
          ),
          fontSize: 15.0,
          letterSpacing: 0.0,
          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
        )),
      ),
    );
  }
}
