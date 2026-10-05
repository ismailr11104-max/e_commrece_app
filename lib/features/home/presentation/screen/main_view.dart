import 'package:e_commrece_app/features/home/presentation/widgets/home_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static const routeHome = 'home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: HomeView()));
  }
}
