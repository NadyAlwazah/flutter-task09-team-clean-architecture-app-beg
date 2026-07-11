import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/custom_button_nav_bar.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/favourite/presentation/views/widgets/favourite_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/data/manager/product_cubit/product_cubit.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/presentation/views/home_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/my_cart/data/manager/cart_cubit/cart_cubit.dart';
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

  late final CartCubit cartCubit = CartCubit()..loadCart();
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => ProductCubit()..getProducts()),
            BlocProvider.value(value: cartCubit),
          ],
          child: const HomeView(),
        );
      case 1:
        return const FavouriteView();
      case 2:
        return BlocProvider.value(
          value: cartCubit,
          child: MyCartView(
            onBackToHome: () {
              setState(() {
                currentIndex = 0;
              });
            },
          ),
        );
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
      drawer: currentIndex == 0 ? const Drawer() : null,
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
