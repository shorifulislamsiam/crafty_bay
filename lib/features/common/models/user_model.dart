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

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData["_id"] ?? "",
      firstName: jsonData["first_name"] ?? "",
      lastName: jsonData["last_name"] ?? "",
      email: jsonData["email"] ?? "",
      phone: jsonData["phone"] ?? "",
      city: jsonData["city"] ?? "",
      avatarUrl: jsonData["avatarUrl"] ?? "",
    );
  }
  Map<String, dynamic> toJson(){
    return {
      "_id": id,
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone": phone,
      "city": city,
      "avatarUrl": avatarUrl,
    };
  }
}
