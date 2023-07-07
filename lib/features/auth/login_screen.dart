import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_style.dart';
import 'package:flutter_application_1/common/commonButton.dart';
import 'package:flutter_application_1/features/auth/otp_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../common/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Login/Signup',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.sizedBoxH60,
                Text(
                  "Welcome to Lemo!",
                  style: Appstyle.appbar,
                ),
                Styles.sizedBoxH20,
                const Text(
                  "Abhi shuru karein apne gaano ka distribution,bilkul free!",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Login/Signup",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Styles.sizedBoxH50,
                IntlPhoneField(
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    labelText: 'Enter your mobile number',
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff8391A1)),
                    errorStyle: TextStyle(color: Colors.red),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'IN',
                  onChanged: (phone) {
                    if (kDebugMode) {
                      print(phone.completeNumber);
                    }
                  },
                  onCountryChanged: (country) {
                    if (kDebugMode) {
                      print('Country changed to: ${country.name}');
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                CommonButton(
                    label: "Continue",
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const OTPScreen(),
                        ),
                      );
                    }),
                const SizedBox(
                  height: 210,
                ),
                const Text(
                  "By creating an account or logging in, you agree with Lemo’s ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
                Text("Terms and Conditions and Privacy Policy.",
                    style: Appstyle.title),
              ],
            ),
          ),
        ));
  }
}
//