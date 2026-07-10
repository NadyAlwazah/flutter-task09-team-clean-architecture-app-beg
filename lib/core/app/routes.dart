import 'package:flutter_task09_team_clean_architecture_app_beg/core/layout/bottom_bar_layout.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/signin_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/presentation/views/signup_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/presentation/views/details_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/search/presentation/views/search_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/side_menu/presentation/views/side_menu_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kOnBoarding = '/on_boarding';
  static const String kSignup = '/signup';
  static const String kDetails = '/details/:id';
  static const String kSearch = '/search';
  static const String kSideMenu = '/side_menu';
  static const String kBottomBar = '/bottom_bar';

  static late GoRouter router;

  static void initRouter({required bool isLoggedIn}) {
    router = GoRouter(
      initialLocation: isLoggedIn ? kBottomBar : '/',
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
        GoRoute(
          path: kDetails,
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            return DetailsView(id: id);
          },
        ),

        GoRoute(path: kSearch, builder: (context, state) => const SearchView()),
        GoRoute(
          path: kSideMenu,
          builder: (context, state) => const SideMenuView(),
        ),
      ],
    );
  }
}
