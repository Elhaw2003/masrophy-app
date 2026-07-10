import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';
import 'package:masrophy_app/core/theme/size/app_radius.dart';
import 'package:masrophy_app/core/theme/size/app_spacing.dart';

class IncomeCardItem extends StatelessWidget {
  const IncomeCardItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.frequency,
    required this.icon,
    required this.iconColor,
  });

  final String title;
  final String subtitle;
  final int amount;
  final String frequency;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: context.isDarkMode ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(
          color: context.isDarkMode ? AppColors.borderDark : Colors.white,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .03),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
            child: Icon(icon, size: 20.sp, color: iconColor),
          ),

          AppSpacing.md.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.isDarkMode
                      ? AppColors.textPrimaryDark
                      : AppColors.grey900,
                ),
              ),
              AppSpacing.xs.verticalSpace,
              Text(
                subtitle,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.isDarkMode
                      ? AppColors.textSecondaryDark
                      : AppColors.grey500,
                ),
              ),
            ],
          ),

          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'EGP ',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: amount.toString(),
                      style: context.textTheme.titleLarge?.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.xs.verticalSpace,
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 14.sp,
                    color: context.isDarkMode
                        ? AppColors.textSecondaryDark
                        : AppColors.grey500,
                  ),
                  4.horizontalSpace,
                  Text(
                    frequency,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.isDarkMode
                          ? AppColors.textSecondaryDark
                          : AppColors.grey500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
