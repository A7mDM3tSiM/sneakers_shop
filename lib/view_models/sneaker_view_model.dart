import 'dart:developer';

import 'package:get/get.dart';
import '../models/sneaker.dart';
import '../services/sneaker_service.dart';

class SneakerController extends GetxController {
  SneakerController(this._service);

  final SneakerService _service;
  var sneakers = <Sneaker>[].obs;
  var cartSneakers = <Sneaker>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSneakers();
  }

  Future<void> fetchSneakers() async {
    try {
      isLoading(true);
      sneakers.value = await _service.fetchSneakers();
    } catch (e) {
      log(e.toString());
      if (!Get.testMode) {
        Get.snackbar(
          'Error',
          'An error occurred while fetching sneakers.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } finally {
      isLoading(false);
    }
  }

  void addToCart(Sneaker sneaker) => cartSneakers.add(sneaker);
  void removeFromCart(Sneaker sneaker) => cartSneakers.remove(sneaker);

  void navigateToDetails(Sneaker sneaker) {
    Get.toNamed('/details', arguments: sneaker);
  }
}
