import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/TextField.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Verify with OTP",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                "OTP Send to",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 30,
              ),
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
                height: 40,
              ),
              const Text(
                "Enter OTP",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              CommonTextFeild(
                controller: otp,
                label: '',
              ),
              const SizedBox(
                height: 50,
              ),
              CommonButton(label: "Continue", onPressed: () {}),
            ],
          ),
        ));
  }
}
