import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/auth/presentation/pages/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
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
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                titleLarge: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                bodyLarge: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
            home: const LoginPage()
            //  FutureBuilder<String>(
            //   future: AuthClass().getAuthToken(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData &&
            //         snapshot.data!.isNotEmpty &&
            //         snapshot.data != 'no_token') {
            //       // User is logged in, navigate to home page
            //       return const ViewReleasesScreen();
            //     }
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const Center(child: AppCircularProgress());
            //     } else {
            //       // User is not logged in, navigate to login page
            //       return const LoginPage();
            //     }
            //   },

            //   //
            // ),
            );
      },
    );
  }
}
