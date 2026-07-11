class ProductModelFavourite {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  int quantity;
  final List<String> colors;

  ProductModelFavourite({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.quantity = 1,
    this.colors = const [],
  });

  factory ProductModelFavourite.fromMap(Map<String, dynamic> data) {
    return ProductModelFavourite(
      id: data['id'] ?? 0,
      title: data['title'] ?? "",
      price: (data['price'] as num).toDouble(),
      description: data['description'] ?? "",
      category: data['category'] ?? "",
      image: data['image'] ?? "",
      quantity: data['quantity'] ?? 1,
      colors: data['colors'] != null ? List<String>.from(data['colors']) : [],
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
      'quantity': quantity,
      'colors': colors,
    };
  }
}
