// ignore: file_names
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String? label;
  final void Function() onPressed;

  const CommonButton({super.key, required this.label, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        // margin: const EdgeInsets.symmetric(horizontal: 20.0),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Theme.of(context).hintColor,
        ),
        child: Text(
          label!,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
