import 'package:flutter/material.dart';
import 'package:masrophy_app/core/widgets/custom_appbar_widget.dart';

class DebtsHeader extends StatelessWidget {
  const DebtsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppbarWidget(title: "الديون");
  }
}
