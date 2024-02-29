import 'package:flutter/material.dart';

class ProductNameTextField extends StatelessWidget {
  final TextEditingController productName;
  const ProductNameTextField({super.key, required this.productName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextField(
        controller: productName,
        decoration: const InputDecoration(
            hintText: 'Product Name',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    );
  }
}
