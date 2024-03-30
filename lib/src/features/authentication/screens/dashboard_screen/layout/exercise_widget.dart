import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';

class ExerciseWidget extends StatelessWidget {
  const ExerciseWidget({
    required this.icon,
    required this.exerciseName,
    required this.noOfExcercise,
    required this.color,
    super.key,
  });

  final IconData icon;
  final String exerciseName;
  final int noOfExcercise;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? containerLight
                : iconDark,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: color,
                    ),
                    child: Icon(
                      icon,
                      size: 30.0,
                      color: whiteColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        exerciseName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : whiteColor,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '$noOfExcercise Exercises',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : whiteColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.more_horiz,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : whiteColor,
              ),
            ],
          )),
    );
  }
}
