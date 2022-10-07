import 'package:flutter/material.dart';

class Room extends StatefulWidget {
  const Room({Key? key}) : super(key: key);

  @override
  State<Room> createState() => _RoomState();
}

class _RoomState extends State<Room> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      margin: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      "https://www.thepaulbangalore.in/images/rooms-and-suites/executive/Bedroom_Hotel_The_Paul_Bangalore_xgggto.jpg",
                    ))),
          ),
          Row(
            children: [Icon(Icons.star), Text("${3.2}")],
          ),
          Text("Name",style: TextStyle(fontSize: 20,),),
          Text("Bengalore",style: TextStyle(fontSize: 20,),),
          Text("Price ${500}",style: TextStyle(fontSize: 20,),),
        ],
      ),
    )));
  }
}
