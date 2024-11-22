import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA_xUmUHTJP_n39H3D7pcP61LKPAo03STk",
            authDomain: "gk-quiz-app-1584f.firebaseapp.com",
            projectId: "gk-quiz-app-1584f",
            storageBucket: "gk-quiz-app-1584f.appspot.com",
            messagingSenderId: "71884627981",
            appId: "1:71884627981:web:53ca7b7317165cb039f544",
            measurementId: "G-ZSH4N59ZPN"));
  } else {
    await Firebase.initializeApp();
  }
}
