import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/widgets/app_loader.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/data/manager/product_cubit/product_cubit.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductStates>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(child: AppLoader());
        } else if (state is ProductByIdSuccessState) {
          final product = state.product;
          return Scaffold(
            appBar: AppBar(title: Text(product.title)),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Image.network(product.image),
                  const SizedBox(height: 16),
                  Text(product.description),
                  Text('\$${product.price.toStringAsFixed(2)}'),
                ],
              ),
            ),
          );
        } else if (state is ProductErrorState) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
