// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory ProductModel.fromMap(Map<String, dynamic> data) {
    return ProductModel(
      id: data['id'] ?? 0,
      title: data['title'] ?? "",
      price: (data['price'] as num).toDouble(),
      description: data['description'] ?? "",
      category: data['category'] ?? "",
      image: data['image'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
    };
  }
}
