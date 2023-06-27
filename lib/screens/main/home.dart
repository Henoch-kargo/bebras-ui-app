import 'dart:ui';

import 'package:bebras_app_ui/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class ButtonData {
  final String buttonText;
  final String imagePath;

  ButtonData(this.buttonText, this.imagePath);
}

class _HomeState extends State<Home> {
  String _selectedButton = 'SD';
  String test = '';
  static const index = 0;

  List<ButtonData> _sdButtonList = [
    ButtonData('Buku Bebras SD 2016', 'logoBebras1.jpg'),
    ButtonData('Buku Bebras SD 2017', 'logoBebras2.png'),
    ButtonData('Buku Bebras SD 2018', 'logoBebras3.png'),
  ];

  List<ButtonData> _smpButtonList = [
    ButtonData('Buku Bebras SMP 2016', 'logoBebras1.jpg'),
    ButtonData('Buku Bebras SMP 2017', 'logoBebras2.png'),
    ButtonData('Buku Bebras SMP 2018', 'logoBebras3.png'),
  ];

  List<ButtonData> _smaButtonList = [
    ButtonData('Buku Bebras SMA 2016', 'logoBebras1.jpg'),
    ButtonData('Buku Bebras SMA 2017', 'logoBebras2.png'),
    ButtonData('Buku Bebras SMA 2018', 'logoBebras3.png'),
  ];

  List<ButtonData> _currentButtonList = [];

  @override
  void initState() {
    super.initState();
    _currentButtonList = _sdButtonList;
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
            onPressed: () async {
              getImageFileFromAssets();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    test,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildSearchInput(),
              SizedBox(height: 16.0),
              Row(
                children: [
                  _buildButton('SD'),
                  SizedBox(width: 8.0),
                  _buildButton('SMP'),
                  SizedBox(width: 8.0),
                  _buildButton('SMA'),
                  SizedBox(width: 16.0),
                ],
              ),
              SizedBox(height: 32.0),
              Row(
                children: [
                  Text(
                    'Kategori',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 24.0,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              _buildButtonList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BotNavBar(
        currentIndex: index,
      ),
    );
  }

  Widget _buildSearchInput() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffEDF4FF),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: TextField(
        style: new TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Roboto",
            fontStyle: FontStyle.normal,
            fontSize: 18.0),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Cari materi...',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Color(0xffdae4ff), width: 3.0),
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
          if (buttonText == 'SD') {
            _currentButtonList = _sdButtonList;
          } else if (buttonText == 'SMP') {
            _currentButtonList = _smpButtonList;
          } else if (buttonText == 'SMA') {
            _currentButtonList = _smaButtonList;
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff5987ff) : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Color(0xff5987ff),
            width: 2.0,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Text(
          buttonText,
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Color(0xff5987ff),
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  Widget _buildButtonList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _currentButtonList.length,
      itemBuilder: (context, index) {
        String buttonText = _currentButtonList[index].buttonText;
        String imagePath = _currentButtonList[index].imagePath;
        return _buildRoundedButton(buttonText, imagePath);
      },
    );
  }

  Widget _buildRoundedButton(String buttonText, String image) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: ElevatedButton(
        onPressed: () {Navigator.pushNamed(context, '/document/view', arguments: {
        'name': buttonText
        });},
        style: ElevatedButton.styleFrom(
          fixedSize: Size(double.infinity, 100),
          elevation: 0,
          primary: Color(0xffEDF4FF),
          onPrimary: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Color(0xffdeeaf8), width: 1.0),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('images/$image'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Text(
                buttonText,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff3d3d3d),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> getImageFileFromAssets() async {
    var dir = await getApplicationDocumentsDirectory();
    setState(() {
      test = dir as String;
    });
    print(dir);
    return dir.toString();
  }
}
