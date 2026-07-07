import 'package:flutter_task09_team_clean_architecture_app_beg/core/layout/bottom_bar_layout.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/signin_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/signup_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/details/presentation/views/details_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/favourite/presentation/views/favourite_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/presentation/views/home_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/my_cart/presentation/views/my_cart_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/notifications/presentation/views/notifications_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/profile/presentation/views/profile_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/search/presentation/views/search_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/side_menu/presentation/views/side_menu_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kOnBoarding = '/on_boarding';
  static const String kSignup = '/signup';
  static const String kHome = '/home';
  static const String kDetails = '/details';
  static const String kFavourite = '/favourite';
  static const String kMyCart = '/my_cart';
  static const String kNotifications = '/notifications';
  static const String kProfile = '/profile';
  static const String kSearch = '/search';
  static const String kSideMenu = '/side_menu';
  static const String kBottomBar = '/bottom_bar';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SigninView()),
      GoRoute(path: kSignup, builder: (context, state) => const SignupView()),
      GoRoute(
        path: kBottomBar,
        builder: (context, state) => const BottomBarLayout(),
      ),
      GoRoute(
        path: kOnBoarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(path: kHome, builder: (context, state) => const HomeView()),
      GoRoute(path: kDetails, builder: (context, state) => const DetailsView()),
      GoRoute(
        path: kFavourite,
        builder: (context, state) => const FavouriteView(),
      ),
      GoRoute(path: kMyCart, builder: (context, state) => const MyCartView()),
      GoRoute(
        path: kNotifications,
        builder: (context, state) => const NotificationsView(),
      ),
      GoRoute(path: kProfile, builder: (context, state) => const ProfileView()),
      GoRoute(path: kSearch, builder: (context, state) => const SearchView()),
      GoRoute(
        path: kSideMenu,
        builder: (context, state) => const SideMenuView(),
      ),
    ],
  );
}
