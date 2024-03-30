import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';

class DashboardSearchBar extends StatelessWidget {
  const DashboardSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.green.shade900
            : iconDark,
      ),
      child: const Row(
        children: [
          Icon(
            Icons.search,
            color: whiteColor,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Search',
            style: TextStyle(color: whiteColor),
          ),
        ],
      ),
    );
  }
}
