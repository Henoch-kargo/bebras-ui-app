import 'package:flutter/material.dart';

class BookCollectionPage extends StatefulWidget {
  @override
  _BookCollectionPageState createState() => _BookCollectionPageState();
}

class _BookCollectionPageState extends State<BookCollectionPage> {
  String _selectedButton = 'SD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Pembahasan Soal',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchInput(),
            SizedBox(height: 16.0),
            _buildButton('SD'),
            SizedBox(height: 8.0),
            _buildButton('SMP'),
            SizedBox(height: 8.0),
            _buildButton('SMA'),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Cari materi...',
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    bool isSelected = _selectedButton == buttonText;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedButton = buttonText;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.grey,
            width: 2.0,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Text(
          buttonText,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
