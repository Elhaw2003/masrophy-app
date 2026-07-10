import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/widget_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';
import 'package:masrophy_app/core/theme/size/app_spacing.dart';
import 'package:masrophy_app/core/widgets/custom_scaffold_app.dart';
import 'package:masrophy_app/features/goals/presenation/view/widgets/build_tab_item.dart';
import 'package:masrophy_app/features/goals/presenation/view/widgets/goal_card.dart';
import 'package:masrophy_app/features/goals/presenation/view/widgets/goals_header.dart';
import 'package:masrophy_app/features/goals/presenation/view/widgets/goals_summary_card.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  int selectedIndex = 0;
  final List<Map<String, dynamic>> _allGoals = [
    {
      'title': 'شراء سيارة',
      'current': '250,000',
      'target': '250,000',
      'percentage': 100,
      'progress': 1,
      'icon': Icons.directions_car_rounded,
      'color': AppColors.blue,
      'isActive': false,
    },
    {
      'title': 'سفر تركيا',
      'current': '12,500',
      'target': '25,000',
      'percentage': 50,
      'progress': 0.5,
      'icon': Icons.airplanemode_active_rounded,
      'color': AppColors.success,
      'isActive': true,
    },
    {
      'title': 'صندوق الطوارئ',
      'current': '8,000',
      'target': '10,000',
      'percentage': 80,
      'progress': 0.8,
      'icon': Icons.shield_rounded,
      'color': AppColors.success,
      'isActive': true,
    },
    {
      'title': 'شراء منزل',
      'current': '0',
      'target': '500,000',
      'percentage': 0,
      'progress': 0.0,
      'icon': Icons.home_rounded,
      'color': AppColors.expense,
      'isActive': true,
    },

    {
      'title': 'هاتف جديد',
      'current': '15,000',
      'target': '15,000',
      'percentage': 100,
      'progress': 1.0,
      'icon': Icons.phone_android_rounded,
      'color': AppColors.success,
      'isActive': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredGoals = _allGoals.where((goal) {
      if (selectedIndex == 1) {
        return !goal["isActive"];
      }
      return goal["isActive"];
    }).toList();

    return CustomScaffoldApp(
      child: SingleChildScrollView(
        child: Column(
          children: [
            GoalsHeader(),
            AppSpacing.lg.verticalSpace,
            GoalsSummaryCard(),
            AppSpacing.xl.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: BuildTabItem(
                    label: "نشطه",
                    index: 0,
                    isSelected: selectedIndex == 0,
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: BuildTabItem(
                    label: "مكتمله",
                    index: 1,
                    isSelected: selectedIndex == 1,
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                ),
              ],
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final goal = filteredGoals[index];
                return GoalCard(
                  title: goal["title"] as String,
                  current: goal["current"] as String,
                  target: goal["target"] as String,
                  percentage: goal["percentage"] as int,
                  progressValue: (goal["progress"] as num).toDouble(),
                  icon: goal["icon"] as IconData,
                  color: goal["color"] as Color,
                );
              },
              separatorBuilder: (context, index) => AppSpacing.md.verticalSpace,
              itemCount: filteredGoals.length,
            ),
          ],
        ),
      ).horizontalPadding(20),
    );
  }
}
