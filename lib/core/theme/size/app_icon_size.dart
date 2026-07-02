import 'package:flutter_screenutil/flutter_screenutil.dart';

/// =======================================================
/// AppIconSize
/// -------------------------------------------------------
/// جميع أحجام الأيقونات المستخدمة داخل التطبيق.
///
/// يستخدم مع:
/// - Icon.size
/// - SvgPicture.width / height (عند استخدام SVG كأيقونة)
/// =======================================================
class AppIconSize {
  AppIconSize._();

  /// Small icon
  static double get sm => 16.sp;

  /// Default icon
  static double get md => 20.sp;

  /// Large icon
  static double get lg => 24.sp;

  /// Extra Large icon
  static double get xl => 32.sp;

  /// Huge icon
  static double get xxl => 40.sp;
}
