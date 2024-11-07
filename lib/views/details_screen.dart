import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/sneaker.dart';
import '../view_models/sneaker_view_model.dart';
import 'widgets/image_carousal.dart';

class DetailsScreen extends StatelessWidget {
  final controller = Get.find<SneakerController>();
  final Sneaker sneaker = Get.arguments;

  DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          FadeInDown(child: ImageCarousel(images: sneaker.images)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sneaker.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Price: \$${sneaker.price}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(sneaker.description),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          FadeInUp(
            delay: const Duration(milliseconds: 500),
            duration: const Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 46),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  // Handle Add to Cart functionality
                  controller.addToCart(sneaker);

                  // Navigate back to home screen before showing snackbar
                  Get.back();

                  // show snackbar of succefully added to cart
                  Get.snackbar(
                    'Success',
                    '${sneaker.name} added to cart',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                    duration: const Duration(seconds: 3),
                    animationDuration: const Duration(milliseconds: 10),
                  );
                },
                child: const Text('Add to Cart'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
