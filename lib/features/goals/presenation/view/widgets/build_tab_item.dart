import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';
import 'package:masrophy_app/core/theme/size/app_radius.dart';
import 'package:masrophy_app/core/theme/size/app_spacing.dart';

class BuildTabItem extends StatelessWidget {
  const BuildTabItem({
    super.key,
    required this.isSelected,
    required this.index,
    required this.label,
    this.onTap,
  });
  final bool isSelected;
  final int index;
  final String label;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: context.textTheme.titleSmall?.copyWith(
              color: isSelected
                  ? AppColors.primary
                  : AppColors.textSecondaryLight,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
          AppSpacing.xs.verticalSpace,
          Container(
            width: 70.w,
            height: 2.h,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
          ),
        ],
      ),
    );
  }
}
