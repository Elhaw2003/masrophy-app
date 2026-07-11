import 'package:flutter/material.dart';
import 'package:masrophy_app/core/theme/app_colors.dart';
import 'package:masrophy_app/features/home/presentation/view/home_screen.dart';
import 'package:masrophy_app/features/reports/presentation/view/reports_screen.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  int _currentIndex = 0;
  List<Widget> tabs = [
    HomeScreen(),
    ReportsScreen(),
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.black),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: tabs),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        elevation: 4,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        elevation: 10,
        child: SizedBox(
          height: 70,
          child: Row(
            children: [
              /// Left
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _NavItem(
                      index: 0,
                      currentIndex: _currentIndex,
                      icon: Icons.home_outlined,
                      activeIcon: Icons.home,
                      label: "الرئيسية",
                      onTap: _changeTab,
                    ),
                    _NavItem(
                      index: 1,
                      currentIndex: _currentIndex,
                      icon: Icons.bar_chart_outlined,
                      activeIcon: Icons.bar_chart,
                      label: "التقارير",
                      onTap: _changeTab,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 50),

              /// Right
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _NavItem(
                      index: 2,
                      currentIndex: _currentIndex,
                      icon: Icons.swap_horiz,
                      activeIcon: Icons.swap_horiz,
                      label: "المعاملات",
                      onTap: _changeTab,
                    ),
                    _NavItem(
                      index: 3,
                      currentIndex: _currentIndex,
                      icon: Icons.more_horiz,
                      activeIcon: Icons.more_horiz,
                      label: "المزيد",
                      onTap: _changeTab,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.index,
    required this.currentIndex,
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.onTap,
  });

  final int index;
  final int currentIndex;
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final selected = index == currentIndex;

    return InkWell(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            selected ? activeIcon : icon,
            color: selected ? AppColors.primary : AppColors.grey400,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: selected ? AppColors.primary : AppColors.grey400,
              fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
