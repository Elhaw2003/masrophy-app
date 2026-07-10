import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/widget_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';
import 'package:masrophy_app/core/theme/size/app_spacing.dart';
import 'package:masrophy_app/core/widgets/custom_scaffold_app.dart';
import 'package:masrophy_app/features/expenses/presentation/view/widgets/expenses_date_and_card_item.dart';
import 'package:masrophy_app/features/expenses/presentation/view/widgets/expenses_header.dart';
import 'package:masrophy_app/features/expenses/presentation/view/widgets/expenses_summary_card.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesState();
}

class _ExpensesState extends State<ExpensesScreen> {
  final List<Map<String, dynamic>> expenses = [
    {
      "date": "اليوم",
      "items": [
        {
          "title": "مطعم",
          "subtitle": "غداء مع الأصدقاء • 12:30 م",
          "amount": 180,
          "isExpense": true,
          "icon": Icons.coffee,
          "color": AppColors.expense,
        },
        {
          "title": "مواصلات",
          "subtitle": "مترو • 08:15 ص",
          "amount": 20,
          "isExpense": false,
          "icon": Icons.local_taxi_outlined,
          "color": AppColors.primary,
        },
        {
          "title": "قهوة",
          "subtitle": "ستاربكس • 07:45 ص",
          "amount": 45,
          "isExpense": false,
          "icon": Icons.coffee_outlined,
          "color": AppColors.warning,
        },
      ],
    },
    {
      "date": "أمس",
      "items": [
        {
          "title": "فواتير",
          "subtitle": "فاتورة الكهرباء • 04:30 م",
          "amount": 350,
          "isExpense": true,
          "icon": Icons.receipt_long_outlined,
          "color": Colors.indigo,
        },
        {
          "title": "تسوق",
          "subtitle": "ملابس • 02:15 م",
          "amount": 320,
          "isExpense": false,
          "icon": Icons.shopping_bag_outlined,
          "color": AppColors.success,
        },
      ],
    },
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldApp(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ExpensesHeader(),
            AppSpacing.md.verticalSpace,
            ExpensesSummaryCard(),
            AppSpacing.xl.verticalSpace,
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: expenses.length,
              separatorBuilder: (_, _) => AppSpacing.lg.verticalSpace,
              itemBuilder: (_, index) {
                final group = expenses[index];
                return ExpensesDateAndItemCard(
                  date: group["date"] as String,
                  items: group["items"] as List<Map<String, dynamic>>,
                );
              },
            ),
          ],
        ),
      ).horizontalPadding(20),
    );
  }
}
