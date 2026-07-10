import 'package:flutter/material.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';

class GoalsHeader extends StatelessWidget {
  const GoalsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.add, color: AppColors.grey700),
        Text("الأهداف الماليه", style: context.textTheme.titleLarge),
        Icon(Icons.menu, color: AppColors.grey700),
      ],
    );
  }
}
