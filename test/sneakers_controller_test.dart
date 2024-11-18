import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sneakers/models/sneaker.dart';
import 'package:sneakers/services/sneaker_service.dart';
import 'package:sneakers/view_models/sneaker_view_model.dart';

import 'sneakers_controller_test.mocks.dart';

@GenerateMocks([SneakerService])
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late SneakerService sneakerService;
  late SneakerController sneakerController;

  final sneaker = Sneaker(
    images: ["", "", ""],
    name: "Air Max",
    description: "The Air Max is a classic sneaker from Nike.",
    brand: "Nike",
    price: "200",
    color: "Black",
    colorCode: 0xFF000000,
  );

  setUp(() {
    Get.testMode = true;
    sneakerService = MockSneakerService();
    sneakerController = SneakerController(sneakerService);
  });

  tearDownAll(() {
    Get.testMode = false;
  });

  test('fetchSneakers() should return a list of sneakers', () async {
    when(sneakerService.fetchSneakers()).thenAnswer((_) async => [sneaker]);

    await sneakerController.fetchSneakers();

    expect(sneakerController.sneakers, [sneaker]);
  });

  test('fetchSneakers() should throw an error', () async {
    when(sneakerService.fetchSneakers()).thenThrow(Exception());

    await sneakerController.fetchSneakers();

    expect(sneakerController.sneakers, []);
  });

  test('addToCart() should add a sneaker to the cart', () {
    sneakerController.addToCart(sneaker);

    expect(sneakerController.cartSneakers, [sneaker]);
  });

  test('removeFromCart() should remove a sneaker from the cart', () {
    sneakerController.addToCart(sneaker);
    sneakerController.removeFromCart(sneaker);

    expect(sneakerController.cartSneakers, []);
  });
}
