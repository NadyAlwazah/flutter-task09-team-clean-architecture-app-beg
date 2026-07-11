import 'package:flutter_task09_team_clean_architecture_app_beg/domin/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  final String description;
  final String category;
  int quantity;

  ProductModel({
    required int id,
    required String title,
    required super.price,
    required this.description,
    required this.category,
    required super.image,
    this.quantity = 1,
  }) : super(
         id: id.toString(),
         title: "Programmer T-shirt",
         availableColors: id % 2 == 0
             ? ["0xFF1976D2", "0xFF90CAF9"]
             : ["0xFFFF5252", "0xFF0D47A1"],
         isBestSeller: true,
       );

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'] ?? 0,
      title: data['title'] ?? "",
      price: (data['price'] as num?)?.toDouble() ?? 0.0,
      description: data['description'] ?? "",
      category: data['category'] ?? "",
      image: data['image'] ?? "",
      quantity: data['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': int.tryParse(id) ?? 0,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'quantity': quantity,
    };
  }
}
