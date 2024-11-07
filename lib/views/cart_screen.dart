import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers/views/widgets/cart_sneaker_card.dart';

import '../view_models/sneaker_view_model.dart';

class CartScreen extends StatelessWidget {
  final controller = Get.find<SneakerController>();

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.cartSneakers.isEmpty) {
          return const Center(
            child: Text(
              'No items in cart',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.cartSneakers.length,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          itemBuilder: (context, index) {
            final sneaker = controller.cartSneakers[index];
            return CartSneakerCard(
              sneaker: sneaker,
              onRemove: () {
                controller.removeFromCart(sneaker);
              },
            );
          },
        );
      }),
    );
  }
}
