import 'package:flutter_screenutil/flutter_screenutil.dart';

/// =======================================================
/// AppSpacing
/// -------------------------------------------------------
/// جميع المسافات المستخدمة داخل التطبيق.
///
/// يستخدم مع:
/// - Padding
/// - Margin
/// - SizedBox
/// - Gap بين الـ Widgets
///
/// ملاحظة:
/// نعتمد .w فقط للحفاظ على تناسق المسافات.
/// =======================================================
class AppSpacing {
  AppSpacing._();

  /// 4
  static double get xs => 4.w;

  /// 8
  static double get sm => 8.w;

  /// 12
  static double get md => 12.w;

  /// 16 (Default)
  static double get lg => 16.w;

  /// 20
  static double get xl => 20.w;

  /// 24
  static double get xxl => 24.w;

  /// 32
  static double get xxxl => 32.w;

  /// 40
  static double get huge => 40.w;

  /// 48
  static double get giant => 48.w;

  /// 64
  static double get massive => 64.w;
}
