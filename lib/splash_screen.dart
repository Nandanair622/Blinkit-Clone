import 'dart:async';
import 'package:blinkit/LoginScreen.dart';
import 'package:blinkit/Sign_Up_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

   @override
  State<StatefulWidget> createState() =>_SplashScreenState();

  }

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5),( ) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context)=>const LoginScreen(key: null,),
      ));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFF7CB46),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/brand_logo.jpg',
                height: 500,

              ),
              const SizedBox(height: 16),
              // const Text(
              //   'A ZOMATO COMPANY ',
              //   style: TextStyle(
              //     fontSize: 34,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashBoardScreen {
}






