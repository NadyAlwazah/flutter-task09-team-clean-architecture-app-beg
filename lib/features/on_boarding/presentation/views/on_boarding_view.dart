import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/app/routes.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/on_boarding/presentation/views/widgets/onboard_page_content.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/assets.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';
import '../managers/on_boarding_cubit.dart';
import '../managers/on_boarding_state.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> onboardingData = [
    {
      "title": "WELLCOME TO\nBYTE BOUTIQUE",
      "subtitle": "",
      "button": "Get Started",
      "waveLine": AssetsData.iconWaveLineSvg,
      "topHighlight": AssetsData.iconHighlightTopSvg,
      "smileAsset": AssetsData.iconSmile1Svg,
      "decorAssetLeft": AssetsData.iconHighlightOnboard1Svg,
      "decorAssetRight": AssetsData.iconHighlightOnboard1Svg,
    },
    {
      "title": "Let's Start Journey",
      "subtitle": "Smart, Gorgeous & Fashionable\nCollection Explore Now",
      "button": "Next",
      "waveLine": null,
      "topHighlight": null,
      "smileAsset": AssetsData.iconSmile2Svg,
      "decorAssetLeft": AssetsData.iconHighlightOnboard2Svg,
      "decorAssetRight": null,
    },
    {
      "title": "You Have The\nPower To",
      "subtitle":
          "There Are Many Beautiful And Attractive\nItems To Your Choice",
      "button": "Next",
      "waveLine": null,
      "topHighlight": null,
      "smileAsset": AssetsData.iconSmile3Svg,
      "decorAssetLeft": null,
      "decorAssetRight": null,
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<OnBoardingCubit>(context);

          return Scaffold(
            backgroundColor: AppColors.onboardBackgroundColor,
            body: SafeArea(
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) => cubit.changePage(index),
                    itemCount: onboardingData.length,
                    itemBuilder: (context, index) {
                      return OnboardPageContent(
                        item: onboardingData[index],
                        index: index,
                      );
                    },
                  ),

                  Positioned(
                    bottom: 235.h,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(onboardingData.length, (index) {
                        final bool isActive = cubit.currentIndex == index;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          width: isActive ? 42.w : 24.w,
                          height: 5.5.h,
                          decoration: BoxDecoration(
                            color: isActive
                                ? Colors.white
                                : const Color(0xFF34C759),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        );
                      }),
                    ),
                  ),

                  Positioned(
                    bottom: 25.h,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.06,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: size.height * 0.065,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF8F9FA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () {
                            if (cubit.currentIndex <
                                onboardingData.length - 1) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            } else {
                              context.go(AppRouter.kSignin);
                            }
                          },
                          child: Text(
                            onboardingData[cubit.currentIndex]["button"]!,
                            style: Styles.textStyle16W600Raleway.copyWith(
                              color: AppColors.buttonTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
