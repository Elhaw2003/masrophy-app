import 'package:flutter_screenutil/flutter_screenutil.dart';

/// =======================================================
/// AppFontSize
/// -------------------------------------------------------
/// جميع أحجام الخطوط المستخدمة داخل التطبيق.
///
/// يستخدم مع:
/// - TextStyle.fontSize
/// =======================================================
class AppFontSize {
  AppFontSize._();

  static double get xs => 10.sp;
  static double get sm => 12.sp;
  static double get md => 14.sp; // Default text
  static double get lg => 16.sp;
  static double get xl => 18.sp;
  static double get xxl => 20.sp;
  static double get heading => 24.sp;
  static double get display => 32.sp;
}
