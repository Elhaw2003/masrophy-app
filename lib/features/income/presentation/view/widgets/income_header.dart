import 'package:flutter/material.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';

class IncomeHeader extends StatelessWidget {
  const IncomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu, color: AppColors.grey700),
        Text("مصادر الدخل", style: context.textTheme.titleLarge),
        Icon(Icons.add, color: AppColors.grey700),
      ],
    );
  }
}
