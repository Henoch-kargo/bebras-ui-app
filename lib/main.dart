import 'dart:io';

import 'package:bebras_app_ui/screens/main/collection.dart';
import 'package:bebras_app_ui/screens/main/custom_blank_page.dart';
import 'package:bebras_app_ui/screens/main/home.dart';
import 'package:bebras_app_ui/screens/main/login_register.dart';
import 'package:bebras_app_ui/screens/main/pdf_viewer_page.dart';
import 'package:bebras_app_ui/screens/splash.dart';
import 'package:bebras_app_ui/themes/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        '/profile': (context) => CustomBlankPage(onClickHome: () {Navigator.pushNamed(context, '/home');}),
        '/collection': (context) => Collection(),
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
