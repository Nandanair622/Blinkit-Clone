import 'package:blinkit/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          titleTextStyle: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.yellow.shade700,
    ),
    body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    const CircleAvatar(
    radius: 75,
    backgroundImage: AssetImage('assets/images/accountPic.png'),
    ),
    const SizedBox(height: 16),
    const Text(
    "My Account",
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    const SizedBox(height: 32),
    ElevatedButton(
    onPressed: () {
    // TODO: Implement Your Orders functionality
    },
    style: ElevatedButton.styleFrom(
    primary: Colors.white,
    onPrimary: Colors.black,
    padding: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    ),
    side: const BorderSide(color: Colors.black, width: 1),
    elevation: 0,
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
    Icon(Icons.shopping_bag),
    Text('Your Orders'),
    SizedBox(width: 32),
    ],
    ),
    ),
    const SizedBox(height: 16),
    ElevatedButton(
    onPressed: () async {
    const url = 'https://blinkit.com/aboutus';
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    throw 'Could not launch $url';
    }
    },
    style: ElevatedButton.styleFrom(
    primary: Colors.white,
    onPrimary: Colors.black,
    padding: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    ),
    side: const BorderSide(color: Colors.black, width: 1),
    elevation: 0,
    minimumSize: const Size(double.infinity, 0),
    alignment: Alignment.centerLeft,
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
    Icon(Icons.info),
    Text('About Us'),
    SizedBox(width: 32),
    ],
    ),
    ),
    const SizedBox(height: 16),
    ElevatedButton(
    onPressed: () async {
    const url =
    'https://play.google.com/store/apps/details?id=com.grofers.customerapp&hl=en_IN&gl=US';
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    throw 'Could not launch $url';
    }
    },
    style: ElevatedButton.styleFrom(
    primary: Colors.white,
    onPrimary: Colors.black,
    padding: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    ),
    side: const BorderSide(color: Colors.black, width: 1),
    elevation: 0,
    minimumSize: const Size(double.infinity, 0),
    alignment: Alignment.centerLeft,
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
    Icon(Icons.star),
    Text('Rate Us'),
    SizedBox(width: 32),
    ],
    ),
    ),
    const SizedBox(height: 32),

      const SizedBox(width: 32),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.red, // Set background color to red
        ),
        child: const Text('Log out'),
      ),

    ],
    ),
    ),
    );

  }}