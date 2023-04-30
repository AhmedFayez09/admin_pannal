import 'package:admin_pannal/logic/services/get_cart_model.dart';
import 'package:admin_pannal/logic/services/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference<ProductModel> getDataFromFirebase(String nameCollection) {
  return FirebaseFirestore.instance
      .collection(nameCollection)
      .withConverter<ProductModel>(
    fromFirestore: (docSnapshot, _) {
      return ProductModel.fromJson(docSnapshot.data()!);
    },
    toFirestore: (clientM, _) {
      return clientM.toJson();
    },
  );
}

Future addProductToFireStore(ProductModel product, String nameCollection) {
  CollectionReference<ProductModel> collection =
      getDataFromFirebase(nameCollection);
  DocumentReference<ProductModel> doc = collection.doc();
  product.id = doc.id;
  return doc.set(product);
}


CollectionReference<AddToAllCartToAdmin> getAdminCartDataFromFirebase(
    String nameCollection) {
  return FirebaseFirestore.instance
      .collection(nameCollection)
      .withConverter<AddToAllCartToAdmin>(
    fromFirestore: (docSnapshot, _) {
      return AddToAllCartToAdmin.fromJson(docSnapshot.data()!);
    },
    toFirestore: (clientM, _) {
      return clientM.toJson();
    },
  );
}


Stream<QuerySnapshot<AddToAllCartToAdmin>> getAdminProductFromFireStore(
    String nameCollection) {
  var collection = getAdminCartDataFromFirebase(nameCollection);
  return collection.snapshots();
}









































































// Future addClintToFireStore(ProductModel client, String nameCollection) {
//   var collection = getDataFromFirebase(nameCollection);
//   var doc = collection.doc();
//   client.id = doc.id;
//   return doc.set(client);
// }

// Future<QuerySnapshot<ProductModel>> getClientFromFireStore(DateTime time) async {
//   var collection = await getDataFromFirebase();
//   return collection
//       .where(
//         'startTime',
//         isEqualTo: DateUtils.dateOnly(time).microsecondsSinceEpoch,
//       )
//       .get();
// }

// Stream<QuerySnapshot<ProductModel>> getClientFromFireStoreUsingStream(
//     DateTime time) {
//   var collection = getDataFromFirebase();
//   return collection
//       .where(
//         'startTime',
//         isEqualTo: DateUtils.dateOnly(time).microsecondsSinceEpoch,
//       )
//       .snapshots();
// }

// Future<void> deleteFromFirebase(ProductModel client, String nameCollection) {
//   var collection = getDataFromFirebase(nameCollection);
//   return collection.doc(client.id).delete();
// }

// Future<void> editDataFromFirebase(ProductModel client) {
//   var collection = getDataFromFirebase();
//   return collection.doc(client.id).update({
//     'id': client.id,
//     'name': client.name,
//     'section': client.section,
//     'note': client.note,
//     'price': client.price
//   });
// }