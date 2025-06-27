import 'package:crafty_bay/features/auth/ui/screen/login_screen.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static final String name = "/signup";
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final  TextEditingController _firstNameController = TextEditingController();
  final  TextEditingController _lastNameController = TextEditingController();
  final  TextEditingController _mobileController = TextEditingController();
  final  TextEditingController _cityController = TextEditingController();
  final  TextEditingController _shippingAddressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                SizedBox(height: 100),
                appLogo(height: 90, width: 90),
                SizedBox(height: 16),
                Text("Completed Profile", style: _textTheme.headlineLarge),
                Text(
                  "Get started with us with your details",
                  style: _textTheme.bodySmall?.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 24),
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
                        validator: (String? value){
                          if(value?.trim().isEmpty == true){
                            return "Enter the first name";
                          }else{
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        controller: _lastNameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(labelText: "Last Name"),
                        validator: (String? value){
                          if(value?.trim().isEmpty == true){
                            return "Enter the last Name";
                          }else{
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        controller: _mobileController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(labelText: "Mobile"),
                        validator: (String? value){
                          RegExp regEx= RegExp(r"^(?:\+88|88)?(01[3-9]\d{8})$");
                          if((regEx.hasMatch(value!.trim()))){
                            return null;
                          }else{
                            return "Enter a valid mobile number";
                          }
                        },
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        controller: _cityController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(labelText: "City"),
                        validator: (String? value){
                          if(value?.trim().isEmpty == true){
                            return "Enter the city";
                          }else{
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 5,),
                      TextFormField(
                        controller: _shippingAddressController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.streetAddress,
                        maxLines: 4,
                        decoration: InputDecoration(labelText: "Shipping Address",
                        //contentPadding: EdgeInsets.only(left: 16,top: 10),
                        alignLabelWithHint: true),
                        validator: (String? value){
                          if(value?.trim().isEmpty == true){
                            return "Enter the shipping Address";
                          }else{
                            return null;
                          }
                        },
                      ),

                    ],
                  ),
                ),
                ElevatedButton(onPressed: (){}, child: Text("Complete"))
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _completeButton(){
    if(_formKey.currentState!.validate()){
      Navigator.pushNamed(context, LoginScreen.name);
    }
  }
}
