import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/auth/login_screen.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../common/TextField.dart';
import '../../common/app_colors.dart';
import '../../common/app_style.dart';
import '../../common/commonButton.dart';
import '../../common/common_textformfield_dropdown.dart';
import '../../common/style.dart';
import '../../models/auth_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final country = <String>[
    'India',
    'Korea',
    'USA',
  ];
  final gender = <String>['Male', 'Female', "Other"];
  FocusNode focusNode = FocusNode();
  final _from = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  String genderdrop = '';
  String countrydrop = '';
  final DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
  }

  @override
  void initState() {
    dobController.text = '';
    super.initState();
  }

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
            child: Form(
              key: _from,
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
                  Styles.sizedBoxH20,
                  CommonTextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: nameController,
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
                    controller: emailController,
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
                      options: country,
                      onChange: (value) {
                        countrydrop = value!;
                      },
                      validator: null,
                      controller: null,
                      hintText: 'Select'),
                  Styles.sizedBoxH10,
                  CustomDropdown(
                    hintText: 'Select',
                    dropdownValue: 'Select Gender',
                    onChange: (value) {
                      genderdrop = value!;
                    },
                    options: gender,
                    validator: null,
                    controller: null,
                  ),
                  Styles.sizedBoxH10,
                  CommonTextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: dobController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter D.O.B';
                      }
                      return null;
                    },
                    suffix: IconButton(
                        color: AppColors.orange,
                        iconSize: 25,
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));
                          if (pickedDate != null) {
                            if (kDebugMode) {
                              print(pickedDate);
                            }
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            if (kDebugMode) {
                              print(formattedDate);
                            }

                            setState(() {
                              dobController.text = formattedDate;
                            });
                          } else {
                            if (kDebugMode) {
                              print("Date is not selected");
                            }
                          }
                        },
                        icon: const Icon(Icons.calendar_month)),
                    hintText: 'Date Of Birth (DD/MM/YYYY)',
                  ),
                  Styles.sizedBoxH50,
                  CommonButton(
                      label: "Submit OTP",
                      onPressed: () async {
                        if (genderdrop.isNotEmpty &&
                            countrydrop.isNotEmpty &&
                            nameController.text.isNotEmpty &&
                            emailController.text.isEmpty &&
                            phoneController.text.isEmpty &&
                            dobController.text.isEmpty) {
                          Provider.of<AuthModel>(context).signup({});
                        } else {
                          const snackBar = SnackBar(
                            content: Text('Yay! A SnackBar!'),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
