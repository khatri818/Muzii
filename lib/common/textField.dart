import 'package:flutter/material.dart';

class CommonTextFeild extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final Function(String value)? onPressed;
  final Function(String value)? onChanged;
  final Function? validate;

  const CommonTextFeild(
      {Key? key,
      required this.label,
      this.controller,
      this.onPressed,
      this.onChanged,
      this.validate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            label!,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            // color: Theme.of(context).primaryColorLight,
          ),
          child: TextFormField(
            controller: controller,
            cursorColor: Theme.of(context).hintColor,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            cursorHeight: 10,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(5),
              border: UnderlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
