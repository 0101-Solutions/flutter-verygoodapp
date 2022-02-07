import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton({
    Key? key,
    required this.text,
    required this.size,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Size size;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: Colors.black,
      highlightElevation: 0,
      highlightColor: Colors.black,
      splashColor: Theme.of(context).colorScheme.secondary,
      child: Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .button!
              .copyWith(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
