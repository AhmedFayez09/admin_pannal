
import 'package:admin_pannal/logic/services/product_model.dart';


class AddToAllCartToAdmin {
  String? id;
  List<ProductModel>? listAddToCart;
  String? address;
  String? name;
  String? phoneNumber;
  AddToAllCartToAdmin(
      {this.address, this.listAddToCart, this.phoneNumber, this.id,this.name});

  AddToAllCartToAdmin.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
    id = json['id'];
    phoneNumber = json['phoneNumber'];
    if (json['listAddToCart'] != null) {
      listAddToCart = <ProductModel>[];
      json['listAddToCart'].forEach((v) {
        listAddToCart!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['phoneNumber'] = phoneNumber;
    if (listAddToCart != null) {
      data['listAddToCart'] = listAddToCart!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
