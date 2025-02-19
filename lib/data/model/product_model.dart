class ProductModel {
  final int? id;
  final String? title;
  final int? price;
  final String? description;
  final List<dynamic>? images;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.images});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        images: json['images']);
  }
}
