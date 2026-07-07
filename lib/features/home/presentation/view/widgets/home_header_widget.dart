import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';
import 'package:masrophy_app/core/theme/size/app_radius.dart';
import 'package:masrophy_app/core/theme/size/app_spacing.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: user.photoURL!,
            width: AppRadius.lg * 2,
            height: AppRadius.lg * 2,
            fit: BoxFit.cover,
            placeholder: (context, url) => SizedBox(
              width: AppRadius.lg * 2,
              height: AppRadius.lg * 2,
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              width: AppRadius.lg * 2,
              height: AppRadius.lg * 2,
              alignment: Alignment.center,
              color: Colors.grey.shade300,
              child: const Icon(Icons.person),
            ),
          ),
        ),
        AppSpacing.sm.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'مرحباً، ${user.displayName}',
              style: context.textTheme.titleLarge,
            ),
            AppSpacing.sm.verticalSpace,
            Text(
              'التحكم في أموالك هو أول خطوة للحرية الماليه',
              style: context.textTheme.bodySmall!.copyWith(
                color: AppColors.grey300,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
