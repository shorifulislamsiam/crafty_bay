class CategoryListModel {
  final String id;
  final String title;
  final String iconUrl;
  final String description;

  CategoryListModel({
    required this.id,
    required this.title,
    required this.iconUrl,
    required this.description,
  });

  factory CategoryListModel.fromJson(Map<String,dynamic>jsonData){
    return CategoryListModel(
        id: jsonData["_id"],
        title: jsonData["title"],
        iconUrl: jsonData["icon"],
        description: jsonData["description"],
    );
  }
}
