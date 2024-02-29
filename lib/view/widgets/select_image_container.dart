import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puneet_task/controller/product_controller.dart';

class SelectImageContainer extends StatelessWidget {
  SelectImageContainer({super.key});

  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        productController.pickImage();
      },
      child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Obx(
              () => productController.image.value != ''
                  ? Image.memory(
                      productController.selectedImage!,
                      fit: BoxFit.cover,
                    )
                  : const Icon(
                      Icons.add_a_photo_outlined,
                      size: 60,
                    ),
            ),
          )),
    );
  }
}
