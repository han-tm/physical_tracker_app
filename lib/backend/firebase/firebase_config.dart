import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBqgcXwNLwJgfbyUDnra_Na7ouT5rgYxGU",
            authDomain: "boom-romanov.firebaseapp.com",
            projectId: "boom-romanov",
            storageBucket: "boom-romanov.firebasestorage.app",
            messagingSenderId: "805150763105",
            appId: "1:805150763105:web:2660c6a5cdd5e3246b6220"));
  } else {
    await Firebase.initializeApp();
  }
}
