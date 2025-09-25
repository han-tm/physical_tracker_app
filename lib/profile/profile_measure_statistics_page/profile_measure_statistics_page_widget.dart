import 'package:boom_client/components/general_button_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../auth/firebase_auth/auth_util.dart';
import '../../backend/supabase/supabase.dart';
import '../profile_measurement_add_page/profile_measurement_add_page_widget.dart';
import '/components/general_nav_bar01_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'profile_measure_statistics_page_model.dart';
export 'profile_measure_statistics_page_model.dart';

class ProfileMeasureStatisticsPageWidget extends StatefulWidget {
  const ProfileMeasureStatisticsPageWidget({super.key});

  static String routeName = 'ProfileMeasureStatisticsPage';
  static String routePath = '/profileMeasureStatisticsPage';

  @override
  State<ProfileMeasureStatisticsPageWidget> createState() => _ProfileMeasureStatisticsPageWidgetState();
}

class _ProfileMeasureStatisticsPageWidgetState extends State<ProfileMeasureStatisticsPageWidget> {
  late ProfileMeasureStatisticsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileMeasureStatisticsPageModel());

    init();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  void init() async {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      List<UserBodyMeasureRow> rows = await UserBodyMeasureTable().queryRows(
        queryFn: (q) => q.eq('user', currentUserUid).order('created_at', ascending: false),
      );
      _model.measureRows = rows;
      _model.isLoading = false;
      safeSetState(() {});
    });
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
                child: const GeneralNavBar01Widget(
                  title: 'Статистика замеров',
                  hideBack: false,
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (_model.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (_model.measureRows.isEmpty) {
                      return noMeasures();
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      scrollDirection: Axis.vertical,
                      itemCount: _model.measureRows.length,
                      itemBuilder: (context, measureIndex) =>
                          MeasureRowWidget(measureRow: _model.measureRows[measureIndex]),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GeneralButtonWidget(
                  isActive: true,
                  title: '+  Добавить новые замеры',
                  onTap: () async {
                    await context.pushNamed(ProfileMeasurementAddPageWidget.routeName);
                    init();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget noMeasures() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/Ruler_noData.svg',
            width: 32,
            height: 32,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
            child: Text(
              'Ваш путь к идеальной форме начинается здесь!',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.unbounded(
                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    fontSize: 17,
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
          ),
          Text(
            'Добавьте свои первые замеры и начните следить за своими изменениями',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  fontSize: 15,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
        ],
      ),
    );
  }
}

class MeasureRowWidget extends StatelessWidget {
  final UserBodyMeasureRow measureRow;
  const MeasureRowWidget({super.key, required this.measureRow});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF242328),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                dateTimeFormat('dd MMMM yyyy', measureRow.createdAt, locale: 'ru_RU'),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.unbounded(
                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 13,
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              if (measureRow.imgFront != null)
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 0.7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: measureRow.imgFront!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ),
                ),
              const SizedBox(width: 5),
              if (measureRow.imgBack != null)
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 0.7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: measureRow.imgBack!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ),
                ),
              const SizedBox(width: 5),
              if (measureRow.imgSide != null)
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AspectRatio(
                      aspectRatio: 0.7,
                      child: CachedNetworkImage(
                        imageUrl: measureRow.imgSide!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF302E36),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Text(
                  'Вес',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 15,
                        color: const Color(0xFF696576),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
                const Spacer(),
                Text(
                  '${measureRow.weight} кг',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        fontSize: 15,
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF302E36),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Плечи',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  fontSize: 15,
                                  color: const Color(0xFF696576),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                          const Spacer(),
                          Text(
                            '${measureRow.shoulderGirth} см',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  fontSize: 15,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'Грудь',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  fontSize: 15,
                                  color: const Color(0xFF696576),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                          const Spacer(),
                          Text(
                            '${measureRow.chestGirth} см',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  fontSize: 15,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'Живот',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  fontSize: 15,
                                  color: const Color(0xFF696576),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                          const Spacer(),
                          Text(
                            '${measureRow.abdomenGirth} см',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  fontSize: 15,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF302E36),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Талия',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  fontSize: 15,
                                  color: const Color(0xFF696576),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                          const Spacer(),
                          Text(
                            '${measureRow.waistGirth} см',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  fontSize: 15,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'Ягодицы',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  fontSize: 15,
                                  color: const Color(0xFF696576),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                          const Spacer(),
                          Text(
                            '${measureRow.hipsGirth} см',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  fontSize: 15,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'Бедро',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  fontSize: 15,
                                  color: const Color(0xFF696576),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                          const Spacer(),
                          Text(
                            '${measureRow.thighGirth} см',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                  ),
                                  fontSize: 15,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
