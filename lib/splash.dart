import 'package:flutter/material.dart';
import 'package:test/homescreen.dart';
import 'package:test/loginpage.dart';
import 'homescreen.dart';
import 'package:google_fonts/google_fonts.dart';

Color brown = Color(0xFFD2B48C);
Color darkbrown = Color(0xFF8B4513);

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyLogin()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brown,
      body: Center(
        child: Text(
          'Moodscope',
          style: GoogleFonts.dancingScript(
            textStyle: TextStyle(
              fontSize: 40.0,
              color: darkbrown,
            ),
          ),
        ),
      ),
      // body: Container(
      //   width: double.infinity,
      //   height: double.infinity,
      //   child: Expanded(
      //     child: Image.asset(
      //       'assets/images/splashscreen.jpg',
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      // ),
    );
  }
}
