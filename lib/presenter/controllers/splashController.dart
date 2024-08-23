import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../view/screen/bottomNavigationBarScreen.dart';
import '../../view/screen/connectScreen.dart';
import '../../view/screen/homeScreen.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    await Future.delayed(Duration(seconds: 2)); // Optional delay for splash screen effect

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isApproved = prefs.getBool('approved') ?? false;

    if (isApproved) {
      Get.off(() => NavigationScreen());
    } else {
      Get.off(() => ConnecteScreen());
    }
  }
}
