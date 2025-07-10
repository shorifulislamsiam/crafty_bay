import 'package:crafty_bay/core/ui/widget/center_circular_progress_indicator.dart';
import 'package:crafty_bay/core/ui/widget/show_snack_bar_message.dart';
import 'package:crafty_bay/features/auth/data/model/sign_up_request_model.dart';
import 'package:crafty_bay/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:crafty_bay/features/auth/ui/screen/verify_otp_screen.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static final String name = "/signup";
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _shippingAddressController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpController _signUpController = Get.find<SignUpController>();
  bool _isObsecure = false;
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 100),
                appLogo(height: 90, width: 90),
                const SizedBox(height: 16),
                Text("Completed Profile", style: _textTheme.headlineLarge),
                Text(
                  "Get started with us with your details",
                  style: _textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _firstNameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(labelText: "First Name"),
                        validator: (String? value) {
                          if (value?.trim().isEmpty == true) {
                            return "Enter the first name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _lastNameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(labelText: "Last Name"),
                        validator: (String? value) {
                          if (value?.trim().isEmpty == true) {
                            return "Enter the last Name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: "Enter Your Email",
                        ),
                        validator: (String? value) {
                          String email = value?.trim() ?? "";
                          if (EmailValidator.validate(email) == false) {
                            return "Enter the valid email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _mobileController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(labelText: "Mobile"),
                        validator: (String? value) {
                          RegExp regEx = RegExp(
                            r"^(?:\+88|88)?(01[3-9]\d{8})$",
                          );
                          if ((regEx.hasMatch(value!.trim()))) {
                            return null;
                          } else {
                            return "Enter a valid mobile number";
                          }
                        },
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _cityController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(labelText: "City"),
                        validator: (String? value) {
                          if (value?.trim().isEmpty == true) {
                            return "Enter the city";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 5),
                      // TextFormField(
                      //   controller: _shippingAddressController,
                      //   textInputAction: TextInputAction.done,
                      //   keyboardType: TextInputType.streetAddress,
                      //   maxLines: 4,
                      //   decoration: InputDecoration(
                      //     labelText: "Shipping Address",
                      //     //contentPadding: EdgeInsets.only(left: 16,top: 10),
                      //     alignLabelWithHint: true,
                      //   ),
                      //   validator: (String? value) {
                      //     if (value?.trim().isEmpty == true) {
                      //       return "Enter the shipping Address";
                      //     } else {
                      //       return null;
                      //     }
                      //   },
                      // ),
                      // const SizedBox(height: 5),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Enter Your Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              _isObsecure = !_isObsecure;
                              setState(() {});
                            },
                            icon:
                                _isObsecure
                                    ? Icon(Icons.remove_red_eye)
                                    : Icon(Icons.remove_red_eye_outlined),
                          ),
                        ),
                        validator: (value) {
                          if ((value?.isNotEmpty == false) ||
                              (value!.length <= 6)) {
                            return "Enter the password";
                          } else {
                            return null;
                          }
                        },

                        obscureText: _isObsecure,
                      ),
                    ],
                  ),
                ),
                GetBuilder<SignUpController>(
                  //init: _signUpController,
                  builder: (_) {
                    return Visibility(
                      visible: _signUpController.inProgress == false,
                      replacement: centerCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: _completeButton,
                        child: Text("Complete"),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _completeButton() async {
    if (_formKey.currentState!.validate()) {
      final SignUpRequestModel model = SignUpRequestModel(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        phone: _mobileController.text.trim(),
        city: _cityController.text.trim(),
      );
      final bool isSuccess = await _signUpController.signUp(model);
      if (isSuccess) {
        showSnackBarMessage(context, _signUpController.message);
        Navigator.pushNamed(
          context,
          VerifyOtpScreen.name,
          arguments: _emailController.text.trim(),
        );
      } else {
        showSnackBarMessage(context, _signUpController.errorMessage!, true);
      }
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _cityController.dispose();
    _shippingAddressController.dispose();
    super.dispose();
  }
}
