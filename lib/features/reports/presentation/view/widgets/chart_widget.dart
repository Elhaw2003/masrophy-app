import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key, required this.categories});
  final List categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              centerSpaceRadius: 70.r,
              sectionsSpace: 0,
              startDegreeOffset: -90,
              sections: categories.map((item) {
                return PieChartSectionData(
                  value: item["percentage"].toDouble(),
                  color: item["color"],
                  radius: 18.r,
                  title: "",
                );
              }).toList(),
            ),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("إجمالي", style: context.textTheme.bodyMedium),

              Text(
                "15,400",
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
