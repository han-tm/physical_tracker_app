import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

export 'database/database.dart';
export 'storage/storage.dart';

String _kSupabaseUrl = 'https://5674737-vg91324.twc1.net';
String _kSupabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlzcyI6InN1cGFiYXNlIiwiaWF0IjoxNjQxNzY5MjAwLCJleHAiOjE3OTk1MzU2MDB9.soiKBwoCab3nkvoIMa_3Yn7ttwZ2RLDPljqMC5fslWE';

// class SupaFlow {
//   SupaFlow._();
//
//   static SupaFlow? _instance;
//
//   static SupaFlow get instance => _instance ??= SupaFlow._();
//
//   final _supabase = Supabase.instance.client;
//
//   static SupabaseClient get client => instance._supabase;
//
//   static Future initialize() => Supabase.initialize(
//         url: _kSupabaseUrl,
//         headers: {
//           'X-Client-Info': 'flutterflow',
//         },
//         anonKey: _kSupabaseAnonKey,
//         debug: false,
//         // accessToken: () => FirebaseAuth.instance.currentUser!.getIdToken(),
//         accessToken: () async {
//           final user = FirebaseAuth.instance.currentUser;
//           if (user != null) {
//             return await user.getIdToken();
//           }
//           return null;
//         },
//         authOptions: FlutterAuthClientOptions(authFlowType: AuthFlowType.implicit),
//       );
//
//   static Future<void> reinitializeSupabaseWithFirebaseToken() async {
//     final firebaseUser = FirebaseAuth.instance.currentUser;
//     if (firebaseUser == null) return;
//
//     final idToken = await firebaseUser.getIdToken();
//
//     await Supabase.initialize(
//       url: _kSupabaseUrl,
//       anonKey: _kSupabaseAnonKey,
//       headers: {
//         'Authorization': 'Bearer $idToken',
//         'X-Client-Info': 'flutterflow',
//       },
//       accessToken: () async => idToken,
//       authOptions: FlutterAuthClientOptions(authFlowType: AuthFlowType.pkce),
//     );
//   }
//
// }
class AppSupabase {
  static final AppSupabase _singleton = AppSupabase._internal();
  static AppSupabase get instance => _singleton;

  SupabaseClient? _authClient;

  AppSupabase._internal();

  /// Инициализация глобального клиента без авторизации
  Future<void> init() async {
    await Supabase.initialize(
      url: _kSupabaseUrl,
      anonKey: _kSupabaseAnonKey,
      headers: {
        'X-Client-Info': 'flutterflow',
      },
      debug: false,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.implicit,
      ),
    );
  }

  /// Обновляет клиент с токеном после авторизации
  Future<void> updateAuthClient() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    _authClient = SupabaseClient(
      _kSupabaseUrl,
      _kSupabaseAnonKey,
      headers: {
        'X-Client-Info': 'flutterflow',
      },
      accessToken: () async {
        return await user.getIdToken();
      },
    );
  }

  /// Универсальный клиент, работает с авторизацией, если она есть
  SupabaseClient get client {
    return _authClient ?? Supabase.instance.client;
  }

  /// Очистка при выходе
  void reset() {
    _authClient = null;
  }
}


