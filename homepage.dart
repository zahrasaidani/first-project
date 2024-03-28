// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Users = FirebaseAuth.instance.currentUser;
    return Scaffold(
        appBar: AppBar(
          title: Text('HomePage'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Text(
                '${Users?.email}',
                style: TextStyle(fontSize: 40),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text(
                  'LogOut',
                ),
              ),
            ],
          ),
        ));
  }
}
