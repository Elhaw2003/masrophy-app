import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';

class LegendWidget extends StatelessWidget {
  const LegendWidget({super.key, required this.categories});
  final List categories;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      separatorBuilder: (_, _) => 12.verticalSpace,
      itemBuilder: (_, index) {
        final item = categories[index];

        return Row(
          children: [
            CircleAvatar(radius: 5, backgroundColor: item["color"]),
            8.horizontalSpace,
            Text(item["title"], style: context.textTheme.titleSmall),
            const Spacer(),

            Text(
              "${item["percentage"]}%",
              style: context.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.grey500,
              ),
            ),

            12.horizontalSpace,

            Text("EGP ${item["amount"]}", style: context.textTheme.titleSmall),
          ],
        );
      },
    );
  }
}
