import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/app_loader.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/data/manager/product_cubit/product_cubit.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/presentation/views/widgets/product_card.dart';

class PopularTShirtSection extends StatefulWidget {
  const PopularTShirtSection({super.key});

  @override
  State<PopularTShirtSection> createState() => _PopularTShirtSectionState();
}

class _PopularTShirtSectionState extends State<PopularTShirtSection> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // See all العنوان + زر
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular T-shirt',
              style: Styles.textStyle16W500Raleway.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  showAll = !showAll;
                });
              },
              child: Text(
                showAll ? 'Hide' : 'See all',
                style: Styles.textStyle12W500Poppins,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        BlocBuilder<ProductCubit, ProductStates>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const Center(child: AppLoader());
            }
            if (state is ProductErrorState) {
              return Center(child: Text(state.message));
            }
            if (state is ProductSuccessState) {
              final products = state.products;

              if (products.isEmpty) {
                return Center(
                  child: Text(
                    "No products available at the moment.",
                    style: Styles.textStyle16W600,
                  ),
                );
              }

              //! عرض منتجين فقط في البداية
              final visibleProducts = showAll
                  ? products
                  : products.take(2).toList();

              return GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.75,
                children: List.generate(
                  visibleProducts.length,
                  (index) => ProductCard(product: visibleProducts[index]),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
