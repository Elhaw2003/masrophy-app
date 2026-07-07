import 'package:flutter/material.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/extension/widget_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';

class CustomScaffoldApp extends StatelessWidget {
  const CustomScaffoldApp({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? [
                    AppColors.backgroundDark,
                    AppColors.surfaceDark,
                    AppColors.backgroundDark,
                  ]
                : [
                    AppColors.backgroundLight,
                    AppColors.backgroundLight,
                    AppColors.backgroundLight,
                  ],
          ),
        ),
        child: child.safeArea(),
      ),
    );
  }
}
