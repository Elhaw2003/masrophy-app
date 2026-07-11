import 'package:flutter/material.dart';
import 'package:masrophy_app/core/widgets/custom_appbar_widget.dart';

class ExpensesHeader extends StatelessWidget {
  const ExpensesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppbarWidget(title: "المصروفات");
  }
}
