import 'dart:io';
import 'package:flutter/material.dart';

import 'package:bebras_app_ui/screens/main/profile.dart';
import 'package:bebras_app_ui/screens/main/quiz.dart';
import 'package:bebras_app_ui/screens/main/home.dart';
import 'package:bebras_app_ui/screens/main/login_register.dart';
import 'package:bebras_app_ui/screens/main/pdf_viewer_page.dart';
import 'package:bebras_app_ui/screens/splash.dart';
import 'package:bebras_app_ui/themes/theme_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      // theme: lightTheme,
      themeMode: _themeManager.themeMode,
      supportedLocales: const [
        Locale('en', ''),
        Locale('id', ''),
      ],
      routes: {
        '/': (context) => SplashScreen(),
        '/auth': (context) => LoginRegisterScreen(),
        '/home': (context) => Home(),
        '/profile': (context) => Profile(),
        '/collection': (context) => Quiz(),
        '/document/view': (context) => PdfViewerPage(file: new File('images/bannerBebras.jpg'), url: '',),
      },
      initialRoute: '/',
    );
  }

  Future<String> getImageFileFromAssets() async {
    var dir = await getApplicationDocumentsDirectory();
    print(dir);
    return dir.toString();
  }
}
