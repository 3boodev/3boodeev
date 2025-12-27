import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.desktop,
    this.largeMobile,
    required this.mobile,
    this.tablet,
    this.extraLargeScreen,
  });

  final Widget desktop;
  final Widget? largeMobile;
  final Widget mobile;
  final Widget? tablet;
  final Widget? extraLargeScreen;

  // Breakpoints
  static const double mobileWidth = 600;
  static const double tabletWidth = 1024;
  static const double extraLargeWidth = 1400;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < mobileWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= mobileWidth &&
      MediaQuery.sizeOf(context).width < tabletWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= tabletWidth;

  static bool isSmallMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 380;

  // Backward compatibility methods if needed, but prefer the standard ones above.
  static bool isLargeMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width <= 700; // Kept for legacy support

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= extraLargeWidth && extraLargeScreen != null) {
          return extraLargeScreen!;
        } else if (constraints.maxWidth >= tabletWidth) {
          return desktop;
        } else if (constraints.maxWidth >= 700 && tablet != null) {
          return tablet!;
        } else if (constraints.maxWidth >= 500 && largeMobile != null) {
          return largeMobile!;
        } else {
          return mobile;
        }
      },
    );
  }
}
