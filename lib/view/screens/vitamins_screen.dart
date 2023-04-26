import 'package:admin_pannal/view/widgets/main_text_form.dart';
import 'package:flutter/material.dart';

class VitaminsScreen extends StatelessWidget {
  const VitaminsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text("Vitamins"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Text(
                  'Add New Vitamins',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontSize: 25),
                ),
                MainTextFormField(imgUrl: "Image Url"),
                MainTextFormField(imgUrl: "Name"),
                MainTextFormField(imgUrl: "Price"),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
