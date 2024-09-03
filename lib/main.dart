import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reussite1/presenter/controllers/UserDetailsController.dart';
import 'package:reussite1/presenter/controllers/connectController.dart';
import 'package:reussite1/presenter/controllers/connectivityService.dart';
import 'package:reussite1/presenter/controllers/favoriteController.dart';
import 'package:reussite1/presenter/controllers/fetchAnneController.dart';
import 'package:reussite1/presenter/controllers/moduleController.dart';
import 'package:reussite1/presenter/controllers/selectionContoller.dart';
import 'package:reussite1/presenter/controllers/semestreController.dart';
import 'package:reussite1/presenter/controllers/sessionController.dart';
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
  Get.put(FavoriteController());
  Get.put(UserDetailsController());
  Get.put(FetchAnneeController());
  Get.put(ConnectivityService());

  final sessionController = Get.put(SessionController());

  runApp( GetMaterialApp(
    title: 'ELearning',
    debugShowCheckedModeBanner: false,
    home:  SplashScreen(),
  ));
}