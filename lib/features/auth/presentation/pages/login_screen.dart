import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_style.dart';
import 'package:flutter_application_1/common/common_button.dart';
import 'package:flutter_application_1/features/auth/presentation/pages/login_otp_screen.dart';
import 'package:flutter_application_1/features/auth/presentation/pages/register.dart';
import 'package:flutter_application_1/features/services/auth_service.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode focusNode = FocusNode();
  TextEditingController phoneController = TextEditingController();
  AuthClass authClass = AuthClass();
  bool validation = false;
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
                  "Welcome to Muzii!",
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
                InkWell(
                  onTap: () async {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ));
                  },
                  child: const Text(
                    "Login/Register",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
                Styles.sizedBoxH50,
                IntlPhoneField(
                  focusNode: focusNode,
                  validator: (value) {
                    if (value == null || value.number.length < 10) {
                      return 'Please enter Mobile No.*';
                    } else {
                      setState(() {
                        FocusScope.of(context).unfocus();
                        validation = true;
                      });
                    }
                    return null;
                  },
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Enter your mobile number',
                    fillColor: AppColors.grey.withOpacity(0.1),
                    focusColor: AppColors.grey.withOpacity(0.1),
                    labelStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff8391A1)),
                    errorStyle: const TextStyle(color: Colors.red),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.grey.withOpacity(0.1))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.grey.withOpacity(0.1))),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.grey.withOpacity(0.1)),
                    ),
                  ),
                  initialCountryCode: 'IN',
                ),
                const SizedBox(
                  height: 50,
                ),
                CommonButton(
                    label: "Continue",
                    onPressed: validation
                        ? () {
                            (phone) async {
                              if (kDebugMode) {
                                print(phone.completeNumber);
                              }
                              // final response =
                              //     await Provider.of<AuthModel>(context, listen: false)
                              //         .login({"phoneNumber": phoneController.text});
                              await authClass.verifyPhoneNumber(
                                  "+91${phoneController.text}",
                                  context,
                                  setData);
                            };

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginOTPScreen(
                                  phone: phoneController.text,
                                ),
                              ),
                            );
                          }
                        : () {
                            showSnackBar(context, "Please Enter Mobile ");
                          }),
                const SizedBox(
                  height: 190,
                ),
                const Text(
                  "By creating an account or logging in, you agree with Muzii ",
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

  void setData(verificationId) {
    setState(() {
      verificationId = verificationId;
    });
  }
}

void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void storeTokenAndData(UserCredential userCredential) {}
