import 'package:flutter/foundation.dart';

class Product {
  late String owner;
  late String productName;
  late String image;
  late Uint8List? selectedImage;

  Product(
      {required this.owner,
      required this.productName,
      required this.image,
      this.selectedImage});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      owner: map['owner'],
      productName: map['product'],
      image: map['image'],
      selectedImage: map['selectedImage'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'owner': owner,
      'product': productName,
      'image': image,
      'selectedImage': selectedImage
    };
  }
}
