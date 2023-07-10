import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/TextField.dart';
import 'package:flutter_application_1/common/style.dart';
import 'package:flutter_application_1/features/auth/register.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../common/app_colors.dart';
import '../../common/app_style.dart';
import '../../common/commonButton.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  FocusNode focusNode = FocusNode();
  final TextEditingController otp = TextEditingController();
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
                Styles.sizedBoxH40,
                const Text(
                  "Enter OTP",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                Styles.sizedBoxH30,
                CommonTextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter OTP';
                    }
                    return null;
                  },
                  hintText: 'Start Typing',
                ),
                Styles.sizedBoxH10,
                Row(
                  children: [
                    Text(
                      "Resend OTP",
                      style: Appstyle.text,
                    ),
                    Text(
                      "  in 00:30",
                      style: Appstyle.text1,
                    ),
                  ],
                ),
                Styles.sizedBoxH50,
                CommonButton(
                    label: "Submit OTP",
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ));
                    }),
              ],
            ),
          ),
        ));
  }
}
