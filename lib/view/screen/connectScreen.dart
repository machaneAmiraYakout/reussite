import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/connectController.dart';
import '../widget/customButton.dart';

class ConnecteScreen extends StatelessWidget {
  final ConnectController _connectController = Get.put(ConnectController());

   ConnecteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Image.asset('assets/logo.png', width: 80, height: 80),
                    const SizedBox(width: 20),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Connectez-vous à',
                          style: TextStyle(fontSize: 35, color: Colors.black),
                        ),
                        Text(
                          'Réussite QCMs',
                          style: TextStyle(fontSize: 35, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Image.asset('assets/docs.png', width: 280, height: 280),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Se Connecter pour continuer',
                  style: TextStyle(fontSize: 23, color: Colors.black),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 145,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextField(
                          onChanged: (value) {
                            _connectController.name.value = value;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Nom et Prénom',
                            prefixIcon: const Icon(Icons.person, color: Colors.cyan),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.cyan,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.cyan,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.cyan,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          onChanged: (value) {
                            _connectController.phone.value = value;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Numéro du téléphone',
                            prefixIcon: const Icon(Icons.phone, color: Colors.cyan),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.cyan,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.cyan,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                color: Colors.cyan,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.topRight,
                        widthFactor: 0.4,
                        heightFactor: 0.5,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                            color: Color(0xFF11cfe4),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CustomButton(
                    text: 'Se Connecter',
                    onPressed: () {
                      _connectController.connect();
                    },
                    borderRadius: 20,
                    sideColor: const Color(0x207e8fdb),
                    primary: const Color(0xFF11cfe4),
                    onPrimary: Colors.white,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.topLeft,
                        widthFactor: 0.4,
                        heightFactor: 0.5,
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: const BoxDecoration(
                            color: Color(0xFF11cfe4),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
