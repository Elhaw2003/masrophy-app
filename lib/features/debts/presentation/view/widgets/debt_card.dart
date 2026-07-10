import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';
import 'package:masrophy_app/core/theme/size/app_radius.dart';

class DebtCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String remaining;
  final String total;
  final int percentage;
  final double progressValue;
  final Color progressColor;

  const DebtCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.remaining,
    required this.total,
    required this.percentage,
    required this.progressValue,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: Column(
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title & Subtitle (Right)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(title, style: context.textTheme.titleMedium),
                  4.verticalSpace,
                  Text(
                    subtitle,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
              // Remaining (Left)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$remaining EGP',
                    style: context.textTheme.titleMedium?.copyWith(),
                  ),
                  2.verticalSpace,
                  Text(
                    'تبقي',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ],
          ),
          12.verticalSpace,
          // Bottom Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Progress Bar & Percentage (Right)
              Expanded(
                child: Row(
                  children: [
                    Text(
                      '$percentage%',
                      style: context.textTheme.labelSmall?.copyWith(),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(10.r),
                        child: LinearProgressIndicator(
                          value: progressValue,
                          minHeight: 6.h,
                          backgroundColor: isDark
                              ? AppColors.borderDark
                              : AppColors.grey100,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            progressColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              24.horizontalSpace,
              // Total Amount (Left)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$total EGP',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                  2.verticalSpace,
                  Text(
                    'الإجمالي',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
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
