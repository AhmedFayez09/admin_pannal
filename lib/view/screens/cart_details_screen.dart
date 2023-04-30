import 'package:admin_pannal/logic/services/product_model.dart';
import 'package:flutter/material.dart';

class CartDetailsScreen extends StatelessWidget {
  CartDetailsScreen({super.key, required this.listOFPro});
  List<ProductModel> listOFPro;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: listOFPro.length,
      itemBuilder: (context, index) {
        return Text(listOFPro[index].name);
      },
    ));
  }
}
