class ProductDetailsModel {
  final String id;
  final String title;
  final String description;
  final List<String> photosUrl;
  final List<String> sizes;
  final List<String> colors;
  final int currentPrice;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.photosUrl,
    required this.sizes,
    required this.colors,
    required this.currentPrice,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic>jsonData){
    return ProductDetailsModel(
        id: jsonData["_id"] ?? "",
        title: jsonData["title"] ?? "",
        description: jsonData["description"] ?? "",
        photosUrl: List<String>.from(jsonData["photos"]),
        sizes: List<String>.from(jsonData["sizes"]),
        colors: List<String>.from(jsonData["colors"]),
        currentPrice: jsonData["current_price"],
    );
  }
}
