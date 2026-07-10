import 'package:flutter/material.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';

class ExpensesHeader extends StatelessWidget {
  const ExpensesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu),
        Text("المصروفات", style: context.textTheme.titleLarge),
        Icon(Icons.add),
      ],
    );
  }
}
