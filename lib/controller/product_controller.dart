import 'dart:developer';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/product_model.dart';

class ProductController extends GetxController {
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController productNameController = TextEditingController();
  final RxList<Product> products = <Product>[].obs;
  final RxString image = ''.obs;
  Uint8List? selectedImage;

  Future<void> pickImage() async {
    FilePickerResult? filePickerResult = await FilePicker.platform.pickFiles();
    if (filePickerResult != null) {
      image.value = filePickerResult.files.first.name;
      selectedImage = filePickerResult.files.first.bytes;
    }
  }

  void addProduct() {
    if (productNameController.text.isNotEmpty && selectedImage != null) {
      products.add(Product(
          owner: ownerNameController.text,
          productName: productNameController.text,
          image: image.value,
          selectedImage: selectedImage!));
      productNameController.clear();
      image.value = '';
    }
  }

  Future<void> submitToFirebase() async {
    for (Product product in products) {
      try {
        Reference reference = FirebaseStorage.instanceFor(
                bucket: 'puneet-digitea-task.appspot.com')
            .ref('product/')
            .child('${product.owner}_${product.productName}');
        final metadata = SettableMetadata(contentType: 'image/jpeg');
        UploadTask uploadTask =
            reference.putData(product.selectedImage!, metadata);
        await uploadTask.whenComplete(() => null);
        final downloadUrl = await reference.getDownloadURL();
        await FirebaseFirestore.instance.collection('products').add({
          'owner': product.owner,
          'product': product.productName,
          'image': downloadUrl,
        });
      } catch (e) {
        log(e.toString());
      }
    }
    Get.showSnackbar(
      GetSnackBar(
        message: '${products.length} product added',
        duration: const Duration(seconds: 3),
      ),
    );
    products.clear();
    ownerNameController.clear();
  }

  Future<void> fetchProducts() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('products').get();
    products.assignAll(snapshot.docs.map((doc) => Product.fromMap(doc.data())));
  }
}
