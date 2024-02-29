import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puneet_task/view/widgets/add_product_button.dart';
import 'package:puneet_task/controller/product_controller.dart';
import 'package:puneet_task/view/widgets/company_name.dart';
import 'package:puneet_task/view/widgets/product_name.dart';
import 'package:puneet_task/view/widgets/select_image_container.dart';

import '../widgets/display_product_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Product Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CompanyNameTextField(
                companyName: productController.ownerNameController,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ProductNameTextField(
                    productName: productController.productNameController,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  AddProductButton(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SelectImageContainer(),
                      const SizedBox(
                        width: 20,
                      ),
                      DisplayProductList(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  productController.submitToFirebase();
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 30),
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
