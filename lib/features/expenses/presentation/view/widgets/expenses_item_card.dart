import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';
import 'package:masrophy_app/core/theme/size/app_radius.dart';
import 'package:masrophy_app/core/theme/size/app_spacing.dart';

class ExpensesItemCard extends StatelessWidget {
  const ExpensesItemCard({super.key, required this.items});
  final List items;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.isDarkMode ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: context.isDarkMode
              ? AppColors.borderDark
              : AppColors.surfaceLight,
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
        itemCount: items.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          thickness: 0.5,
          color: context.isDarkMode ? AppColors.dividerDark : AppColors.grey200,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
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
                        color: (item['color'] as Color).withValues(alpha: 0.08),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: iconWidget,
                    ),
                    12.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'] as String,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: context.isDarkMode
                                ? AppColors.textPrimaryDark
                                : AppColors.grey700,
                          ),
                        ),
                        Text(
                          item['subtitle'] as String,
                          style: context.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: context.isDarkMode
                                ? AppColors.textPrimaryDark
                                : AppColors.grey700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      item['amount'].toString(),
                      style: context.textTheme.titleMedium?.copyWith(
                        color: item["isExpense"] ? AppColors.error : null,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    4.horizontalSpace,
                    Text(
                      "EGP",
                      style: context.textTheme.titleMedium?.copyWith(
                        color: item["isExpense"] ? AppColors.error : null,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
