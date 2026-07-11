import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/presentation/views/widgets/categories_list_view.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/presentation/views/widgets/home_search_bar.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/presentation/views/widgets/new_arrivals_section.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/presentation/views/widgets/popular_t_shirt_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 19.0, horizontal: 20),
          sliver: SliverToBoxAdapter(child: HomeSearchBar()),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 24)),

        SliverPadding(
          padding: EdgeInsets.only(left: 21),
          sliver: SliverToBoxAdapter(child: CategoriesListView()),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 24)),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(child: PopularTShirtSection()),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 26)),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverToBoxAdapter(child: NewArrivalsSection()),
        ),
      ],
    );
  }
}
