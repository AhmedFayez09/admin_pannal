import 'package:admin_pannal/view/widgets/main_text_form.dart';
import 'package:flutter/material.dart';

class MedicalToolsScreen extends StatelessWidget {
  const MedicalToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text("Medical Tools"),
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
                  'Add New Medical Tools',
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
