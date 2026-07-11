import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/features/reports/presentation/view/widgets/overview_card.dart';

class OverviewGridWidget extends StatelessWidget {
  const OverviewGridWidget({super.key, required this.items});
  final List items;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 12,
        childAspectRatio: 1.25,
      ),
      itemBuilder: (_, index) {
        return OverviewCard(item: items[index]);
      },
    );
  }
}
