import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_app/views/home_page.dart';
import 'package:flutter_course_app/views/login_page.dart';
import 'package:flutter_course_app/views/registration_screen.dart';
import 'package:flutter_course_app/views/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Course',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => Login(),
        '/home': (context) => HomePage(),
        '/registration': (context) => RegistrationScreen(),
      },
    );
  }
}
