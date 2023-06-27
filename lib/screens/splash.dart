import 'package:bebras_app_ui/screens/main/login_register.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<String> carouselImages = [
    'coverBebras.jpg',
    'bebrasPandai.jpg',
    'bannerBebras.jpg',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 250,
                viewportFraction: 1.1,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 6),
                autoPlayAnimationDuration: Duration(milliseconds: 500),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: carouselImages.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage('images/$image'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 50.0, bottom: 40.0),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage('images/bebrasIndonesia.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    'Selamat Datang di Aplikasi Pintar!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 32.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Yuk berlatih dan belajar bersama Bebras!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: carouselImages.map((image) {
                  int index = carouselImages.indexOf(image);
                  return Container(
                    width: _currentIndex == index ? 28.0 : 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: _currentIndex == index ? BoxShape.rectangle : BoxShape.circle,
                      color: _currentIndex == index ? Colors.black : Colors.grey,
                      borderRadius: _currentIndex == index ? BorderRadius.all(Radius.circular(50)) : null,
                    ),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform action when the "Skip" button is pressed
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginRegisterScreen()),
                );
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0.0),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              child: Text(
                'Skip',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 24.0,
                ),
              ),
            ),
            SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
