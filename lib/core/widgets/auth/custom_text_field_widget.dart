
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../values/app_colors.dart';


final OutlineInputBorder _customOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(4.0.r),
  borderSide: BorderSide(color: AppColors.gray, width: 1.0.w),
);

class CustomEditTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final double? width;
  final double? height;
  final bool? isPasswordField;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomEditTextFieldWidget({
    super.key,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.width,
    this.height,
    this.isPasswordField,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 343.w,
      height: height ?? 56.h,
      child: TextFormField(
        controller: controller,
        validator: validator,
        autofocus: false,
        cursorColor: AppColors.placeholder,
        obscureText: isPasswordField ?? false,
        decoration: InputDecoration(
          hintText: hintText ?? "",
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(
            color: AppColors.placeholder,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 18.h,
            horizontal: 18.w,
          ),
          enabledBorder: _customOutlineInputBorder.copyWith(
            borderSide: BorderSide(color: AppColors.black),
          ),
          focusedBorder: _customOutlineInputBorder.copyWith(
            borderSide: BorderSide(color: AppColors.black),
          ),
          errorBorder: _customOutlineInputBorder.copyWith(
            borderSide: BorderSide(color: AppColors.error),
          ),
          focusedErrorBorder: _customOutlineInputBorder.copyWith(
            borderSide: BorderSide(color: AppColors.error),
          ),
          filled: true,
          fillColor: AppColors.white,
          labelText: labelText ?? "$hintText",
          labelStyle: TextStyle(
            color: AppColors.gray,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
