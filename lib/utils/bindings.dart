import 'package:get/get.dart';
import '../view_models/sneaker_view_model.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SneakerController());
  }
}
