import 'package:flutter/material.dart';

class ProductsCategoryScreen extends StatefulWidget {
  const ProductsCategoryScreen({super.key});

  @override
  State<ProductsCategoryScreen> createState() => _ProductsCategoryScreenState();
}

class _ProductsCategoryScreenState extends State<ProductsCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 10,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 3),
          itemBuilder: (context,index){
          return Card(
            child: Icon(Icons.desktop_mac),
          );
          },
      ),
    );
  }
}
