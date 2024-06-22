import 'package:car_manager/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'JosefinSans'),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: const LoginScreen(),
      ),
    );
  }
}
