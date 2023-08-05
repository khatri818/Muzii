
import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/style.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';

import '../../../../common/app_colors.dart';
import '../../../../common/app_style.dart';
import '../../../../common/commonButton.dart';
import '../../../../models/auth_model.dart';
import '../../../home/presentation/pages/view_releasesscreen.dart';
import '../../../services/auth_service.dart';


class LoginOTPScreen extends StatefulWidget {
  final String phone;
  const LoginOTPScreen({
    super.key,
    required this.phone,
  });

  @override
  State<LoginOTPScreen> createState() => _LoginOTPScreenState();
}

class _LoginOTPScreenState extends State<LoginOTPScreen> {
  @override
  void initState() {
    _call();
    startTimer();
    super.initState();
  }

  void _call() async {
    await authClass.verifyPhoneNumber("+91 ${widget.phone}", context, setData);
  }

  FocusNode focusNode = FocusNode();
  AuthClass authClass = AuthClass();
  String verificationIdFinal = "";
  String smsCode = "";
  int start = 30;
  String buttonName = "Resend OTP";
  bool wait = true;
  bool isLoading = false;
  final TextEditingController otp = TextEditingController();
  final Map<String, String> loginData = {
    'phoneNumber': null.toString(),
    'phoneCountryCode.': null.toString(),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Login',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.sizedBoxH40,
                Text("Verify with OTP", style: Appstyle.appbar),
                Styles.sizedBoxH40,
                const Text(
                  "OTP Send to",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Styles.sizedBoxH30,
                IntlPhoneField(
                    focusNode: focusNode,
                    //controller: phoneController,
                    initialValue: widget.phone,
                    decoration: InputDecoration(
                      labelText: 'Enter your mobile number',
                      // suffix:
                      //     GestureDetector(onTap: () {}, child: Text("data")),
                      fillColor: AppColors.grey.withOpacity(0.1),
                      focusColor: AppColors.grey.withOpacity(0.1),
                      labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff8391A1)),
                      errorStyle: const TextStyle(color: Colors.red),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.grey.withOpacity(0.1))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.grey.withOpacity(0.1))),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.grey.withOpacity(0.1)),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onCountryChanged: (country) {
                      FocusScope.of(context).unfocus();

                      if (kDebugMode) {
                        print('Country changed to: ${country.name}');
                      }
                    }),
                Styles.sizedBoxH40,
                const Text(
                  "Enter OTP",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Styles.sizedBoxH30,
                otpField(),
                // CommonTextFormField(
                //   autovalidateMode: AutovalidateMode.onUserInteraction,
                //   keyboardType: TextInputType.phone,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter OTP';
                //     }
                //     return null;
                //   },
                //   hintText: 'Start Typing',
                // ),
                Styles.sizedBoxH10,
                wait
                    ? Row(
                        children: [
                          Text(
                            "Resend OTP",
                            style: Appstyle.text,
                          ),
                          Text(
                            " after ",
                            style: Appstyle.text,
                          ),
                          Text(
                            "00:$start",
                            style: Appstyle.text1,
                          ),
                        ],
                      )
                    : InkWell(
                        child: const Text("Resend OTP"),
                        onTap: () {
                          startTimer();
                          setState(() {
                            start = 30;
                            wait = true;
                          });
                        },
                      ),
                Styles.sizedBoxH50,
                CommonButton(
                    label: "Submit OTP",
                    onPressed: () async {
                      await authClass.signInwithPhoneNumber(
                          verificationIdFinal, smsCode, context);
                      //  _httpsCall();
                      _loginHandler();
                      //    login();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ViewReleasesScreen(),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ));
  }

  Widget otpField() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width - 34,
      fieldWidth: 58,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: AppColors.grey.withOpacity(0.1),
        borderColor: AppColors.grey.withOpacity(0.1),
      ),
      style: const TextStyle(fontSize: 17, color: Colors.black),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        if (kDebugMode) {
          // ignore: prefer_interpolation_to_compose_strings
          print("Completed: " + pin);
        }
        setState(() {
          smsCode = pin;
        });
      },
    );
  }

  void startTimer() {
    print("hii");
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  void setData(verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    startTimer();
  }

  void _errorDialog({required String title, required String errorMessage}) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(errorMessage),
              actions: [
                TextButton(
                  child: const Text('Okay'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            )); //End of showDialog method
  } //End of _errorDialog method

  // ignore: unused_element
  void _loginHandler() async {
    setState(() {
      isLoading = true;
    });

    try {
      await Provider.of<AuthModel>(context, listen: false).login(loginData);
    } on HttpException catch (err) {
      _errorDialog(title: 'An error occoured', errorMessage: err.toString());
    } catch (err) {
      _errorDialog(
          title: 'An error occoured on server', errorMessage: err.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // ignore: unused_element
  _httpsCall() async {
    // Fetch the currentUser, and then get its id token
    final user = await FirebaseAuth.instance.currentUser;
    final idToken = await user!.getIdToken();
    final token = idToken;
    if (kDebugMode) {
      print(token.toString());
    }
    AlertDialog(
      content: Text(token.toString()),
    );
  }
}
