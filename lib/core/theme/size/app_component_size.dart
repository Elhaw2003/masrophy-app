import 'package:flutter_screenutil/flutter_screenutil.dart';

/// =======================================================
/// AppSize
/// -------------------------------------------------------
/// جميع الأحجام الثابتة الخاصة بمكونات التطبيق.
///
/// يستخدم مع:
/// - Buttons
/// - TextFields
/// - AppBar
/// - Bottom Navigation
/// - Floating Action Button
/// - Avatar
/// - Images
/// =======================================================
class AppComponentSize {
  AppComponentSize._();

  // =========================
  // Buttons
  // =========================

  /// Default button height
  static double get buttonHeight => 48.h;

  /// Large button height
  static double get buttonLargeHeight => 56.h;

  // =========================
  // Inputs
  // =========================

  /// Default TextField height
  static double get inputHeight => 56.h;

  // =========================
  // AppBar
  // =========================

  static double get appBarHeight => 56.h;

  // =========================
  // Bottom Navigation
  // =========================

  static double get bottomNavigationHeight => 64.h;

  // =========================
  // Floating Action Button
  // =========================

  static double get fab => 56.w;

  static double get fabMini => 40.w;

  // =========================
  // Avatar
  // =========================

  static double get avatarSm => 32.w;

  static double get avatarMd => 40.w;

  static double get avatarLg => 56.w;

  static double get avatarXl => 72.w;

  // =========================
  // Images
  // =========================

  static double get imageSm => 60.w;

  static double get imageMd => 120.w;

  static double get imageLg => 180.w;
}
