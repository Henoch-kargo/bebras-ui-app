import 'dart:ui';

import 'package:flutter/material.dart';

class BotNavBar extends StatelessWidget {
  const BotNavBar({Key? key, required this.currentIndex, })
      : super(key: key);

  final int currentIndex;

  void _onTap(index, context) {
    switch (index) {
      case 0:
        Navigator.popUntil(context, ModalRoute.withName('/home'));
        break;
      case 1:
        Navigator.pushNamed(context, '/collection');
        break;
      case 2:
          Navigator.pushNamed(context, '/favorite');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = Theme.of(context);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 30.0,
          sigmaY: 30.0,
        ),
        child: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: _themeData.highlightColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: _themeData.unselectedWidgetColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Materi',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.print_rounded),
                label: 'Cetakan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Akun',
              ),
            ],
            currentIndex: currentIndex,
            onTap: (index) => _onTap(index, context),
          ),
        ),
      ),
    );
  }
}
