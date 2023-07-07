// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_style.dart';
import 'package:flutter_application_1/common/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

// ignore: must_be_immutable
class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    Key? key,
    this.validator,
    this.controller,
    this.hintText,
    this.errorText,
    this.onChange,
    this.keyboardType,
    required this.options,
    required this.dropdownValue,
  }) : super(key: key);

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String dropdownValue;
  final List<String> options;
  final String? hintText;
  final String? errorText;
  final TextInputType? keyboardType;
  final void Function(String? value)? onChange;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
          hintText: dropdownValue,
          hintStyle: Appstyle.textFormFieldText,
          errorText: errorText,
          fillColor: AppColors.grey.withOpacity(0.1),
          filled: true,
          enabledBorder: Styles.outlineInputBorder.copyWith(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.dropDownFillColor)),
          focusedBorder: Styles.outlineInputBorderFocus,
          contentPadding: Styles.customEdgeInsets(15, 15)),
      icon: Icon(
        Icons.keyboard_arrow_down,
        size: 30.sp,
        color: AppColors.grey,
      ),
      onChanged: onChange,
      items: options.map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Appstyle.textFormFieldText,
            ),
          );
        },
      ).toList(),
    );
  }
}
