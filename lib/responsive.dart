import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});

  static const tabletWidthMax = 1100;
  static const mobileWidthMax = 600;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileWidthMax;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width > mobileWidthMax &&
      MediaQuery.of(context).size.width < tabletWidthMax;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > tabletWidthMax;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= tabletWidthMax) {
        return desktop;
      } else if (constraints.maxWidth < tabletWidthMax &&
          constraints.maxWidth > mobileWidthMax) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
