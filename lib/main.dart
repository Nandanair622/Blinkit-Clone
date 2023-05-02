import 'package:blinkit/Home_page.dart';
import 'package:blinkit/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


//firebase
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: const FirebaseOptions( apiKey: "AIzaSyAfwRXiZRYXKyGI1vJD0f3o-YjL4meB6fc", appId: "1:270790104828:web:1da6b11a4729a7d79729", messagingSenderId: "9046966294", projectId: "blinkit-1e698", ), );
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blinkit | Everything delivered in minutes',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
       //home: const HomePage(),
    );
  }
}
