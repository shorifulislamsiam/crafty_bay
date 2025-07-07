class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String city;
  final String avatarUrl;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.city,
    required this.avatarUrl,
  });

  factory UserModel.toJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData["_id"] ?? "",
      firstName: jsonData["first_Name"] ?? "",
      lastName: jsonData["last_Name"] ?? "",
      email: jsonData["email"] ?? "",
      phone: jsonData["phone"] ?? "",
      city: jsonData["city"] ?? "",
      avatarUrl: jsonData["avatarUrl"] ?? "",
    );
  }
  Map<String, dynamic> toJson(){
    return {};
  }
}
