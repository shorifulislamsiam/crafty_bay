class HomeSliderModel {
  final String id;
  final String photo_url;
  final String description;
  final String brand;

  HomeSliderModel({
    required this.id,
    required this.photo_url,
    required this.description,
    required this.brand,
  });

  factory HomeSliderModel.fromJson(Map<String,dynamic>jsonData){
    return HomeSliderModel(
        id: jsonData["_id"] ?? "",
        photo_url: jsonData["photo_url"],
        description: jsonData["description"],
        brand: jsonData["brand"]
    );
  }
}
