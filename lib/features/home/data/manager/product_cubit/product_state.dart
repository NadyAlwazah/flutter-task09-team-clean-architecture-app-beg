part of 'product_cubit.dart';

@immutable
sealed class ProductStates {}

final class ProductInitialState extends ProductStates {}

final class ProductLoadingState extends ProductStates {}

final class ProductSuccessState extends ProductStates {
  final List<ProductModel> products;
  ProductSuccessState(this.products);
}

final class ProductErrorState extends ProductStates {
  final String message;
  ProductErrorState(this.message);
}

final class ProductByIdSuccessState extends ProductStates {
  final ProductModel product;
  ProductByIdSuccessState(this.product);
}
