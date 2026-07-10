import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/theme/size/app_spacing.dart';
import 'package:masrophy_app/features/expenses/presentation/view/widgets/expenses_item_card.dart';

class ExpensesDateAndItemCard extends StatelessWidget {
  const ExpensesDateAndItemCard({
    super.key,
    required this.date,
    required this.items,
  });
  final String date;
  final List items;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(date, style: context.textTheme.titleMedium),
        ),
        AppSpacing.md.verticalSpace,
        ExpensesItemCard(items: items),
      ],
    );
  }
}
