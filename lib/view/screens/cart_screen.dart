import 'package:admin_pannal/logic/services/firestore.dart';
import 'package:admin_pannal/logic/services/get_cart_model.dart';
import 'package:admin_pannal/view/screens/cart_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Screen"),
      ),
      body: StreamBuilder(
        stream: getAdminProductFromFireStore('modelToAddAdmin'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something Went Wrong'),
            );
          }
          List<AddToAllCartToAdmin> product =
              snapshot.data!.docs.map((e) => e.data()).toList();

          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemCount: product.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) => CartDetailsScreen(
                        listOFPro: product[index].listAddToCart!,
                      ),
                    ),
                  );
                },
                child: Container(
                  color: Colors.green,
                  child: Column(
                    children: [
                      Text(product[index].name!),
                      Text(product[index].address!),
                      Text(product[index].phoneNumber!),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
