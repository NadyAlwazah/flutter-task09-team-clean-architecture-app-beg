import 'package:bloc/bloc.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/services/api/api_services.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/services/api/app_link.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/home/data/models/product_model.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());

  Future<void> getProducts() async {
    emit(ProductLoadingState());

    try {
      final data = await ApiServices.getData(AppLink.productsApi);

      //! ProductModel الى Map تحويل ال
      final List<ProductModel> products = (data as List)
          .map((item) => ProductModel.fromMap(item))
          .toList();

      emit(ProductSuccessState(products));
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }

  Future<void> getProductById(int id) async {
    emit(ProductLoadingState());
    try {
      final data = await ApiServices.getData('${AppLink.productsApi}/$id');
      final product = ProductModel.fromMap(data);
      emit(ProductByIdSuccessState(product));
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }
}
