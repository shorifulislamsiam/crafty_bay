class VerifyOTPModel{
  final String email;
  final String otpCode;

  VerifyOTPModel({required this.email, required this.otpCode});
  Map<String,dynamic> toJson(){
    return {
      "email": email,
      "otp": otpCode,
    };
  }
}