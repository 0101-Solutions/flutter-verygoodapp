import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    required this.fontSize,
    required this.fontWeight,
    required this.obscureText,
    required this.onChanged,
  }) : super(key: key);

  final String hint;
  final double fontSize;
  final FontWeight fontWeight;
  final bool obscureText;
  final Function(String val) onChanged;

  OutlineInputBorder get _border => const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(
          color: Color.fromARGB(255, 3, 3, 3),
          width: 1.5,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: TextField(
        obscureText: obscureText,
        onChanged: onChanged,
        cursorColor: Colors.black,
        style: Theme.of(context).textTheme.overline!.copyWith(
              color: Colors.black,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
          ),
          enabledBorder: _border,
          border: _border,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
