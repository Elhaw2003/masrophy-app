import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/extension/widget_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';
import 'package:masrophy_app/core/theme/size/app_icon_size.dart';
import 'package:masrophy_app/core/theme/size/app_radius.dart';
import 'package:masrophy_app/core/theme/size/app_spacing.dart';

class SummeryCard extends StatelessWidget {
  const SummeryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppColors.walletGradient,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.15),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(AppRadius.sm),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("الملخص المالي", style: context.textTheme.titleMedium),
                    AppSpacing.sm.horizontalSpace,
                    Icon(
                      // _obscureBalances
                      //     ? Icons.visibility_off_outlined
                      // :
                      Icons.visibility_outlined,
                      color: Colors.white,
                      size: AppIconSize.sm,
                    ),
                  ],
                ),
              ),
            ),
          ),
          AppSpacing.sm.verticalSpace,

          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "إجمالي الرصيد",
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.surfaceLight.withValues(alpha: 0.7),
                    ),
                  ),
                  AppSpacing.xs.verticalSpace,
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '12,450',
                            // formatAmount('12,450'),
                            style: context.textTheme.displayMedium?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          AppSpacing.sm.horizontalSpace,
                          Text(
                            'جنيه',
                            style: context.textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  AppSpacing.xs.verticalSpace,
                  // Thin horizontal divider
                  Container(
                    height: 0.5,
                    color: Colors.white.withValues(alpha: 0.3),
                  ),
                  AppSpacing.sm.verticalSpace,
                  Row(
                    children: [
                      CardSubTitle(
                        title: "إجمالي الدخل",
                        value: "1800",
                        color: AppColors.primaryLight,
                      ),
                      AppSpacing.md.horizontalSpace,
                      // Vertical Divider
                      Container(
                        width: 0.5,
                        height: 35.h,
                        color: Colors.white.withValues(alpha: 0.3),
                      ),
                      AppSpacing.md.horizontalSpace,

                      CardSubTitle(
                        title: "إجمالي المصروف",
                        value: "9800",
                        color: AppColors.debt,
                      ),
                    ],
                  ),
                ],
              ),
              AppSpacing.sm.horizontalSpace,
              // Image.asset(
              //   AppAssets.summery,
              //   width: 120.w,
              //   height: 120.h,
              //   fit: BoxFit.contain,
              // ),
            ],
          ),
        ],
      ).allPadding(AppSpacing.sm),
    );
  }
}

class CardSubTitle extends StatelessWidget {
  const CardSubTitle({
    super.key,
    required this.title,
    required this.color,
    required this.value,
  });
  final String title;
  final Color color;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Text(
          title,
          style: context.textTheme.bodySmall?.copyWith(
            color: AppColors.surfaceLight.withValues(alpha: 0.7),
          ),
        ),
        AppSpacing.sm.verticalSpace,
        FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: context.textTheme.titleMedium?.copyWith(color: color),
              ),
              AppSpacing.sm.horizontalSpace,
              Text(
                'جنيه',
                style: context.textTheme.bodySmall?.copyWith(
                  color: AppColors.primaryLight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
