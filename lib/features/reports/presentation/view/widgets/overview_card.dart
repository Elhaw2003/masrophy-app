import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';
import 'package:masrophy_app/core/theme/size/app_icon_size.dart';
import 'package:masrophy_app/core/theme/size/app_spacing.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({super.key, required this.item});

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: context.isDarkMode ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(20),
        // border: Border.all(
        //   color: context.isDarkMode ? AppColors.borderDark : AppColors.grey200,
        // ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item["title"],
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondaryLight,
            ),
          ),
          AppSpacing.sm.verticalSpace,

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                item["amount"],
                style: context.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: item["changeColor"],
                ),
              ),

              AppSpacing.xs.horizontalSpace,

              if ((item["currency"] as String).isNotEmpty)
                Text(
                  item["currency"],
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondaryLight,
                  ),
                ),
            ],
          ),
          AppSpacing.xs.verticalSpace,
          if ((item["subtitle"] as String).isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (item["icon"] != null)
                  Icon(
                    item["icon"],
                    size: AppIconSize.sm,
                    color: item["changeColor"],
                  ),

                if ((item["change"] as String).isNotEmpty)
                  Text(
                    item["change"],
                    style: context.textTheme.bodySmall?.copyWith(
                      color: item["changeColor"],
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                AppSpacing.xs.horizontalSpace,

                Text(
                  item["subtitle"],
                  style: context.textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
