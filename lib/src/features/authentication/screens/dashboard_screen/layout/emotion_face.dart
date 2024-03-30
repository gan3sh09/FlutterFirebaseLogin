import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';

class EmotionFace extends StatelessWidget {
  const EmotionFace({
    super.key,
    required this.emotionEmoji,
    required this.title,
  });

  final String emotionEmoji;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
              ? Colors.green.shade900
              : iconDark,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              emotionEmoji,
              style: const TextStyle(
                fontSize: 28,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: const TextStyle(
            color: whiteColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
