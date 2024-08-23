import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reussite1/view/screen/phrScreen.dart';
import '../widget/card.dart';
import '../widget/colors.dart';
import 'chrScreen.dart';
import 'medScreen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 70,),
            Container(
              height: 90 ,
              width: double.infinity,
              color:o ,
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/logo.png', // Replace with your image asset
                      height: 100,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Les Spécialités Disponibles :',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildSpecialtyCard(
                            'Médecine',
                            'assets/heart.png', // Replace with your image asset
                            k,
                            120,
                                (){
                              Get.to(MedScreen());
                            }
                        ),
                        buildSpecialtyCard(
                            'ChirDent',
                            'assets/dent.png', // Replace with your image asset
                            o,
                            100,
                                (){
                              Get.to(ChrScreen());
                            }
                        ),
                      ],
                    ),
                    SizedBox(height: 20), // Adjust space between rows as needed
                    Center(
                      child: buildSpecialtyCard(
                          'Pharmacie',
                          'assets/medc.png', // Replace with your image asset
                          vr,
                          90,
                              (){
                            Get.to(PhrScreen());
                          }
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}