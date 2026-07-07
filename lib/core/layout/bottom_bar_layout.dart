import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/favourite/presentation/views/favourite_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/data/manager/product_cubit/product_cubit.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/presentation/views/home_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/my_cart/presentation/views/my_cart_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/notifications/presentation/views/notifications_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/profile/presentation/views/profile_view.dart';

class BottomBarLayout extends StatefulWidget {
  const BottomBarLayout({super.key});

  @override
  State<BottomBarLayout> createState() => _BottomBarLayoutState();
}

class _BottomBarLayoutState extends State<BottomBarLayout> {
  int currentIndex = 0;

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return BlocProvider(
          create: (context) => ProductCubit()..getProducts(),
          child: const HomeView(),
        );
      case 1:
        return const FavouriteView();
      case 2:
        return const MyCartView();
      case 3:
        return const NotificationsView();
      case 4:
        return const ProfileView();
      default:
        return const HomeView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: currentIndex == 0 ? Drawer() : null,
      body: _getPage(currentIndex),

      bottomNavigationBar: (currentIndex == 0 || currentIndex == 1)
          ? CustomBottomNavBar(
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )
          : null,
    );
  }
}
