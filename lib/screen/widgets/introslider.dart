import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:oyo/screen/userScreen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroSliderDemo extends StatefulWidget {
  const IntroSliderDemo({Key? key}) : super(key: key);

  @override
  State<IntroSliderDemo> createState() => _IntroSliderDemorState();
}

class _IntroSliderDemorState extends State<IntroSliderDemo> {
  List<Slide> slides = [];
  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      onDonePress: ()async{
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('done', "introslider");
        print("AIRJIE");
        Navigator.push(context,MaterialPageRoute(builder: (ctx)=>Login()));
      },
      slides: slides,
      colorActiveDot: Colors.white,
    );
  }

  @override
  void initState() {
    super.initState();
    slides.add(
      Slide(
        title: "Management",
        description:
        'Management is the administration of an organization, whether it is a business,'
            ' a non-profit organization, or a government body. ',
        pathImage: "assets/introSlider/sfas.jpg",
        heightImage: 370,
        widthImage: 400,
        backgroundColor: const Color(0xff4266AC),
      ),
    );
    slides.add(
      Slide(
        title: "Chat",
        description:
        "Chat refers to the process of communicating, interacting and/or exchanging messages over the Internet. "
            "It involves two or more individuals that communicate through a chat-enabled service or software. ",
        pathImage: "assets/introSlider/sfas.jpg",
        heightImage: 370,
        widthImage: 400,
        backgroundColor: const Color(0xff3852B2),
      ),
    );
    slides.add(
      Slide(
        title: "Leadership",
        description:
        "Leadership is the ability of an individual or a group of individuals to influence and guide followers or other members of an organization.  ",
        pathImage: "assets/introSlider/sfas.jpg",
        heightImage: 370,
        widthImage: 400,
        backgroundColor: const Color(0xff2A78E6),
      ),
    );
  }
}
