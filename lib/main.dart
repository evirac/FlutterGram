import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttergram/helper.dart';
import 'package:fluttergram/pages/login.dart';
import 'package:fluttergram/pages/signup.dart';
import 'package:fluttergram/responsive/mobilelayout.dart';
import 'package:fluttergram/responsive/responsive.dart';
import 'package:fluttergram/responsive/weblayout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyCoNCscMcD_2w7dQ-dJPVeaGJ8_SYaTQR4',
      appId: '1:801925109081:web:38b5e746d640555800a848',
      messagingSenderId: '801925109081',
      projectId: 'fluttergram-2b03d',
      storageBucket: 'fluttergram-2b03d.appspot.com',
    ));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgcolor,
      ),
      //home: const ResponsiveLayout(mobileScreenLayout: MobileLayout(), webScreenLayout: WebLayout(),),
      home: SignUpPage(),
    );
  }
}
