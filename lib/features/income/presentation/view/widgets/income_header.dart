import 'package:flutter/material.dart';
import 'package:masrophy_app/core/widgets/custom_appbar_widget.dart';

class IncomeHeader extends StatelessWidget {
  const IncomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppbarWidget(title: "مصادر الدخل");
  }
}
