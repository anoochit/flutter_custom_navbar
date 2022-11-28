import 'package:get/get.dart';

class HomeController extends GetxController {
  final navIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setNavIndex(int index) {
    navIndex.value = index;
    update();
  }
}
