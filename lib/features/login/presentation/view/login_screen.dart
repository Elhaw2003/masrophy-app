import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/extension/widget_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';
import 'package:masrophy_app/core/theme/size/app_spacing.dart';
import 'package:masrophy_app/core/widgets/custom_scaffold_app.dart';
import 'package:masrophy_app/features/login/presentation/view/widgets/login_button_widget.dart';
import 'package:masrophy_app/features/login/presentation/view/widgets/logo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return CustomScaffoldApp(
      child: Column(
        children: [
          const Spacer(flex: 2),
          Logo(),
          AppSpacing.lg.verticalSpace,
          Text(
            "مصروفي",
            style: context.textTheme.displayLarge!.copyWith(
              color: isDark ? AppColors.surfaceLight : AppColors.primary,
            ),
          ),
          AppSpacing.lg.verticalSpace,
          Text(
            "مرحبا بك مجددا في مصروفي",
            style: context.textTheme.titleSmall!.copyWith(
              color: isDark ? AppColors.surfaceLight : AppColors.primary,
            ),
          ),
          AppSpacing.lg.verticalSpace,
          Text(
            "أدر مصروفاتك وديونك وأهدافك المالية في مكان واحد",
            style: context.textTheme.titleSmall!.copyWith(
              color: isDark ? AppColors.grey100 : AppColors.primary,
            ),
          ),
          AppSpacing.lg.verticalSpace,
          LoginButtonWidget().horizontalPadding(AppSpacing.lg),
          Spacer(),
        ],
      ),
    );
  }
}
