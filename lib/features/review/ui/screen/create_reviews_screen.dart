import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/features/review/ui/widgets/review_text_field.dart';
import 'package:flutter/material.dart';

class CreateReviewsScreen extends StatefulWidget {
  const CreateReviewsScreen({super.key});

  static final String name = "/create-review";
  @override
  State<CreateReviewsScreen> createState() => _CreateReviewsScreenState();
}

class _CreateReviewsScreenState extends State<CreateReviewsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          "Create Review",
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(color: Colors.grey.shade800),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 24, left: 16, right: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                reviewsTextField(context,"First Name", 1),
                const SizedBox(height: 16),
                reviewsTextField(context,"Last Name", 1),
                const SizedBox(height: 16),
                reviewsTextField(context,"Write Review", 10),
                const SizedBox(height: 24),
                ElevatedButton(onPressed: _submitButton, child: Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _submitButton(){
    if(_formKey.currentState!.validate()){
      print("ok");
    }
  }


}
