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
  static TextStyle get textStyle34Bold => GoogleFonts.raleway(
    fontSize: 34.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.appBarTitleColor,
  );

  static TextStyle get textStyle16W600Raleway =>
      GoogleFonts.raleway(fontSize: 16.sp, fontWeight: FontWeight.w600);

  static TextStyle get textStyle18W600Raleway =>
      GoogleFonts.raleway(fontSize: 18.sp, fontWeight: FontWeight.w600);

  static TextStyle get textStyle14W600Raleway =>
      GoogleFonts.raleway(fontSize: 14.sp, fontWeight: FontWeight.w600);

  static TextStyle get appBarTitleColor =>
      GoogleFonts.raleway(fontSize: 16.sp, fontWeight: FontWeight.w500);

  static TextStyle get textStyle12W500Raleway =>
      GoogleFonts.raleway(fontSize: 12.sp, fontWeight: FontWeight.w500);

  static TextStyle get textStyle13W500Raleway =>
      GoogleFonts.raleway(fontSize: 13.sp, fontWeight: FontWeight.w500);
  static TextStyle get textStyle16W500Raleway => GoogleFonts.raleway(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.appBarTitleColor,
  );
  static TextStyle get textStyle14W500Raleway => GoogleFonts.raleway(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.appBarTitleColor,
  );
  static TextStyle get textStyle14W400Raleway =>
      GoogleFonts.raleway(fontSize: 14.sp, fontWeight: FontWeight.w400);

  static TextStyle get textStyle12Grey =>
      GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey);

  static TextStyle get textStyle12W400Poppins =>
      GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w400);

  static TextStyle get textStyle11W500Poppins =>
      GoogleFonts.poppins(fontSize: 11.sp, fontWeight: FontWeight.w400);

  static TextStyle get textStyle12W500Poppins => GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  static TextStyle get textStyle14W500Poppins => GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static TextStyle get textStyle16W400Poppins => GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
  static TextStyle get textStyle16W500Poppins =>
      GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w500);
}
