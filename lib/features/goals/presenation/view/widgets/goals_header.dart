import 'package:flutter/material.dart';
import 'package:masrophy_app/core/widgets/custom_appbar_widget.dart';

class GoalsHeader extends StatelessWidget {
  const GoalsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppbarWidget(title: "الأهداف الماليه");
  }
}
