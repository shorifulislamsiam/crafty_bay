import 'package:get/get.dart';

class SignUpRequestModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final String city;

  SignUpRequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.city,
  });

  factory SignUpRequestModel.fromJson(Map<String,dynamic>jsonData){
    return SignUpRequestModel(
        firstName: jsonData["first_name"],
        lastName: jsonData["last_name"],
        email: jsonData["email"],
        password: jsonData["password"],
        phone: jsonData["phone"],
        city: jsonData["city"]
    );
  }
  Map<String,dynamic> toJson(){
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": phone,
      "city": city,
    };
  }
}
