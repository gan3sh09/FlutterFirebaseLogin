import 'package:flutter/material.dart';
import 'package:loginapp/src/constants/colors.dart';

class ForgetPasswordBtnWidget extends StatefulWidget {
  const ForgetPasswordBtnWidget({
    required this.btnIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    super.key,
  });

  final IconData btnIcon;
  final String title, subtitle;
  final VoidCallback onTap;

  @override
  State<ForgetPasswordBtnWidget> createState() =>
      _ForgetPasswordBtnWidgetState();
}

class _ForgetPasswordBtnWidgetState extends State<ForgetPasswordBtnWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).brightness == Brightness.light
              ? containerLight
              : containerDark,
        ),
        child: Row(
          children: [
            Icon(
              widget.btnIcon,
              size: 60,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  widget.subtitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
