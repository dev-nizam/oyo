import 'package:flutter/material.dart';
import 'package:oyo/screen/userScreen/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
void initState() {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Login()), (route) => false);

    });super.initState();
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
