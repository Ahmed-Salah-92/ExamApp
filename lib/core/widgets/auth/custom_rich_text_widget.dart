import 'package:flutter/material.dart';
import '../../values/app_text_styles.dart';

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
            style: AppTextStyles.black16RegularInter,
            children: [
              TextSpan(
                text: secondText,
                style: AppTextStyles.blue16MediumInter.copyWith(
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