import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/auth/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff1F1C1C),
        primaryColorDark: const Color(0xff1F1C1C),
        primaryColorLight: const Color(0xff1F1C1C),
        hintColor: const Color(0xffF3671F),
        fontFamily: 'Metropolis',
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
          titleLarge: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
          bodyLarge: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
      home:  const LoginPage(),
    );
  }
}
