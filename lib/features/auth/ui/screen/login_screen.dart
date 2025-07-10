import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/auth/ui/screen/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static final String name = "/login";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObsecure = false;
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 120),
                appLogo(height: 90, width: 90),
                SizedBox(height: 24),
                Text("Welcome Back", style: _textTheme.headlineLarge),
                Text(
                  "Please Enter Your Email Address",
                  style: _textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 16),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                      SizedBox(height: 8),
                      TextFormField(
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Enter Your Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              _isObsecure = !_isObsecure;
                              setState(() {

                              });
                            },
                            icon: _isObsecure ? Icon(Icons.remove_red_eye): Icon(Icons.remove_red_eye_outlined),
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

                      //SizedBox(height: 16),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(onPressed: _nextSubmitButton, child: Text("Next")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _nextSubmitButton() {
    if(_formKey.currentState!.validate()){
      Navigator.pushNamed(context, SignUpScreen.name);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
