import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAnimationController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController animationController;

  late Animation<Offset> firstContainerAnimation;
  late Animation<Offset> secondContainerAnimation;
  late Animation<Offset> thirdContainerAnimation;
  late Animation<Offset> fourthContainerAnimation;

  var isAnimating = false.obs;

  @override
  void onInit() {
    super.onInit();

    // Initialize AnimationController with vsync and duration for each container's animation
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // Total duration for staggered effect
    );

    // Staggered animations for each container, starting at different intervals
    firstContainerAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.0, 0.25, curve: Curves.easeInOut), // 0-1/4 of the duration
    ));

    secondContainerAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.25, 0.5, curve: Curves.easeInOut), // 1/4 - 1/2 of the duration
    ));

    thirdContainerAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.5, 0.75, curve: Curves.easeInOut), // 1/2 - 3/4 of the duration
    ));

    fourthContainerAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0.75, 1.0, curve: Curves.easeInOut), // 3/4 - 1 of the duration
    ));

    // Start the animation after a delay
    Future.delayed(const Duration(seconds: 1), () {
      animationController.forward(); // Play the animation
      isAnimating.value = true;
    });
  }

  @override
  void onClose() {
    animationController.dispose(); // Dispose of the controller when no longer needed
    super.onClose();
  }
}
