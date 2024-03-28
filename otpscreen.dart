// ignore_for_file: use_build_context_synchronously, unused_local_variable
import 'dart:developer'; // Ajout de cette ligne pour importer la fonction log
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstproject/main.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId; // Ajout de 'final' pour assurer l'immutabilité
  final String phoneNumber; // Added phoneNumber parameter
  final String fullName; // Added fullName parameter

  OTPScreen(
      {Key? key,
      required this.verificationId,
      required this.phoneNumber,
      required this.fullName})
      : super(key: key); // Correction de la syntaxe du constructeur

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Screen"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: otpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "Enter the OTP",
                  suffixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: otpController.text.toString());
                  final UserCredential userCredential = await FirebaseAuth
                      .instance
                      .signInWithCredential(credential);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage(
                                title: "my home page",
                                phoneNumber: widget.phoneNumber,
                                fullName: widget.fullName,
                              )));
                } catch (ex) {
                  log(ex.toString());
                }
              },
              child: Text("OTP"))
        ],
      ),
    );
  }
}




