import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_models/sneaker_view_model.dart';
import 'widgets/sneaker_card.dart';

class HomeScreen extends StatelessWidget {
  final SneakerController controller = Get.put(SneakerController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sneaker Shop',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          Hero(
            tag: "cart",
            child: IconButton(
              icon: const Icon(Icons.shopping_bag_outlined),
              onPressed: () {
                Get.toNamed('/cart');
              },
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return FadeInDown(
          child: ListView.builder(
            itemCount: controller.sneakers.length,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            itemBuilder: (context, index) {
              final sneaker = controller.sneakers[index];
              return SneakerCard(
                sneaker: sneaker,
                onTap: () => controller.navigateToDetails(sneaker),
              );
            },
          ),
        );
      }),
    );
  }
}
