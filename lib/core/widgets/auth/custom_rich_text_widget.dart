import 'package:flutter/material.dart';

import '../../values/app_colors.dart';


class CustomRichTextWidget extends StatelessWidget {
  final Function() onTap;
  final String firstText;
  final String secondText;
  const CustomRichTextWidget({
    super.key,
    required this.onTap,
    required this.firstText,
    required this.secondText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: RichText(
          text: TextSpan(
            text: firstText,
            style: TextStyle(
              color: AppColors.black,
              decoration: TextDecoration.underline,
            ),
            children: [
              TextSpan(
                text: secondText,
                style: TextStyle(
                  color: AppColors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
