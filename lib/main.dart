import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quran_com/pages/homePage.dart';
import 'package:quran_com/pages/mainPage.dart';
import 'package:quran_com/storage/themeSettings.dart';
import 'package:rxdart/rxdart.dart';
import 'package:provider/provider.dart';

class AppProvider extends ChangeNotifier {
  final arabicFontSize = BehaviorSubject<double>.seeded(20.0);
  final mainFontSize = BehaviorSubject<double>.seeded(20.0);

  final activityTheme = BehaviorSubject<AppTheme>.seeded(AppTheme());

  final userInSystem = BehaviorSubject<bool>.seeded(false);

  final userLanguage = BehaviorSubject<String>.seeded('English');

  void languageChande(String value) {
    userLanguage.value = value;
    notifyListeners();
  }

  void sizeArabicChange(double value) {
    arabicFontSize.value = value;
    notifyListeners();
  }

  void sizeMainChange(double value) {
    mainFontSize.value = value;
    notifyListeners();
  }

  void themeChange(AppTheme value) {
    activityTheme.value = value;
    notifyListeners();
  }

  void loginUpdate(bool value) {
    userInSystem.value = value;
    notifyListeners();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCUaKR2NGXBHTFI0C-v_FxVId4SIan-fKw",
        authDomain: "qurandatabase-1.firebaseapp.com",
        projectId: "qurandatabase-1",
        storageBucket: "qurandatabase-1.appspot.com",
        messagingSenderId: "276573634469",
        appId: "1:276573634469:web:4813408360cb9ee5ee324c",
        measurementId: "G-9R2CZBW6Q9"),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: ModularApp(
          module: AppModule(),
          child: const MaterialApp(
            home: mainPage(),
          )),
    ),
  );
}

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const mainPage());
  }
}
