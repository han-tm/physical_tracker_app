import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'creating_program_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class CreatingProgramPageWidget extends StatefulWidget {
  const CreatingProgramPageWidget({super.key});

  static String routeName = 'CreatingProgramPage';
  static String routePath = '/creatingProgramPage';

  @override
  State<CreatingProgramPageWidget> createState() => _CreatingProgramPageWidgetState();
}

class _CreatingProgramPageWidgetState extends State<CreatingProgramPageWidget> {
  late CreatingProgramPageModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatingProgramPageModel());
    _startProgress();
  }

  void _startProgress() {
    final totalDuration = Duration(seconds: 4 + (DateTime.now().millisecondsSinceEpoch % 3)); // 4-6 секунд
    final steps = 20;
    final interval = totalDuration.inMilliseconds ~/ steps;

    int currentStep = 0;

    Future.doWhile(() async {
      await Future.delayed(Duration(milliseconds: interval));

      setState(() {
        final randomDelta = 0.02 + (0.08 * (DateTime.now().millisecond % 100) / 100); // 2% - 10%
        _model.progress = (_model.progress + randomDelta).clamp(0.0, 1.0);
      });

      currentStep++;

      if (currentStep >= steps || _model.progress >= 1.0) {
        await Future.delayed(const Duration(milliseconds: 500));
        if (mounted) {
          var result = context.pushNamed(SignInStartPageWidget.routeName);
        }
        return false;
      }

      return true;
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var scaff = GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          child: Stack(
            children: [
              Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/images/69195f7063809f0f218c8e7cd7bf4f6febe78fc5.jpg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Создаём вашу программу!',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.unbounded(
                            fontWeight: FontWeight.bold,
                          ),
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: CircularPercentIndicator(
                        percent: _model.progress,
                        radius: 87.5,
                        lineWidth: 15.0,
                        animation: true,
                        animateFromLastPercent: true,
                        progressColor: FlutterFlowTheme.of(context).primary,
                        backgroundColor: const Color(0x0EFFFFFF),
                        center: Text(
                          '${(_model.progress * 100).toInt()}%',
                          style: FlutterFlowTheme.of(context).headlineSmall.override(
                            font: GoogleFonts.unbounded(),
                            shadows: const [
                              Shadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 50.0,
                              )
                            ],
                          ),
                        ),
                        startAngle: 0.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 20.0, right: 20.0),
                      child: Text(
                        'Подбираем оптимальные упражнения под ваши параметры и цели',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.unbounded(),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 13.0,
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
    );

    return PopScope(
      canPop: false,
      child: scaff,
    );
  }
}