import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/values/app_colors.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final double? fontSize;
  final double? width;
  final double? height;
  final double? borderRadius;
  final VoidCallback? onPressed;

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
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors.blue,
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
        ),
      ),
      child: Text(
        buttonText ?? "",
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? 16.sp,
        ),
      ),
    );
  }
}
