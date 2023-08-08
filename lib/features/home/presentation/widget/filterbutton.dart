import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/app_colors.dart';
import 'package:flutter_application_1/common/app_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterButton extends StatefulWidget {
  const FilterButton(this.text, {super.key});
  final String text;
  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  bool isFiltered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFiltered = !isFiltered;
        });
      },
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: isFiltered ? AppColors.white : AppColors.white,
            border: isFiltered
                ? Border.all(
                    color: AppColors.bottomNavBarInactiveIconColor, width: 1)
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.text, style: Appstyle.text),
              if (isFiltered)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Icon(
                    Icons.clear_rounded,
                    color: AppColors.orange,
                    size: 15,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
