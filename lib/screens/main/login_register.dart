import 'package:bebras_app_ui/widgets/toggle_button_login_register.dart';
import 'package:flutter/material.dart';

class LoginRegisterScreen extends StatefulWidget {
  @override
  _LoginRegisterScreenState createState() => _LoginRegisterScreenState();
}

class _LoginRegisterScreenState extends State<LoginRegisterScreen> {
  bool _isLoginMode = false; // Determines if login mode is active or not
  bool _obscurePassword = true;
  bool _obscureRepeatPassword = true;
  int _selectedButtonIndex = 1;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 32.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtonLoginRegister(
                        onPressed: () {
                          setState(() {
                            _isLoginMode = true;
                            _selectedButtonIndex = 0;
                          });
                        },
                        isSelected: _selectedButtonIndex == 0,
                        text: 'Login'),
                    ToggleButtonLoginRegister(
                        onPressed: () {
                          setState(() {
                            _isLoginMode = false;
                            _selectedButtonIndex = 1;
                          });
                        },
                        isSelected: _selectedButtonIndex == 1,
                        text: 'Register'),
                  ],
                ),
                SizedBox(height: 32.0),
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _isLoginMode ? 'Login' : 'Buat Akun Bebras',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        _isLoginMode
                            ? 'Masuk ke akun anda'
                            : 'Buat akun mudah, hanya dengan mengisi form berikut',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffEDF4FF),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Color(0xffdae4ff),
                            width: 2.0,
                          ),
                        ),
                        child: TextField(
                          controller: _usernameController,
                          style: TextStyle(fontFamily: 'Roboto'),
                          decoration: InputDecoration(
                            labelText: 'Username',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xffEDF4FF),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: Color(0xffdae4ff),
                            width: 2.0,
                          ),
                        ),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          style: TextStyle(fontFamily: 'Roboto'),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 8.0,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(_obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      (!_isLoginMode)
                          ? Container(
                              decoration: BoxDecoration(
                                color: Color(0xffEDF4FF),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Color(0xffdae4ff),
                                  width: 2.0,
                                ),
                              ),
                              child: TextField(
                                controller: _repeatPasswordController,
                                obscureText: _obscureRepeatPassword,
                                style: TextStyle(fontFamily: 'Roboto'),
                                decoration: InputDecoration(
                                  labelText: 'Repeat Password',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 8.0,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(_obscureRepeatPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        _obscureRepeatPassword =
                                            !_obscureRepeatPassword;
                                      });
                                    },
                                  ),
                                ),
                              ))
                          : SizedBox(),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: 280.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Color(0xff0d53ff),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Handle login or register based on active mode
                      if (_isLoginMode) {
                        _performLogin();
                      } else {
                        _performRegistration();
                      }
                    },
                    child: Text(
                      _isLoginMode ? 'Login' : 'Buat Akun',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 26.0,
                ),
                Text(
                  'Atau Masuk Dengan',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 26.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(280, 50)),
                    elevation: MaterialStateProperty.all<double>(0.0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        side: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.network(
                          'http://pngimg.com/uploads/google/google_PNG19635.png',
                          fit: BoxFit.cover,
                          height: 40,
                          width: 40,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Masuk dengan Google',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all<double>(0.0),
                    fixedSize: MaterialStateProperty.all(Size(280, 50)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        side: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_circle, color: Colors.black),
                      SizedBox(width: 8.0),
                      Text(
                        'Masuk sebagai anonim',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _performLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    Navigator.pushNamed(context, '/home');

    // Implement your login logic here
    print('Performing login for $username with password $password');
  }

  void _performRegistration() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    String repeatPassword = _repeatPasswordController.text;

    if (password != repeatPassword) {
      // Passwords do not match, show an error message or perform validation logic
      print('Passwords do not match');
      return;
    }

    // Implement your registration logic here
    // print
  }
}
