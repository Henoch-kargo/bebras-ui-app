import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:bebras_app_ui/screens/app_layout.dart';
import 'package:bebras_app_ui/widgets/appbar_actions_button.dart';
import 'package:bebras_app_ui/widgets/bottom_navbar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  Random random = new Random();

  // final Stream<QuerySnapshot> _collectionStream =
  //     FirebaseFirestore.instance.collection('Collection').snapshots();

  static const index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData _themeData = Theme.of(context);

    return AppLayout(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 30.0,
                    sigmaY: 30.0,
                  ),
                  child: AppBar(
                    toolbarHeight: 64.0,
                    automaticallyImplyLeading: false,
                    backgroundColor: _themeData.highlightColor,
                    title: Image.asset('assets/logo_color.png', width: 100),
                    actions: [
                      AppbarActionsButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 64.0,
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BotNavBar(
          currentIndex: Home.index,
        ),
      ),
    );
  }
}
