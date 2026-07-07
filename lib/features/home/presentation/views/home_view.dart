// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_task09_team_clean_architecture_app_beg/features/favourite/presentation/views/favourite_view.dart';
// import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/data/manager/product_cubit/product_cubit.dart';
// import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
// import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/presentation/views/widgets/home_app_bar.dart';
// import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/presentation/views/widgets/home_view_body.dart';
// import 'package:flutter_task09_team_clean_architecture_app_beg/features/my_cart/presentation/views/my_cart_view.dart';
// import 'package:flutter_task09_team_clean_architecture_app_beg/features/notifications/presentation/views/notifications_view.dart';
// import 'package:flutter_task09_team_clean_architecture_app_beg/features/profile/presentation/views/profile_view.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const HomeAppBar(),
//       body: BlocProvider(
//         create: (context) => ProductCubit()..getProducts(),
//         child: const HomeViewBody(),
//       ),

//       bottomNavigationBar: CustomBottomNavBar(
//         currentIndex: currentIndex,
//         onTap: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//       ),
//     );
//   }

//   Widget _getPage(int index) {
//     switch (index) {
//       case 0:
//         return const HomeView();
//       case 1:
//         return const FavouriteView();
//       case 2:
//         return const MyCartView();
//       case 3:
//         return const NotificationsView();
//       case 4:
//         return const ProfileView();
//       default:
//         return const HomeView();
//     }
//   }
// }

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
