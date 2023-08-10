import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/common/app_style.dart';
import 'package:flutter_application_1/common/style.dart';
import 'package:intl/intl.dart';

import '../../../../common/TextField.dart';
import '../../../../common/commonButton.dart';
import '../../../../common/common_textformfield_dropdown.dart';
import '../../../../constant/image_resource.dart';
import 'add_release_screen2/add_release_screens2.dart';

class ReviewYourSong extends StatefulWidget {
  const ReviewYourSong({super.key});

  @override
  State<ReviewYourSong> createState() => _ReviewYourSongState();
}

class _ReviewYourSongState extends State<ReviewYourSong> {
  TextEditingController songnameController = TextEditingController();
  TextEditingController labelnameController = TextEditingController();
  TextEditingController releasedateController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  String genredrop = '';
  String subgenredrop = '';

  final genre = <String>['A', 'B', "C"];
  final subgenre = <String>['A', 'B', "C"];

  // ignore: unused_field
  final List<String> _options = ['Yes', 'No'];
  // ignore: unused_field
  final String _selectedValue = '';

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Image.asset(ImageResource.image5),
          content: const Text(
            'Song Uploaded Successfully',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Review Your Song',
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
                hintText: 'Calm Before The Storm',
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
                controller: releasedateController,
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
                          releasedateController.text = formattedDate;
                        });
                      } else {
                        if (kDebugMode) {
                          print("Date is not selected");
                        }
                      }
                    },
                    icon: const Icon(Icons.calendar_month)),
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
              Styles.sizedBoxH50,
              CommonButton(
                label: "Submit",
                onPressed: _showDialog,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
