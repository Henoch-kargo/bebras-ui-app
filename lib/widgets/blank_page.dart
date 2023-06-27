import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 30,
          height: 60.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: AssetImage('images/bebrasIndonesia.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),// Replace with your first image asset
        SizedBox(height: 20.0),
        Text(
          'Maaf, fitur ini sedang dalam perbaikan',
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 20.0),
        Container(
          width: MediaQuery.of(context).size.width - 80,
          height: 350.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: AssetImage('images/logoBebras3.png'),
              fit: BoxFit.cover,
            ),
          ),
        ), // Replace with your second image asset
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Kembali'),
        ),
      ],
    );
  }
}