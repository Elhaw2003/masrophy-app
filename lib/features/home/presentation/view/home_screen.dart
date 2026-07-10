import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masrophy_app/core/extension/widget_extension.dart';
import 'package:masrophy_app/core/services/google_service.dart';
import 'package:masrophy_app/core/theme/size/app_spacing.dart';
import 'package:masrophy_app/core/widgets/custom_scaffold_app.dart';
import 'package:masrophy_app/features/home/presentation/view/widgets/home_header_widget.dart';
import 'package:masrophy_app/features/home/presentation/view/widgets/overview_section_widget.dart';
import 'package:masrophy_app/features/home/presentation/view/widgets/quick_tools_widget.dart';
import 'package:masrophy_app/features/home/presentation/view/widgets/summary_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = GoogleAuthService().currentUser;
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return const Center(child: Text('No user logged in'));
    }
    return CustomScaffoldApp(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeAppBar(user: _user!).allPadding(AppSpacing.sm),
            AppSpacing.lg.verticalSpace,
            SummeryCard().allPadding(AppSpacing.sm),
            AppSpacing.lg.verticalSpace,
            QuickTools(),
            AppSpacing.lg.verticalSpace,
            OverviewSection(),
          ],
        ),
      ),
    );
  }
}
