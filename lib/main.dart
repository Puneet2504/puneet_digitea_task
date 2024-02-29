import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:puneet_task/view/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyARs1Kk1wm1xBrVQyC9NT5JXfAGB32ZMjo",
    projectId: "puneet-digitea-task",
    messagingSenderId: "1034629237438",
    appId: "1:1034629237438:web:dfee227ba5090b914c2cef",
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}
