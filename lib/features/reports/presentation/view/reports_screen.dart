import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/extension/widget_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';
import 'package:masrophy_app/core/theme/size/app_spacing.dart';
import 'package:masrophy_app/core/widgets/custom_appbar_widget.dart';
import 'package:masrophy_app/core/widgets/custom_scaffold_app.dart';
import 'package:masrophy_app/features/reports/presentation/view/widgets/chart_widget.dart';
import 'package:masrophy_app/features/reports/presentation/view/widgets/filter_date_widget.dart';
import 'package:masrophy_app/features/reports/presentation/view/widgets/legend_widget.dart';
import 'package:masrophy_app/features/reports/presentation/view/widgets/overview_grid_widget.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> overviewData = [
      {
        "title": "إجمالي الدخل",
        "amount": "27,850",
        "currency": "EGP",
        "subtitle": "عن الشهر الماضي",
        "change": "+12%",
        "changeColor": AppColors.success,
        "icon": Icons.arrow_drop_up,
      },
      {
        "title": "إجمالي المصروفات",
        "amount": "15,400",
        "currency": "EGP",
        "subtitle": "عن الشهر الماضي",
        "change": "-8%",
        "changeColor": AppColors.expense,
        "icon": Icons.arrow_drop_down,
      },
      {
        "title": "صافي الدخل",
        "amount": "12,450",
        "currency": "EGP",
        "subtitle": "",
        "change": "",
        "changeColor": AppColors.black,
        "icon": null,
      },
      {
        "title": "معدل التوفير",
        "amount": "45%",
        "currency": "",
        "subtitle": "من الدخل",
        "change": "",
        "changeColor": AppColors.success,
        "icon": null,
      },
    ];

    final List<Map<String, dynamic>> categories = [
      {
        "title": "المواصلات",
        "amount": 3850,
        "percentage": 25,
        "color": const Color(0xff3B82F6),
      },
      {
        "title": "الطعام",
        "amount": 4620,
        "percentage": 30,
        "color": const Color(0xffEF4444),
      },
      {
        "title": "الفواتير",
        "amount": 2310,
        "percentage": 15,
        "color": const Color(0xffFBBF24),
      },
      {
        "title": "التسوق",
        "amount": 1540,
        "percentage": 10,
        "color": const Color(0xff8B5CF6),
      },
      {
        "title": "أخرى",
        "amount": 3080,
        "percentage": 8,
        "color": const Color(0xffEC4899),
      },
    ];
    return CustomScaffoldApp(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbarWidget(title: "الملخص والإحصائيات"),
            AppSpacing.md.verticalSpace,
            FilterDateWidget(),
            AppSpacing.lg.verticalSpace,
            OverviewGridWidget(items: overviewData),
            AppSpacing.md.verticalSpace,
            Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                color: context.isDarkMode ? AppColors.cardDark : Colors.white,
                borderRadius: BorderRadius.circular(20),
                // border: Border.all(
                //   color: context.isDarkMode ? AppColors.borderDark : AppColors.grey200,
                // ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "المصروفات حسب الفئه",
                    style: context.textTheme.titleMedium,
                  ),
                  AppSpacing.md.verticalSpace,
                  ChartWidget(categories: categories),
                  LegendWidget(categories: categories),
                ],
              ),
            ),
          ],
        ),
      ).horizontalPadding(20),
    );
  }
}
