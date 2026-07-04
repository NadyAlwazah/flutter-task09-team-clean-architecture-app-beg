import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static TextStyle get textStyle32Bold => GoogleFonts.raleway(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.appBarTitleColor,
  );

  static TextStyle get textStyle16W600 =>
      GoogleFonts.raleway(fontSize: 16.sp, fontWeight: FontWeight.w600);

  static TextStyle get textStyle14W600Raleway =>
      GoogleFonts.raleway(fontSize: 14.sp, fontWeight: FontWeight.w600);

  static TextStyle get appBarTitleColor =>
      GoogleFonts.raleway(fontSize: 16.sp, fontWeight: FontWeight.w500);

  static TextStyle get textStyle12W500Raleway =>
      GoogleFonts.raleway(fontSize: 12.sp, fontWeight: FontWeight.w500);
  static TextStyle get textStyle16W500Raleway => GoogleFonts.raleway(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.appBarTitleColor,
  );

  static TextStyle get textStyle12Grey =>
      GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey);

  static TextStyle get textStyle12W400Poppins =>
      GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w400);

  static TextStyle get textStyle12W500Poppins => GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  static TextStyle get textStyle14W500Poppins =>
      GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500);
  static TextStyle get textStyle16W400Poppins => GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSubTitle,
  );
}
