import 'package:flutter_screenutil/flutter_screenutil.dart';

/// =======================================================
/// AppRadius
/// -------------------------------------------------------
/// جميع قيم الـ Border Radius المستخدمة في التطبيق.
///
/// يستخدم مع:
/// - BorderRadius.circular()
/// - Radius.circular()
/// =======================================================
class AppRadius {
  AppRadius._();

  /// 4
  static double get xs => 4.r;

  /// 8
  static double get sm => 8.r;

  /// 12 (Default)
  static double get md => 12.r;

  /// 16
  static double get lg => 16.r;

  /// 20
  static double get xl => 20.r;

  /// 24
  static double get xxl => 24.r;

  /// يستخدم للعناصر الدائرية بالكامل
  static double get circle => 999.r;
}
