import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/extension/widget_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';
import 'package:masrophy_app/core/theme/size/app_radius.dart';
import 'package:masrophy_app/core/theme/size/app_spacing.dart';

class OverviewSection extends StatelessWidget {
  const OverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final overviewItems = [
      {
        'title': "مصاريف اليوم",
        'value': '460',
        'currency': 'ج م',
        'icon': Icons.account_balance_wallet_outlined,
        'hasFilter': true,
        'filterColor': AppColors.error,
        'color': AppColors.error,
        'valueColor': context.isDarkMode
            ? AppColors.textPrimaryDark
            : AppColors.grey800,
      },
      {
        'title': "دخل الشهر الحالي",
        'value': '8,250',
        'currency': 'ج م',
        'icon': Icons.account_balance_wallet_outlined,
        'hasFilter': false,
        'color': AppColors.success,
        'valueColor': AppColors.success,
      },
      {
        'title': "إجمالي الديون",
        'value': '5,200',
        'currency': 'ج م',
        'icon': Icons.account_balance_wallet_outlined,
        'hasFilter': true,
        'filterColor': AppColors.warning,
        'color': AppColors.warning,
        'valueColor': AppColors.error,
      },
      {
        'title': "الأهداف المكتملة",
        'value': '3 / 5',
        'currency': '',
        'icon': Icons.track_changes_rounded,
        'hasFilter': false,
        'color': AppColors.saving,
        'valueColor': AppColors.saving,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text("نظرة عامة", style: context.textTheme.titleMedium),
        ),
        AppSpacing.md.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: context.isDarkMode ? AppColors.cardDark : Colors.white,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(
              color: context.isDarkMode
                  ? AppColors.borderDark
                  : AppColors.grey200,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: overviewItems.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              thickness: 0.5,
              color: context.isDarkMode
                  ? AppColors.dividerDark
                  : AppColors.grey200,
            ),
            itemBuilder: (context, index) {
              final item = overviewItems[index];
              Widget iconWidget = Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: (item['color'] as Color).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                child: Icon(
                  item['icon'] as IconData,
                  size: 20.sp,
                  color: item['color'] as Color,
                ),
              );
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: 14.h,
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: (item['color'] as Color).withValues(
                              alpha: 0.08,
                            ),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: iconWidget,
                        ),
                        12.horizontalSpace,
                        Text(
                          item['title'] as String,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.isDarkMode
                                ? AppColors.textPrimaryDark
                                : AppColors.grey700,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          item['value'] as String,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: item['valueColor'] as Color,
                          ),
                        ),
                        if ((item['currency'] as String).isNotEmpty) ...[
                          4.horizontalSpace,
                          Text(
                            item['currency'] as String,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: item['valueColor'] as Color,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ).horizontalPadding(AppSpacing.md);
  }
}
