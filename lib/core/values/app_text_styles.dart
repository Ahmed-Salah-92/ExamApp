import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';


class AppTextStyles {
  /// Font Family Inter
  static TextStyle black20MediumInter = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: 20.sp,
    color: AppColors.black,
  );
  static TextStyle black16RegularInter = GoogleFonts.inter(
    fontWeight: FontWeight.normal,
    fontSize: 16.sp,
    color: AppColors.black,
  );
  static TextStyle blue16MediumInter = GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: AppColors.blue,
  );
  static TextStyle black13RegularInter = GoogleFonts.inter(
    fontWeight: FontWeight.normal,
    fontSize: 13.sp,
    color: AppColors.black,
  );
  static TextStyle black12RegularInter = GoogleFonts.inter(
    fontWeight: FontWeight.normal,
    fontSize: 12.sp,
    color: AppColors.black,
  );

  /// Font Family Roboto
  static TextStyle white16MediumRoboto = GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: AppColors.white,
  );
  static TextStyle grayLight14RegularRoboto = GoogleFonts.roboto(
    fontWeight: FontWeight.normal,
    fontSize: 14.sp,
    color: AppColors.placeholder,
  );
  static TextStyle gray12RegularRoboto = GoogleFonts.roboto(
    fontWeight: FontWeight.normal,
    fontSize: 12.sp,
    color: AppColors.gray,
  );
  static TextStyle red12RegularRoboto = GoogleFonts.roboto(
    fontWeight: FontWeight.normal,
    fontSize: 12.sp,
    color: AppColors.error,
  );
}
