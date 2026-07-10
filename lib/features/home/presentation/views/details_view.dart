import 'package:flutter/material.dart';
import '../../data/models/product_model.dart';
import 'widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  final ProductModel product;

  const DetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DetailsViewBody(product: product),
      ),
    );
  }
}