import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../common/TextField.dart';
import '../../common/app_style.dart';
import '../../common/commonButton.dart';
import '../../common/common_textformfield_dropdown.dart';
import '../../common/style.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final options = <String>[
    'India',
    'Korea',
    'USA',
  ];
  final gender = <String>['Male', 'Female', "Other"];
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Register',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.sizedBoxH50,
                Text(
                  "Welcome",
                  style: Appstyle.title1,
                ),
                Styles.sizedBoxH10,
                const Text(
                  "Let's  get started with Lemo",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
                Styles.sizedBoxH10,
                CommonTextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                  hintText: 'Enter your full name',
                ),
                Styles.sizedBoxH10,
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
                Styles.sizedBoxH10,
                CommonTextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email';
                    }
                    return null;
                  },
                  hintText: 'Email Id',
                ),
                Styles.sizedBoxH10,
                CustomDropdown(
                    dropdownValue: "Select Country",
                    options: options,
                    validator: null,
                    controller: null,
                    hintText: 'Select'),
                Styles.sizedBoxH10,
                CustomDropdown(
                  hintText: 'Select',
                  dropdownValue: 'Select Gender',
                  options: gender,
                  validator: null,
                  controller: null,
                ),
                Styles.sizedBoxH10,
                CommonTextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter D.O.B';
                    }
                    return null;
                  },
                  hintText: 'Date Of Birth (DD/MM/YYYY)',
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
