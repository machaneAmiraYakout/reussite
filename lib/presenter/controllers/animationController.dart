import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyAnimationController extends GetxController {
  var isAnimating = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Start the animation automatically when the controller is initialized
    Future.delayed(Duration(seconds: 1), () {
      isAnimating.value = true;
    });
  }
}