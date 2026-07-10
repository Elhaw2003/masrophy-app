import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/widget_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';
import 'package:masrophy_app/core/theme/size/app_spacing.dart';
import 'package:masrophy_app/core/widgets/custom_scaffold_app.dart';
import 'package:masrophy_app/features/income/presentation/view/widgets/income_card_item.dart';
import 'package:masrophy_app/features/income/presentation/view/widgets/income_header.dart';
import 'package:masrophy_app/features/income/presentation/view/widgets/summary_income_card.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> incomeSources = [
      {
        "title": "الراتب الشهري",
        "subtitle": "الشركة الحالية",
        "amount": 20000,
        "frequency": "كل شهر",
        "icon": Icons.work_outline_rounded,
        "backgroundColor": AppColors.success,
      },
      {
        "title": "عمل حر",
        "subtitle": "مشاريع مستقلة",
        "amount": 5000,
        "frequency": "كل شهر",
        "icon": Icons.desktop_windows_outlined,
        "backgroundColor": AppColors.success,
      },
      {
        "title": "استثمار",
        "subtitle": "أرباح الاستثمار",
        "amount": 2500,
        "frequency": "كل 3 أشهر",
        "icon": Icons.insert_chart_outlined_rounded,
        "backgroundColor": AppColors.warning,
      },
      {
        "title": "أخرى",
        "subtitle": "دخل إضافي",
        "amount": 350,
        "frequency": "عند الحاجة",
        "icon": Icons.more_horiz_rounded,
        "backgroundColor": AppColors.info,
      },
    ];
    return CustomScaffoldApp(
      child: SingleChildScrollView(
        child: Column(
          children: [
            IncomeHeader(),
            AppSpacing.lg.verticalSpace,
            SummaryIncomeCard(),
            AppSpacing.xl.verticalSpace,
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: incomeSources.length,
              separatorBuilder: (_, _) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final item = incomeSources[index];
                return IncomeCardItem(
                  title: item["title"],
                  subtitle: item["subtitle"],
                  amount: item["amount"],
                  frequency: item["frequency"],
                  icon: item["icon"],
                  iconColor: item["backgroundColor"],
                );
              },
            ),
          ],
        ),
      ).horizontalPadding(20),
    );
  }
}
