import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';
import 'package:masrophy_app/core/theme/size/app_icon_size.dart';
import 'package:masrophy_app/core/theme/size/app_radius.dart';
import 'package:masrophy_app/core/theme/size/app_spacing.dart';

class GoalCard extends StatelessWidget {
  final String title;
  final String current;
  final String target;
  final int percentage;
  final double progressValue;
  final IconData icon;
  final Color color;

  const GoalCard({
    super.key,
    required this.title,
    required this.current,
    required this.target,
    required this.percentage,
    required this.progressValue,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 44.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Icon(icon, color: color, size: AppIconSize.md),
              ),
              AppSpacing.md.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: context.textTheme.titleMedium),
                  4.verticalSpace,
                  Text('$current EGP', style: context.textTheme.bodyMedium),
                  2.verticalSpace,
                  Text(
                    'من $target EGP',
                    style: context.textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Row(
            children: [
              Text(
                '$percentage%',
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondaryLight,
                ),
              ),
              8.horizontalSpace,
              SizedBox(
                width: 80.w,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(10),
                  child: LinearProgressIndicator(
                    value: progressValue,
                    minHeight: 6.h,
                    backgroundColor: AppColors.grey100,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
