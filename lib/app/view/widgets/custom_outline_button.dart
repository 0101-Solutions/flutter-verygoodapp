import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.size,
    required this.text,
  }) : super(key: key);

  final void Function() onPressed;
  final Widget icon;
  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: OutlineButton.icon(
        onPressed: onPressed,
        highlightedBorderColor: Colors.black,
        borderSide: const BorderSide(
          width: 1.5,
          color: Color.fromARGB(255, 0, 0, 1),
        ),
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
        ),
        icon: icon,
        label: Text(
          text,
          style: Theme.of(context).textTheme.caption!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w200,
                color: Colors.black,
              ),
        ),
        color: Colors.white,
        highlightColor: Colors.white,
        splashColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
