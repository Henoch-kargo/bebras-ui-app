import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:bebras_app_ui/screens/app_layout.dart';
import 'package:bebras_app_ui/widgets/appbar_actions_button.dart';
import 'package:bebras_app_ui/widgets/blank_page.dart';
import 'package:bebras_app_ui/widgets/bottom_navbar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class ButtonData {
  final String buttonText;
  final String imagePath;

  ButtonData(this.buttonText, this.imagePath);
}

class _QuizState extends State<Quiz> {
  static const index = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Hi, Thomas!',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(child: BlankPage()),
      bottomNavigationBar: const BotNavBar(
        currentIndex: index,
      ),
    );
  }
}
