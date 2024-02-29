import 'package:flutter/material.dart';

class CompanyNameTextField extends StatelessWidget {
  final TextEditingController companyName;
  const CompanyNameTextField({super.key, required this.companyName});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: companyName,
      decoration: const InputDecoration(
          hintText: 'Your Name',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
