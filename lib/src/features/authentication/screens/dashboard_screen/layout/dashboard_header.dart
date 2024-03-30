import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Pandit!',
              style: TextStyle(
                color: whiteColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '18 March, 2024',
              style: TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.green.shade900
                  : iconDark,
            ),
            child: const Icon(
              Icons.notifications,
              color: whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
