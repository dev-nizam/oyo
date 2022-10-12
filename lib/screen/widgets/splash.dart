import 'package:flutter/material.dart';
import 'package:oyo/screen/userScreen/login.dart';
import 'package:oyo/screen/widgets/introslider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  checkPreferanc() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('isOpened')) {
      Future.delayed(Duration(seconds: 3), () {
        if (prefs.getBool('isOpened')!) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => Login()),
              (route) => false);
        } else {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => IntroSliderDemo()),
              (route) => false);
        }
      });


    }
    else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => IntroSliderDemo()), (route) => false);
    }
  }

  @override
  void initState() {
    checkPreferanc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: Image(image: AssetImage("assets/splash/415YQYZsR2L.png"),fit: BoxFit.fill)),
    );
  }
}
