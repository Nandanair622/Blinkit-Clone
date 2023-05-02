import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

          child: Column(
            children: [
               Image.asset('assets/images/blinkit_logo.png'),
              const Text(
                "Sign Up",
                textAlign: TextAlign.center,
                textScaleFactor: 2.0,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15),),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.person),
                    hintText: 'Enter valid name',
                    labelText: 'Name ',
                  ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                if (value == null || value.isEmpty) {
                return 'Enter valid name';
                }
                return null;
                },
                ),
                const Padding(
                 padding: EdgeInsets.all(15),),
                  TextFormField(

                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),

                      icon: Icon(Icons.email),
                      hintText: 'Enter valid email id',
                      labelText: 'Email ',
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter valid email id';
                      }
                      return null;
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15),),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.phone_android),
                      hintText: 'Enter valid phone number',
                      labelText: 'Phone ',
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter valid phone number';
                      }
                      return null;
                    },
                  ),
                Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    textStyle: const TextStyle(fontSize: 20),
                    minimumSize: const Size.fromHeight(50),
                    padding: const EdgeInsets.all(20),
                    // side: const BorderSide(width:3, color:Colors.brown),
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 0,
                  ),
                onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Creating account....please wait')),
                );
                }
                },
                child: const Text('Create Account'),
                ),
                ),
                ],
                ),

                ),
    ),
    ],
    ),

    ),
    );
  }
}

