import 'package:flutter/material.dart';
import 'package:masrophy_app/core/extension/build_context_extension.dart';

class DebtsHeader extends StatelessWidget {
  const DebtsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu),
        Text("الديون", style: context.textTheme.titleLarge),
        Icon(Icons.add),
      ],
    );
  }
}
