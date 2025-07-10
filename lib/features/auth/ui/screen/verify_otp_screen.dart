import 'package:crafty_bay/core/ui/widget/center_circular_progress_indicator.dart';
import 'package:crafty_bay/core/ui/widget/show_snack_bar_message.dart';
import 'package:crafty_bay/features/auth/data/model/verify_otp_model.dart';
import 'package:crafty_bay/features/auth/ui/controllers/verify_otp_controller.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:crafty_bay/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});

  final String email;
  static final String name = "/verify-otp";
  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                Text("Verify OTP", style: _textTheme.headlineLarge),
                Text(
                  "Please enter your 4 digit OTP sent to your ${widget.email}",
                  textAlign: TextAlign.center,
                  style: _textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 16),
                Form(
                  key: _formKey,
                  child: PinCodeTextField(
                    controller: _otpController,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    animationDuration: Duration(milliseconds: 300),
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldWidth: 50,
                      fieldHeight: 50,
                    ),
                    appContext: context,
                    validator: (String? value) {
                      if (value == null || value.length < 4) {
                        return 'Enter your OTP';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                GetBuilder<VerifyOTPController>(
                  builder: (controller) {
                    return Visibility(
                        visible: controller.inProgress == false,
                        replacement: centerCircularProgressIndicator(),
                        child: ElevatedButton(onPressed: _verifyButton, child: Text("verify")));
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _verifyButton() async {
    if (_formKey.currentState!.validate()) {
      final VerifyOTPModel otpModel = VerifyOTPModel(
        email: widget.email,
        otpCode: _otpController.text,
      );
      final bool isSuccess = await Get.find<VerifyOTPController>().otpVerify(
        otpModel,
      );
      if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainBottomNavScreen.name,
          (predicate) => false,
        );
      } else {
        showSnackBarMessage(
          context,
          Get.find<VerifyOTPController>().errorMessage!,
          true,
        );
      }
    }
  }
  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
