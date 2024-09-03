import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  var isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    _checkInitialConnection();
    _monitorConnection();
  }

  void _checkInitialConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    _updateConnectionStatus(connectivityResult);
  }

  void _monitorConnection() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _updateConnectionStatus(result);
    });
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      isConnected.value = false;
      Get.snackbar(
        "No Connection",
        "You are offline",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      if (!isConnected.value) {
        Get.snackbar(
          "Connection Restored",
          "You are back online",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }
      isConnected.value = true;
    }
  }
}
