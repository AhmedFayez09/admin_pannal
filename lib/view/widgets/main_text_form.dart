import 'package:flutter/material.dart';

class MainTextFormField extends StatelessWidget {
 const  MainTextFormField({
    super.key,
    required this.imgUrl,
    this.controller,
    this.validator,
  });
  final String imgUrl;
  final TextEditingController? controller;
 final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            labelText: imgUrl,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
