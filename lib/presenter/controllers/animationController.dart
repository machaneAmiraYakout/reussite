import 'package:get/get.dart';

class MyAnimationController extends GetxController {
  var isAnimating = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Start the animation automatically when the controller is initialized
    Future.delayed(const Duration(seconds: 1), () {
      isAnimating.value = true;
    });
  }
}