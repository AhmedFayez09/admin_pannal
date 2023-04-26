import 'package:admin_pannal/logic/services/firestore.dart';
import 'package:admin_pannal/logic/services/product_model.dart';
import 'package:admin_pannal/view/widgets/main_text_form.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class MedicineScreen extends StatelessWidget {
  MedicineScreen({super.key});
  TextEditingController imgUrlC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  var medicineKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text("medicine"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: medicineKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Text(
                    'Add New Medicine',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 25),
                  ),
                  MainTextFormField(
                    imgUrl: "Image Url",
                    controller: imgUrlC,
                    validator: (value) {
                      if (value == '' || value!.isEmpty) {
                        return 'invaild value';
                      }
                    },
                  ),
                  MainTextFormField(
                    validator: (value) {
                      if (value == '' || value!.isEmpty) {
                        return 'invaild value';
                      }
                    },
                    imgUrl: "Name",
                    controller: nameC,
                  ),
                  MainTextFormField(
                    validator: (value) {
                      if (value == '' || value!.isEmpty) {
                        return 'invaild value';
                      }
                    },
                    imgUrl: "Price",
                    controller: priceC,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  ProductModel product = ProductModel(

                    imageUrl: imgUrlC.text,
                    name: nameC.text,
                    price: int.parse(priceC.text),
                    totalPrice:  int.parse(priceC.text),
                  );

                  if (medicineKey.currentState!.validate()) {
                    QuickAlert.show(
                      confirmBtnText: 'Ok',
                      cancelBtnText: 'Cancel',
                      onConfirmBtnTap: () {
                        addProductToFireStore(product, 'test').then((value) {
                          imgUrlC.clear();
                          nameC.clear();
                          priceC.clear();

                          Navigator.pop(context);
                        });
                      },
                      context: context,
                      type: QuickAlertType.success,
                      text: 'Save',
                    );
                  }
                },
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
