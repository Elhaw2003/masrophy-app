import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';
import 'package:masrophy_app/core/extension/widget_extension.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';
import 'package:masrophy_app/core/theme/size/app_icon_size.dart';
import 'package:masrophy_app/core/theme/size/app_spacing.dart';
import 'package:masrophy_app/core/widgets/custom_scaffold_app.dart';
import 'package:masrophy_app/features/debts/presentation/view/widgets/debt_card.dart';
import 'package:masrophy_app/features/debts/presentation/view/widgets/debts_header.dart';
import 'package:masrophy_app/features/debts/presentation/view/widgets/debts_summary_card.dart';

class DebtsScreen extends StatefulWidget {
  const DebtsScreen({super.key});

  @override
  State<DebtsScreen> createState() => _DebtsScreenState();
}

class _DebtsScreenState extends State<DebtsScreen> {
  int _selectedTabIndex = 0; // 0: كل الديون, 1: متبقي, 2: مسددة

  final List<Map<String, dynamic>> _allDebts = [
    {
      'title': 'قرض شخصي',
      'subtitle': 'الأهلي',
      'remaining': '3,000',
      'total': '6,000',
      'percentage': 60,
      'progress': 0.6,
      'color': AppColors.expense,
      'isPaid': false,
    },
    {
      'title': 'بطاقة الائتمان',
      'subtitle': 'البنك التجاري الدولي',
      'remaining': '1,250',
      'total': '2,000',
      'percentage': 37,
      'progress': 0.37,
      'color': AppColors.blue,
      'isPaid': false,
    },
    {
      'title': 'دين لصديق',
      'subtitle': 'أحمد محمد',
      'remaining': '950',
      'total': '1,000',
      'percentage': 95,
      'progress': 0.95,
      'color': AppColors.success,
      'isPaid': false,
    },
    // Mock paid debt for demonstrating tab filtering
    {
      'title': 'دين لـ محمد',
      'subtitle': 'مسترد كامل',
      'remaining': '0',
      'total': '2,000',
      'percentage': 100,
      'progress': 1.0,
      'color': AppColors.success,
      'isPaid': true,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final iconColor = context.colorScheme.onSurface;

    // Filter debts based on selected tab
    final filteredDebts = _allDebts.where((debt) {
      if (_selectedTabIndex == 1) {
        return !debt['isPaid'] &&
            double.parse((debt['remaining'] as String).replaceAll(',', '')) > 0;
      } else if (_selectedTabIndex == 2) {
        return debt['isPaid'] ||
            double.parse((debt['remaining'] as String).replaceAll(',', '')) ==
                0;
      }
      return !debt['isPaid']; // Default Tab 0 (كل الديون) shows active debts
    }).toList();
    return CustomScaffoldApp(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DebtsHeader(),
            AppSpacing.md.verticalSpace,
            const DebtsSummaryCard(),
            AppSpacing.lg.verticalSpace,
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabItem('كل الديون', index: 0),
                _buildTabItem('متبقي', index: 1),
                _buildTabItem('مسددة', index: 2),
              ],
            ),
            AppSpacing.lg.verticalSpace,
            // List of Debts
            if (filteredDebts.isEmpty)
              Center(
                child: Column(
                  children: [
                    AppSpacing.xxl.verticalSpace,
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      size: AppIconSize.xl,
                      color: AppColors.grey400,
                    ),
                    AppSpacing.md.verticalSpace,
                    Text(
                      'لا توجد ديون حالياً',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.grey500,
                      ),
                    ),
                  ],
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredDebts.length,
                separatorBuilder: (context, index) =>
                    AppSpacing.md.verticalSpace,
                itemBuilder: (context, index) {
                  final debt = filteredDebts[index];
                  return DebtCard(
                    title: debt['title'] as String,
                    subtitle: debt['subtitle'] as String,
                    remaining: debt['remaining'] as String,
                    total: debt['total'] as String,
                    percentage: debt['percentage'] as int,
                    progressValue: debt['progress'] as double,
                    progressColor: debt['color'] as Color,
                  );
                },
              ),
          ],
        ),
      ).horizontalPadding(20),
    );
  }

  Widget _buildTabItem(String label, {required int index}) {
    final isSelected = _selectedTabIndex == index;
    final isDark = context.isDarkMode;

    return GestureDetector(
      onTap: () => setState(() => _selectedTabIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: context.textTheme.titleSmall?.copyWith(
              color: isSelected
                  ? AppColors.expense
                  : (isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
          AppSpacing.xs.verticalSpace,
          Container(
            width: 60.w,
            height: 2.h,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.expense : Colors.transparent,
              borderRadius: BorderRadius.circular(1.r),
            ),
          ),
        ],
      ),
    );
  }
}
