import 'package:flutter/material.dart';

class Collection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButton('Bebras SD', Icons.download),
          _buildButton('Bebras SMP', Icons.download),
          _buildButton('Bebras SMA', Icons.download),
        ],
      ),
    );
  }

  Widget _buildButton(String text, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: Text(
          text,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          icon,
          size: 48.0,
        ),
      ),
    );
  }
}
