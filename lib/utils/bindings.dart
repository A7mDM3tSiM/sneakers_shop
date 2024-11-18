import 'package:get/get.dart';
import 'package:sneakers/services/sneaker_service.dart';
import '../view_models/sneaker_view_model.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SneakerController(SneakerService()));
  }
}
