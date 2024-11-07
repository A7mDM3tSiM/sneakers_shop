import 'package:get/get.dart';
import '../models/sneaker.dart';
import '../services/sneaker_service.dart';

class SneakerController extends GetxController {
  final SneakerService _service = SneakerService();
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
