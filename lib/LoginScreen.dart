import 'package:blinkit/Home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  // //firebase
  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVisibility = false;
  User? user;
  String verificationID = "";
  @override
  Widget build(BuildContext context) {
    final deviceHeight=MediaQuery.of(context).size.height;
    final deviceWidth=MediaQuery.of(context).size.width;
    return Scaffold(
        body:Center(
            child:Column(
              children: [
                Image.asset('assets/images/login_page.jpg'),
                const Text(
                  "India's Last Minute App",
                  textAlign: TextAlign.center,
                  textScaleFactor: 2.0,
                ),
                const Text(
                  "Log in or Sign up",
                  textAlign: TextAlign.center,
                  textScaleFactor: 2.0,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 5.0
                  ),       ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(5),),
                        TextFormField(
                          controller: phoneController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your mobile number',
                            labelText: 'Mobile Number ',
                            prefix: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text('+91'),
                            ),
                          ),
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter valid mobile number';
                            }
                            return null;
                          },      ),
                        Visibility(
                          visible: otpVisibility,
                          child: TextField(
                            controller: otpController,
                            decoration: const InputDecoration(
                              hintText: 'OTP',
                              prefix: Padding(
                                padding: EdgeInsets.all(4),
                                child: Text(''),
                              ),
                            ),
                            maxLength: 6,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              textStyle: const TextStyle(fontSize: 20),
                              minimumSize: const Size.fromHeight(20),
                              padding: const EdgeInsets.all(15),
                              // side: const BorderSide(width:3, color:Colors.brown),
                              shape: RoundedRectangleBorder( //to set border radius to button
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                                otpVisibility ? "Verify" : "Login",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Welcome to Blinkit')),
                                );
                              }
                              if (otpVisibility) {
                                verifyOTP();
                              } else {
                                loginWithPhone();
                              }
                              },

                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Text(
                  "OR",
                  textAlign: TextAlign.center,
                  textScaleFactor: 2.0,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 5.0
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      textStyle: const TextStyle(fontSize: 20),
                      minimumSize: const Size.fromHeight(20),
                      padding: const EdgeInsets.all(15),
                      // side: const BorderSide(width:3, color:Colors.brown),
                      shape: RoundedRectangleBorder( //to set border radius to button
                          borderRadius: BorderRadius.circular(5)
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: const Text("Login with zomato"),
                  ),
                ),
                const Text(
                  "Access your saved addresses from Zomato automatically!",
                  textAlign: TextAlign.center,
                  textScaleFactor: 2.0,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 5.0
                  ),
                ),
              ],
            )
        )
    );
  }
  void loginWithPhone() async {
    auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          if (kDebugMode) {
            print("You are logged in successfully");
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        if (kDebugMode) {
          print(e.message);
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);

    await auth.signInWithCredential(credential).then(
          (value) {
        setState(() {
          user = FirebaseAuth.instance.currentUser;
        });
      },
    ).whenComplete(
          () {
        if (user != null) {
          Fluttertoast.showToast(
            msg: "You are logged in successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        } else {
          Fluttertoast.showToast(
            msg: "your login is failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
    );
  }
}



