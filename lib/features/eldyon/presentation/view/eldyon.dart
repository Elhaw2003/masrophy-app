import 'package:flutter/material.dart';
import 'package:masrophy_app/core/extension/widget_extension.dart';
import 'package:masrophy_app/core/widgets/custom_scaffold_app.dart';
import 'package:masrophy_app/features/eldyon/presentation/view/widgets/debts_header.dart';

class Eldyon extends StatelessWidget {
  const Eldyon({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: CustomScaffoldApp(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DebtsHeader(),
              const DebtsSummaryCard(),
              const DebtsTabBar(),
              DebtList(debts: debts),
            ],
          ),
        ).horizontalPadding(16),
      ),
    );
  }
}

class DebtsTabBar extends StatelessWidget {
  const DebtsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: [
        Tab(text: "كل الديون"),
        Tab(text: "متبقي"),
        Tab(text: "مسددة"),
      ],
    );
  }
}

class DebtList extends StatelessWidget {
  final List<Map<String, dynamic>> debts;

  const DebtList({super.key, required this.debts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: debts.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, index) {
        return DebtItem(debt: debts[index]);
      },
    );
  }
}

class DebtProgress extends StatelessWidget {
  final double progress;
  final Color color;

  const DebtProgress({super.key, required this.progress, required this.color});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      color: color,
      backgroundColor: Colors.grey.shade200,
    );
  }
}

class DebtItem extends StatelessWidget {
  const DebtItem({super.key, required this.debt});

  final Map<String, dynamic> debt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          /// Top
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Amount
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "EGP ${debt["amount"]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    debt["status"],
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),

              const Spacer(),

              /// Title
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    debt["title"],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    debt["bank"],
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 18),

          /// Progress
          DebtProgress(progress: debt["progress"], color: debt["color"]),

          const SizedBox(height: 8),

          /// Footer
          Row(
            children: [
              Text(
                "${debt["paid"]}/${debt["total"]} EGP",
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              ),

              const Spacer(),

              Text(
                "${(debt["progress"] * 100).round()}%",
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> debts = [
  {
    "title": "قرض شخصي",
    "bank": "الأهلي",
    "amount": 3000,
    "paid": 600,
    "total": 1000,
    "remaining": 2400,
    "progress": 0.60,
    "status": "متبقي",
    "color": const Color(0xffFF6B81),
  },
  {
    "title": "بطاقة ائتمان",
    "bank": "البنك الدولي",
    "amount": 1250,
    "paid": 200,
    "total": 1200,
    "remaining": 1050,
    "progress": 0.37,
    "status": "متبقي",
    "color": const Color(0xff5B5FEF),
  },
  {
    "title": "دين لصديق",
    "bank": "محمد محمد",
    "amount": 950,
    "paid": 950,
    "total": 1000,
    "remaining": 50,
    "progress": 0.95,
    "status": "متبقي",
    "color": const Color(0xff00B67A),
  },
];

class DebtsSummaryCard extends StatelessWidget {
  const DebtsSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xffF83D5B),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: const [
          Expanded(flex: 2, child: SummaryProgress()),
          SizedBox(width: 20),
          Expanded(flex: 3, child: SummaryAmount()),
        ],
      ),
    );
  }
}

class SummaryProgress extends StatelessWidget {
  const SummaryProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "45",
                    style: TextStyle(
                      color: Color(0xffF83D5B),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "%",
                    style: TextStyle(
                      color: Color(0xffF83D5B),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        Text("تم السداد", style: TextStyle(color: Colors.white)),
      ],
    );
  }
}

class SummaryAmount extends StatelessWidget {
  const SummaryAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text("إجمالي الديون", style: TextStyle(color: Colors.white70)),
        const SizedBox(height: 6),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "EGP ",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              TextSpan(
                text: "5,200",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const SummaryStatus(),
      ],
    );
  }
}

class SummaryStatus extends StatelessWidget {
  const SummaryStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.12),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          "متبقي",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
