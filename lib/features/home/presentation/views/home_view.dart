import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HomeAppBar(),
        Expanded(child: HomeViewBody()),
      ],
    );
  }
}
