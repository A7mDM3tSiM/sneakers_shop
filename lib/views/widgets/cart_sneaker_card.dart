import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../models/sneaker.dart';

class CartSneakerCard extends StatelessWidget {
  final Sneaker sneaker;
  final VoidCallback onRemove;

  const CartSneakerCard(
      {super.key, required this.sneaker, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    // Repersent the height and width of the screen
    final h = MediaQuery.sizeOf(context).height;
    final w = MediaQuery.sizeOf(context).width;

    return Container(
      padding: const EdgeInsets.only(right: 10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: h * 0.1,
            width: w * 0.22,
            decoration: BoxDecoration(
              color: Color(sneaker.colorCode),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: sneaker.images[0],
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sneaker.name),
                Text(sneaker.brand),
                Text(
                  '\$${sneaker.price}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.delete_outlined,
              size: 25,
            ),
            onPressed: onRemove,
          ),
        ],
      ),
    );
  }
}
