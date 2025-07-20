import 'package:boom_client/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../backend/supabase/supabase.dart';
import '../../testPage.dart';
import '../../testVideoUpload.dart';
import '/auth/base_auth_user_provider.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'router_page_model.dart';
export 'router_page_model.dart';

class RouterPageWidget extends StatefulWidget {
  const RouterPageWidget({super.key});

  static String routeName = 'RouterPage';
  static String routePath = '/routerPage';

  @override
  State<RouterPageWidget> createState() => _RouterPageWidgetState();
}

class _RouterPageWidgetState extends State<RouterPageWidget> {
  late RouterPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RouterPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // FFAppState().regCompleted = false;
      // await SupaFlow.initialize();
      // await AppSupabase.instance.client.removeAllChannels();


      await Future.delayed(const Duration(milliseconds: 500));
      if (FFAppState().obboardingShown) {
        if (FFAppState().surveyShown) {
          if (loggedIn) {
            // await SupaFlow.initialize();
            // final user = FirebaseAuth.instance.currentUser;
            // final token = await user?.getIdToken();
            //
            // if (token != null) {
            //   await AppSupabase.instance.client.auth.setInitialSession(token);
            // }
            await AppSupabase.instance.updateAuthClient();

            if (FFAppState().regCompleted) {
              context.goNamed(
                WorkoutsPageWidget.routeName,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            } else {
              context.goNamed(
                CompleteRegistration01PageWidget.routeName,
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            }
          } else {
            context.goNamed(
              LoginPageWidget.routeName,
              extra: <String, dynamic>{
                kTransitionInfoKey: TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          }
        } else {
          context.goNamed(
            SurveyIntroPageWidget.routeName,
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        }
      } else {
        context.goNamed(
          OnboardingPageWidget.routeName,
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => CreatingProgramPageWidget(),
      //     // fullscreenDialog: true
      //   ),
      // );
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => VideoUploadTestPage(),
      //     // fullscreenDialog: true
      //   ),
      // );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  child: custom_widgets.LoadingIndiacator(
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
