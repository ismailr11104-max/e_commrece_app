import 'package:e_commrece_app/core/widget/build_app_bar.dart';
import 'package:e_commrece_app/features/best_selling/presentation/widget/best_selling_body.dart';
import 'package:flutter/material.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الأكثر مبيعًا'),
      body: BestSellingBody(),
    );
  }
}
