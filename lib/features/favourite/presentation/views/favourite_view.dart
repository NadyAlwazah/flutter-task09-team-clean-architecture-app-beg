import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/favourite/presentation/views/favourite_view_body.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key, required this.onBackToHome});
  final VoidCallback onBackToHome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 16,
                color: Color(0xFF1A1A1A),
              ),
              onPressed: () => onBackToHome(),
            ),
          ),
        ),
        title: Text(
          "Favourite",
          style: Styles.textStyle16W600Raleway.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                  color: Color(0xFF1A1A1A),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: const FavouriteViewBody(),
    );
  }
}
