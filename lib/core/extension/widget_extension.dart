import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetExtension on Widget {
  Widget horizontalPadding(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value.w),
      child: this,
    );
  }

  Widget verticalPadding(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value.h),
      child: this,
    );
  }

  Widget allPadding(double value) {
    return Padding(padding: EdgeInsets.all(value.r), child: this);
  }

  Widget center() {
    return Center(child: this);
  }

  Widget expanded() {
    return Expanded(child: this);
  }

  Widget flexible({int flex = 1}) {
    return Flexible(flex: flex, child: this);
  }

  Widget safeArea({bool top = true, bool bottom = true}) {
    return SafeArea(top: top, bottom: bottom, child: this);
  }
}
