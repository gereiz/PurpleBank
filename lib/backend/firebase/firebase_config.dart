import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCzMmfq6d8Wr33t4BWLeahI7V6SfnKQQ_4",
            authDomain: "purple-bank-enu9ol.firebaseapp.com",
            projectId: "purple-bank-enu9ol",
            storageBucket: "purple-bank-enu9ol.appspot.com",
            messagingSenderId: "232629755756",
            appId: "1:232629755756:web:b7cb5ab9592069f52cdd49"));
  } else {
    await Firebase.initializeApp();
  }
}
