import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String text;
  final double thickness;
  final Color color;

  const CustomDivider({
    Key? key,
    this.text = '',
    this.thickness = 2.0,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            thickness: thickness,
            color: color,
          ),
        ),
        Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: 20.0,
            color: color,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: thickness,
            color: color,
          ),
        ),
      ],
    );
  }
}
