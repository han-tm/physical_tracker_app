import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'policy_terms_page_model.dart';
export 'policy_terms_page_model.dart';

class PolicyTermsPageWidget extends StatefulWidget {
  const PolicyTermsPageWidget({
    super.key,
    required this.type,
  });

  final int? type;

  static String routeName = 'PolicyTermsPage';
  static String routePath = '/policyTermsPage';

  @override
  State<PolicyTermsPageWidget> createState() => _PolicyTermsPageWidgetState();
}

class _PolicyTermsPageWidgetState extends State<PolicyTermsPageWidget> {
  late PolicyTermsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PolicyTermsPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

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
                  title: widget.type == 0
                      ? 'Условия использования'
                      : 'Политика конфиденциальности',
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            widget.type == 0
                                ? 'Условия использования приложения «Physical Tracker»!, Дата последнего обновления: 25.05.2025  1. Введение  1.1. Настоящие условия использования (далее – «условия») регулируют отношения между [Название вашей компании] (далее – «Компания») и пользователем (далее – «Пользователь») мобильного приложения Bayke (далее – «приложение»).  1.2. Используя приложение, Пользователь соглашается с настоящими условиями.  2. Предмет условий  2.1. Приложение предоставляет Пользователю [краткое описание функционала приложения, например, возможность отслеживать финансы, ставить финансовые цели и т.д.].  3. Регистрация и доступ к приложению  3.1. Для использования некоторых функций приложения может потребоваться регистрация.  3.2. Пользователь несёт ответственность за конфиденциальность своих учётных данных.  4. Права и обязанности Пользователя  4.1. Пользователь имеет право использовать приложение в соответствии с настоящими условиями.  4.2. Пользователь обязуется не использовать приложение в незаконных целях.  5. Права и обязанности Компании  5.1. Компания имеет право изменять функционал приложения.  5.2. Компания обязуется обеспечивать конфиденциальность данных Пользователя.  6. Ответственность  6.1. Компания не несёт ответственности за [укажите случаи, например, убытки, возникшие в результате использования приложения].  7. Интеллектуальная собственность  7.1. Все права на приложение принадлежат Компании.  8. Изменение условий  8.1. Компания имеет право изменять настоящие условия в одностороннем порядке.  9. Применимое право  9.1. К настоящим условиям применяется законодательство [укажите страну].  10. Контактная информация  [ваша контактная информация]'
                                : 'Политика конфиденциальности приложения «Physical Tracker»!, Дата последнего обновления: 25.05.2025  1. Введение  1.1. Настоящие условия использования (далее – «условия») регулируют отношения между [Название вашей компании] (далее – «Компания») и пользователем (далее – «Пользователь») мобильного приложения Bayke (далее – «приложение»).  1.2. Используя приложение, Пользователь соглашается с настоящими условиями.  2. Предмет условий  2.1. Приложение предоставляет Пользователю [краткое описание функционала приложения, например, возможность отслеживать финансы, ставить финансовые цели и т.д.].  3. Регистрация и доступ к приложению  3.1. Для использования некоторых функций приложения может потребоваться регистрация.  3.2. Пользователь несёт ответственность за конфиденциальность своих учётных данных.  4. Права и обязанности Пользователя  4.1. Пользователь имеет право использовать приложение в соответствии с настоящими условиями.  4.2. Пользователь обязуется не использовать приложение в незаконных целях.  5. Права и обязанности Компании  5.1. Компания имеет право изменять функционал приложения.  5.2. Компания обязуется обеспечивать конфиденциальность данных Пользователя.  6. Ответственность  6.1. Компания не несёт ответственности за [укажите случаи, например, убытки, возникшие в результате использования приложения].  7. Интеллектуальная собственность  7.1. Все права на приложение принадлежат Компании.  8. Изменение условий  8.1. Компания имеет право изменять настоящие условия в одностороннем порядке.  9. Применимое право  9.1. К настоящим условиям применяется законодательство [укажите страну].  10. Контактная информация  [ваша контактная информация]',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
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
}
