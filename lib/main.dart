import 'package:car_manager/screens/adm_main_screen.dart';
import 'package:car_manager/screens/login_screen.dart';
import 'package:car_manager/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'constants/auth.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: dbUrl,
    anonKey: anonKey,
  );
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
        //TODO mudar body para LoginScreen()
        body: LoginScreen(),
      ),
    );
  }
}
