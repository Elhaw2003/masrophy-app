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
                    const Color(0xFFE8F5E9),
                    AppColors.backgroundLight,
                    const Color.fromARGB(255, 154, 155, 155),
                  ],
          ),
        ),
        child: child.safeArea(),
      ),
    );
  }
}
