import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/app_loader.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/my_cart/presentation/views/widgets/cart_checkout_section.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/my_cart/presentation/views/widgets/my_cart_item .dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/my_cart/data/manager/cart_cubit/cart_cubit.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          final cart = state.items;

          double subtotal = cart.fold(
            0,
            (sum, item) => sum + (item.price * item.quantity),
          );
          double delivery = 60.20;
          double total = subtotal == 0 ? 0 : subtotal + delivery;

          return Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          "${cart.length} Item",
                          style: Styles.textStyle16W500Poppins,
                        ),
                      ),
                    ),

                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final product = cart[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: MyCartItem(
                            product: product,
                            quantity: product.quantity,
                            onIncrease: () {
                              context.read<CartCubit>().increaseQuantity(
                                product.id,
                              );
                            },
                            onDecrease: () {
                              context.read<CartCubit>().decreaseQuantity(
                                product.id,
                              );
                            },
                            onDelete: () {
                              context.read<CartCubit>().removeFromCart(
                                product.id,
                              );
                            },
                          ),
                        );
                      }, childCount: cart.length),
                    ),
                  ],
                ),
              ),

              CartCheckoutSection(
                subtotal: subtotal,
                delivery: delivery,
                total: total,
              ),
            ],
          );
        }

        return const Center(child: AppLoader());
      },
    );
  }
}
