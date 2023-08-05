import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/common/app_style.dart';
import 'package:flutter_application_1/common/style.dart';

import '../../../../common/TextField.dart';
import '../../../../common/commonButton.dart';
import '../../../../common/common_textformfield_dropdown.dart';

class AddReleaseScreen extends StatefulWidget {
  const AddReleaseScreen({super.key});

  @override
  State<AddReleaseScreen> createState() => _AddReleaseScreenState();
}

class _AddReleaseScreenState extends State<AddReleaseScreen> {
  TextEditingController songnameController = TextEditingController();
  TextEditingController labelnameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  String genredrop = '';
  String subgenredrop = '';
  String mooddrop = '';
  final genre = <String>['A', 'B', "C"];
  final subgenre = <String>['A', 'B', "C"];
  final mood = <String>['A', 'B', "C"];
  final List<String> _options = ['Yes', 'No'];
  String _selectedValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Add Release',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles.sizedBoxH10,
              Text(
                "Song Name",
                style: Appstyle.text1,
              ),
              Styles.sizedBoxH10,
              CommonTextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: songnameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Your Song Name';
                  }
                  return null;
                },
                hintText: 'Your Song Name',
              ),
              Styles.sizedBoxH10,
              Text(
                "Label Name",
                style: Appstyle.text1,
              ),
              Styles.sizedBoxH10,
              CommonTextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: labelnameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Lable Name';
                  }
                  return null;
                },
                hintText: 'Calm Befor The Storm',
              ),
              Styles.sizedBoxH10,
              Text(
                "Relases Date",
                style: Appstyle.text1,
              ),
              Styles.sizedBoxH10,
              CommonTextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                suffix: IconButton(
                  icon: const Icon(
                    Icons.calendar_month,
                    color: AppColors.orange,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                controller: dobController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter D.O.B';
                  }
                  return null;
                },
                hintText: 'DD/MM/YYYY',
              ),
              Styles.sizedBoxH10,
              Text(
                "Language",
                style: Appstyle.text1,
              ),
              Styles.sizedBoxH10,
              CommonTextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: languageController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Language';
                  }
                  return null;
                },
                hintText: 'Enter Language Of Your Song',
              ),
              Styles.sizedBoxH10,
              Text(
                "Genre",
                style: Appstyle.text1,
              ),
              Styles.sizedBoxH10,
              CustomDropdown(
                hintText: 'Select',
                dropdownValue: 'Enter Genre Of Your Song',
                onChange: (value) {
                  genredrop = value!;
                },
                options: genre,
                validator: null,
                controller: null,
              ),
              Styles.sizedBoxH10,
              Text(
                "Sub-Genre",
                style: Appstyle.text1,
              ),
              Styles.sizedBoxH10,
              CustomDropdown(
                hintText: 'Select',
                dropdownValue: 'Enter Sub-Genre Of Your Song',
                onChange: (value) {
                  subgenredrop = value!;
                },
                options: subgenre,
                validator: null,
                controller: null,
              ),
              Styles.sizedBoxH10,
              Text(
                "Mood",
                style: Appstyle.text1,
              ),
              Styles.sizedBoxH10,
              CustomDropdown(
                hintText: 'Select',
                dropdownValue: 'Enter Mood Of Your Song',
                onChange: (value) {
                  mooddrop = value!;
                },
                options: mood,
                validator: null,
                controller: null,
              ),
              Styles.sizedBoxH10,
              Row(
                children: [
                  Text(
                    "Explicit",
                    style: Appstyle.text1,
                  ),
                  Styles.sizedBoxW10,
                  const Icon(
                    Icons.info_outline,
                    color: AppColors.black,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _options
                    .map(
                      (option) => Row(
                        children: [
                          Radio(
                            value: option,
                            groupValue: _selectedValue,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => AppColors.black),
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value!;
                              });
                            },
                          ),
                          Text(
                            option,
                            style: Appstyle.text1,
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              Styles.sizedBoxH10,
              Row(
                children: [
                  Text(
                    "YouTube Content ID",
                    style: Appstyle.text1,
                  ),
                  Styles.sizedBoxW10,
                  const Icon(
                    Icons.info_outline,
                    color: AppColors.black,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _options
                    .map(
                      (option) => Row(
                        children: [
                          Radio(
                            value: option,
                            groupValue: _selectedValue,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => AppColors.black),
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value!;
                              });
                            },
                          ),
                          Text(
                            option,
                            style: Appstyle.text1,
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              Styles.sizedBoxH10,
              CommonButton(
                label: "Next Step",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
