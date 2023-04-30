import 'package:admin_pannal/view/screens/cart_screen.dart';
import 'package:admin_pannal/view/screens/cosmetic_screen.dart';
import 'package:admin_pannal/view/screens/home_Health_core_screen.dart';
import 'package:admin_pannal/view/screens/medical_tools_screen.dart';
import 'package:admin_pannal/view/screens/medicine_screen.dart';
import 'package:admin_pannal/view/screens/moms_screen.dart';
import 'package:admin_pannal/view/screens/vitamins_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text("HomeScreen"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CartScreen(),
                ),
              );
            },
            icon: Icon(Icons.card_travel),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Hi Admins",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                cardCategroy("medicine", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineScreen(),
                    ),
                  );
                }),
                const SizedBox(width: 10),
                cardCategroy("cosmetic", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CosmeticScreen(),
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                cardCategroy("Moms", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MomsScreen(),
                    ),
                  );
                }),
                const SizedBox(width: 10),
                cardCategroy("Home Health core", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeHealthCoreScreen(),
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                cardCategroy("Medical Tools", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MedicalToolsScreen(),
                    ),
                  );
                }),
                const SizedBox(width: 10),
                cardCategroy("Vitamins", () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VitaminsScreen(),
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cardCategroy(String category, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          category,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
