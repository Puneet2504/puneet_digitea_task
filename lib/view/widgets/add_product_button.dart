import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puneet_task/controller/product_controller.dart';

class AddProductButton extends StatelessWidget {
  AddProductButton({super.key});

  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        productController.addProduct();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
      ),
      child: const Text(
        'Add',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
