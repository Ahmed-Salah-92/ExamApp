import 'package:exam_app/core/values/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../values/app_colors.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final double? width;
  final double? height;
  final double? borderRadius;
  final VoidCallback? onPressed;
  final bool isEnable;

  const CustomElevatedButtonWidget({
    super.key,
    required this.buttonText,
    this.buttonColor,
    this.textColor,
    this.fontSize,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    this.isEnable = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      autofocus: isEnable,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors.blue,
        fixedSize: Size(width ?? 343.w, height ?? 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 24.r),
        ),
      ),
      child: Text(buttonText ?? "", style: AppTextStyles.white16MediumRoboto),
    );
  }
}
