import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/views/screens/taikhoan/dangky.dart';
import 'package:my_app/views/screens/taikhoan/dangnhap.dart';

import 'controllers/taikhoan_controller.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value){
    Get.put(TaiKhoanController());
  
 } );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor,
      ),
      home: DangNhap(),
    );
  }
}

