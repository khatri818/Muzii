import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/constant/image_resource.dart';
import 'package:flutter_application_1/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter_application_1/features/services/auth_service.dart';
import 'package:provider/provider.dart';

import '../../../../models/auth_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<SplashScreen> { 

  @override
  void initState() {
    loadData(context);
    super.initState();
    
  }

  Future loadData(BuildContext context) async {

    await Future.delayed(const Duration(milliseconds: 900));
    // ignore: use_build_context_synchronously
    final authProvider =  Provider.of<AuthModel>(context, listen: false);

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(),));


    // ignore: use_build_context_synchronously
    // final postProvider = Provider.of<PostProvider>(context, listen: false);

    //  postProvider.getAllCategoriesFromWP().then((value) async {
    //                     if (authProvider.isSignedIn == true) {
    //                     await authProvider.getDataFromSP().whenComplete(
    //                           () => authProvider.getExamDataFromSP().whenComplete(() => Navigator.pushReplacement(
    //                             context,
    //                             MaterialPageRoute(
    //                               builder: (context) =>  const MyNavbar(),
    //                             ),
    //                           ).then((value) => authProvider.getExamDataFromSP()),)
    //                         );
    //                   } else {
    //                     Navigator.pushReplacement(
    //                       context,
    //                       MaterialPageRoute(
    //                         builder: (context) => const RegisterScreen(),
    //                       ),
    //                     );
    //                   }
    //                   });
        //  // ignore: use_build_context_synchronously
        //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const RegisterScreen()));
        
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Animate(
              effects: const [FadeEffect(duration: Duration(milliseconds: 1000))],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageResource.muziiLogo,
                    height: 70,
                  ),
                  const SizedBox(height: 20),
                  // const Text(
                  //   "MUZII",
                  //   style: TextStyle(
                  //     fontSize: 30,
                  //     fontWeight: FontWeight.w900,
                  //     color: Colors.orangeAccent
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  // const Text(
                  //   "Never a better time than now to start.",
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     color: Colors.black38,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  // custom button
                  // SizedBox(
                  //   width: double.infinity,
                  //   height: 50,
                  //   child: CustomButton(
                  //     onPressed: () async {
                  //       postProvider.getAllCategoriesFromWP().then((value) async {
                  //         if (ap.isSignedIn == true) {
                  //         await ap.getDataFromSP().whenComplete(
                  //               () => ap.getExamDataFromSP().whenComplete(() => Navigator.pushReplacement(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                   builder: (context) =>  MyNavbar(),
                  //                 ),
                  //               ).then((value) => ap.getExamDataFromSP()),)
                  //             );
                  //       } else {
                  //         Navigator.pushReplacement(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => const RegisterScreen(),
                  //           ),
                  //         );
                  //       }
                  //       });
                        
                  //     },
                  //     text: "Get started",
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


  // Future loadData(BuildContext context) async {

  //   await Future.delayed(const Duration(milliseconds: 900));
  //   // ignore: use_build_context_synchronously
  //   final authProvider =  Provider.of<AuthClass>(context, listen: false);
    // ignore: use_build_context_synchronously
    // final postProvider = Provider.of<PostProvider>(context, listen: false);

    //  postProvider.getAllCategoriesFromWP().then((value) async {
    //                     if (authProvider.isSignedIn == true) {
    //                     await authProvider.getDataFromSP().whenComplete(
    //                           () => authProvider.getExamDataFromSP().whenComplete(() => Navigator.pushReplacement(
    //                             context,
    //                             MaterialPageRoute(
    //                               builder: (context) =>  const MyNavbar(),
    //                             ),
    //                           ).then((value) => authProvider.getExamDataFromSP()),)
    //                         );
    //                   } else {
    //                     Navigator.pushReplacement(
    //                       context,
    //                       MaterialPageRoute(
    //                         builder: (context) => const RegisterScreen(),
    //                       ),
    //                     );
    //                   }
    //                   });
        //  // ignore: use_build_context_synchronously
        //  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const RegisterScreen()));
        
  