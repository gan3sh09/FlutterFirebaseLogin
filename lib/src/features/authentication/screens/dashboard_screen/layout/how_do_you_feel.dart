import 'package:flutter/material.dart';

class HowDoYouFeel extends StatelessWidget {
  const HowDoYouFeel({
    required this.text,
    required this.color,
    super.key,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          Icons.more_horiz,
          color: color,
        )
      ],
    );
  }
}
