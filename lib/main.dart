import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegistrationPage(),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isNameValid = true;
  bool isPhoneNumberValid = true;
  bool isEmailValid = true;
//Validation Logics Here-->

  void validateFields() {
    setState(() {
      isNameValid = nameController.text.isNotEmpty;
      isPhoneNumberValid =
          RegExp(r'^\d{10}$').hasMatch(phoneNumberController.text);
      isEmailValid = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
          .hasMatch(emailController.text);
    });
  }

//title logic-->
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Registration Page'),
        titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 114, 255, 255),
          fontSize: 30,
        ),
        backgroundColor: Color.fromARGB(197, 0, 0, 0),
      ),

//Background Colour Logic-->
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 0, 106, 64)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

//Enter your name logic--->

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                decoration: InputDecoration(
                  labelText: 'Eter your Name',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 61, 232, 255))),
                  errorText: isNameValid ? null : 'Please enter a valid name',
                ),
              ),

//Phone Number logic Here--->

              SizedBox(height: 16),
              TextField(
                controller: phoneNumberController,
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Enter Your Phone Number',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 61, 232, 255))),
                  errorText: isPhoneNumberValid
                      ? null
                      : 'Please enter a valid phone number',
                ),
              ),
//Email adress logic here--->

              SizedBox(height: 16),
              TextField(
                controller: emailController,
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Enter Your Email Address',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 61, 232, 255))),
                  errorText: isEmailValid
                      ? null
                      : 'Please enter a valid email address',
                ),
              ),
//Both The Buttons starting here--->

              SizedBox(height: 24),
              ElevatedButton(
                onPressed: validateFields,
                child: Text('Create New Account'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 48, 47, 44),
                ),
              ),

              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 48, 47, 44)),
                icon: Icon(Icons.language_outlined),
                label: Text('Sign in with Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
