import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puneet_task/controller/product_controller.dart';

class DisplayProductList extends StatelessWidget {
  DisplayProductList({super.key});

  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: productController.products.length,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Column(
                  children: [
                    Image.memory(
                      productController.products[index].selectedImage!,
                      width: 150,
                      height: 160,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(productController.products[index].productName),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    productController.products.removeAt(index);
                  },
                  icon: const Icon(Icons.delete_outline_outlined),
                  color: Colors.black,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
