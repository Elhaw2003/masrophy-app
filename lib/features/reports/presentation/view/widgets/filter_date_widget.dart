import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';

class FilterDateWidget extends StatelessWidget {
  const FilterDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "هذا الشهر",
            style: context.textTheme.titleSmall!.copyWith(
              color: AppColors.grey700,
            ),
          ),
          Icon(Icons.keyboard_arrow_down, color: AppColors.grey700),
        ],
      ),
    );
  }
}
