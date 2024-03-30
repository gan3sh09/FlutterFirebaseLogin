import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.image,
    required this.title,
    this.subTitle,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textAlign,
    this.heightBetween,
    this.heightBetweenImage,
  });

  final String image, title;
  final String? subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;
  final double? heightBetween;
  final double? heightBetweenImage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(image),
          height: size.height * 0.2,
        ),
        SizedBox(
          height: heightBetweenImage,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(
          height: heightBetween,
        ),
        Text(
          subTitle!,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
