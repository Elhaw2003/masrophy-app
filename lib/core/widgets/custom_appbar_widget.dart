import 'package:flutter/material.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';
import 'package:masrophy_app/core/theme/size/app_icon_size.dart';

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            size: AppIconSize.md,
            color: AppColors.grey700,
          ),
        ),
        Text(title, style: context.textTheme.titleLarge),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add, size: AppIconSize.md, color: AppColors.grey700),
        ),
      ],
    );
  }
}
