import 'package:flutter/material.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/utils/styles.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/data/models/product_model.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/my_cart/presentation/views/widgets/cart_checkout_section.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/my_cart/presentation/views/widgets/my_cart_item%20.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductModel> cart = [
      ProductModel(
        id: 1,
        title: "Programmer T-shirt",
        price: 584.95,
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
        description: 'sad',
        category: 'dsa',
      ),
      ProductModel(
        id: 1,
        title: "Programmer T-shirt",
        price: 584.95,
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
        description: 'sad',
        category: 'dsa',
      ),
      ProductModel(
        id: 1,
        title: "Programmer T-shirt",
        price: 584.95,
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
        description: 'sad',
        category: 'dsa',
      ),
      ProductModel(
        id: 1,
        title: "Programmer T-shirt",
        price: 584.95,
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
        description: 'sad',
        category: 'dsa',
      ),
      ProductModel(
        id: 1,
        title: "Programmer T-shirt",
        price: 584.95,
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
        description: 'sad',
        category: 'dsa',
      ),
      ProductModel(
        id: 1,
        title: "Programmer T-shirt",
        price: 584.95,
        image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
        description: 'sad',
        category: 'dsa',
      ),
    ];

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
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: MyCartItem(
                      product: cart[index],
                      quantity: 1,
                      onIncrease: () {},
                      onDecrease: () {},
                      onDelete: () {},
                    ),
                  );
                }, childCount: cart.length),
              ),
            ],
          ),
        ),

        const CartCheckoutSection(
          subtotal: 753.95,
          delivery: 60.20,
          total: 814.15,
        ),
      ],
    );
  }
}
