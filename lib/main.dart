import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reussite1/presenter/controllers/connectController.dart';
import 'package:reussite1/presenter/controllers/moduleController.dart';
import 'package:reussite1/presenter/controllers/selectionContoller.dart';
import 'package:reussite1/presenter/controllers/semestreController.dart';
import 'package:reussite1/presenter/controllers/yearController.dart';
import 'package:reussite1/view/screen/splashScreen.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
// Initialize the YearsController globally
  Get.put(YearsController());
  //initialize the seme controller
  Get.put(SemestreController());
  Get.put(ModuleController());
  Get.put(SelectionController());
  Get.put(ConnectController());

  runApp( GetMaterialApp(
    title: 'ELearning',
    debugShowCheckedModeBanner: false,
    home:  SplashScreen(),
  ));
}