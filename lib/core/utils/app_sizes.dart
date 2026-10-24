import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Centralized responsive sizing utility using flutter_screenutil and MediaQuery.
abstract class AppSizes {
  // Breakpoints & MediaQuery Helpers
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 600 &&
      MediaQuery.sizeOf(context).width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1200;

  static double screenWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;

  static T responsiveValue<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    }
    if (isTablet(context)) {
      return tablet ?? mobile;
    }
    return mobile;
  }

  // Spacing, Padding, and Margins (Responsive width/height)
  static double get s2 => 2.w;
  static double get s4 => 4.w;
  static double get s6 => 6.w;
  static double get s8 => 8.w;
  static double get s10 => 10.w;
  static double get s12 => 12.w;
  static double get s16 => 16.w;
  static double get s18 => 18.w;
  static double get s20 => 20.w;
  static double get s24 => 24.w;
  static double get s28 => 28.w;
  static double get s32 => 32.w;
  static double get s40 => 40.w;
  static double get s48 => 48.w;
  static double get s64 => 64.w;

  // Vertical Spacing
  static double get h2 => 2.h;
  static double get h4 => 4.h;
  static double get h6 => 6.h;
  static double get h8 => 8.h;
  static double get h10 => 10.h;
  static double get h12 => 12.h;
  static double get h16 => 16.h;
  static double get h20 => 20.h;
  static double get h24 => 24.h;
  static double get h32 => 32.h;
  static double get h40 => 40.h;
  static double get h48 => 48.h;
  static double get h64 => 64.h;

  // EdgeInsets helpers
  static EdgeInsets get p4 => EdgeInsets.all(4.r);
  static EdgeInsets get p6 => EdgeInsets.all(6.r);
  static EdgeInsets get p8 => EdgeInsets.all(8.r);
  static EdgeInsets get p10 => EdgeInsets.all(10.r);
  static EdgeInsets get p12 => EdgeInsets.all(12.r);
  static EdgeInsets get p16 => EdgeInsets.all(16.r);
  static EdgeInsets get p20 => EdgeInsets.all(20.r);
  static EdgeInsets get p24 => EdgeInsets.all(24.r);
  static EdgeInsets get p32 => EdgeInsets.all(32.r);

  static EdgeInsets get horizontalP8 => EdgeInsets.symmetric(horizontal: 8.w);
  static EdgeInsets get horizontalP12 => EdgeInsets.symmetric(horizontal: 12.w);
  static EdgeInsets get horizontalP16 => EdgeInsets.symmetric(horizontal: 16.w);
  static EdgeInsets get horizontalP24 => EdgeInsets.symmetric(horizontal: 24.w);

  static EdgeInsets get verticalP8 => EdgeInsets.symmetric(vertical: 8.h);
  static EdgeInsets get verticalP12 => EdgeInsets.symmetric(vertical: 12.h);
  static EdgeInsets get verticalP16 => EdgeInsets.symmetric(vertical: 16.h);
  static EdgeInsets get verticalP24 => EdgeInsets.symmetric(vertical: 24.h);

  // Border Radii (Responsive radius)
  static Radius get radius2 => Radius.circular(2.r);
  static Radius get radius4 => Radius.circular(4.r);
  static Radius get radius8 => Radius.circular(8.r);
  static Radius get radius10 => Radius.circular(10.r);
  static Radius get radius12 => Radius.circular(12.r);
  static Radius get radius16 => Radius.circular(16.r);
  static Radius get radius20 => Radius.circular(20.r);
  static Radius get radius24 => Radius.circular(24.r);
  static Radius get radius32 => Radius.circular(32.r);
  static Radius get radiusFull => Radius.circular(100.r);

  static BorderRadius get borderR2 => BorderRadius.circular(2.r);
  static BorderRadius get borderR4 => BorderRadius.circular(4.r);
  static BorderRadius get borderR8 => BorderRadius.circular(8.r);
  static BorderRadius get borderR10 => BorderRadius.circular(10.r);
  static BorderRadius get borderR12 => BorderRadius.circular(12.r);
  static BorderRadius get borderR16 => BorderRadius.circular(16.r);
  static BorderRadius get borderR20 => BorderRadius.circular(20.r);
  static BorderRadius get borderR24 => BorderRadius.circular(24.r);
  static BorderRadius get borderR32 => BorderRadius.circular(32.r);
  static BorderRadius get borderRFull => BorderRadius.circular(100.r);

  // Font Sizes (Responsive sp)
  static double get font10 => 10.sp;
  static double get font11 => 11.sp;
  static double get font12 => 12.sp;
  static double get font13 => 13.sp;
  static double get font14 => 14.sp;
  static double get font15 => 15.sp;
  static double get font16 => 16.sp;
  static double get font18 => 18.sp;
  static double get font19 => 19.sp;
  static double get font20 => 20.sp;
  static double get font22 => 22.sp;
  static double get font23 => 23.sp;
  static double get font24 => 24.sp;
  static double get font26 => 26.sp;
  static double get font28 => 28.sp;
  static double get font32 => 32.sp;

  // Component Sizes (Buttons, Icons, Heights)
  static double get buttonHeight => 54.h;
  static double get appBarHeight => 56.h;
  static double get iconSmall => 16.r;
  static double get iconMedium => 24.r;
  static double get iconLarge => 32.r;
  static double get bottomNavHeight => 70.h;
}
