import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import '/backend/supabase/supabase.dart';
import 'backend/firebase/firebase_config.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  await initFirebase();

  // await SupaFlow.initialize();
  await AppSupabase.instance.init();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();
  late Stream<BaseAuthUser> userStream;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = boomClientFirebaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });
    jwtTokenStream.listen((_) {});
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'BoomClient',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({
    Key? key,
    this.initialPage,
    this.page,
    this.disableResizeToAvoidBottomInset = false,
  }) : super(key: key);

  final String? initialPage;
  final Widget? page;
  final bool disableResizeToAvoidBottomInset;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  // String _currentPageName = 'RouterPage';
  String _currentPageName = 'RouterPage';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      // 'RouterPage': RouterPageWidget(),
      'WorkoutsPage': WorkoutsPageWidget(),
      'JournalPage': JournalPageWidget(),
      'FoodPage': const FoodPageWidget(),
      'LearnPage': LearnPageWidget(),
      'ProfilePage': ProfilePageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      resizeToAvoidBottomInset: !widget.disableResizeToAvoidBottomInset,
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: Visibility(
        visible: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (i) => safeSetState(() {
            _currentPage = null;
            _currentPageName = tabs.keys.toList()[i];
          }),
          backgroundColor: Color(0xFF0B0D0F),
          selectedItemColor: FlutterFlowTheme.of(context).primary,
          unselectedItemColor: Color(0xFF696576),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.spoke_outlined,
            //     size: 24.0,
            //   ),
            //   label: 'Router',
            //   tooltip: '',
            // ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/menu00_uns.svg',
                width: 24.0,
                height: 24.0,
                fit: BoxFit.cover,
              ),
              activeIcon: SvgPicture.asset(
                'assets/images/menu00.svg',
                width: 24.0,
                height: 24.0,
                fit: BoxFit.cover,
              ),
              label: 'Тренировки',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/menu01_uns.svg',
                width: 24.0,
                height: 24.0,
                fit: BoxFit.cover,
              ),
              activeIcon: SvgPicture.asset(
                'assets/images/menu01.svg',
                width: 24.0,
                height: 24.0,
                fit: BoxFit.cover,
              ),
              label: 'Дневник',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/menu02_uns.svg',
                width: 24.0,
                height: 24.0,
                fit: BoxFit.cover,
              ),
              activeIcon: SvgPicture.asset(
                'assets/images/menu02.svg',
                width: 24.0,
                height: 24.0,
                fit: BoxFit.cover,
              ),
              label: 'Питание',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/menu03_uns.svg',
                width: 24.0,
                height: 24.0,
                fit: BoxFit.cover,
              ),
              activeIcon: SvgPicture.asset(
                'assets/images/menu03.svg',
                width: 24.0,
                height: 24.0,
                fit: BoxFit.cover,
              ),
              label: 'Обучение',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/menu04_uns.svg',
                width: 24.0,
                height: 24.0,
                fit: BoxFit.cover,
              ),
              activeIcon: SvgPicture.asset(
                'assets/images/menu04.svg',
                width: 24.0,
                height: 24.0,
                fit: BoxFit.cover,
              ),
              label: 'Профиль',
              tooltip: '',
            )
          ],
        ),
      ),
    );
  }
}
