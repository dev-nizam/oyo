import 'package:flutter/material.dart';

class HotelView extends StatefulWidget {
  const HotelView({Key? key}) : super(key: key);

  @override
  State<HotelView> createState() => _HotelViewState();
}

class _HotelViewState extends State<HotelView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(

          child: Column(children: [
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
      SizedBox(
          height: 20,
      ),
      Container(
          child: Column(
            children: [
              Container(
                height: 50,
                margin: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withOpacity(.2),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search for city,location or hotel",
                  ),
                ),
              ),
             Container(margin: EdgeInsets.all(5),
              child:   Row(
                   children: [
                     Icon(Icons.wrong_location_outlined,color: Colors.blue,),
                     SizedBox(width: 5,),
                     Text("Search nearby OYOs with this offer",style: TextStyle(color: Colors.blue),)
                   ],
                 )
             ),SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 180),
                child: Text("Handpicked for you",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
              ),SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(right: 300),
                child: Text(("POPULAR")),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.topCenter,
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx,index){
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage("https://cdn.britannica.com/37/189837-050-F0AF383E/New-Delhi-India-War-Memorial-arch-Sir.jpg"),
                    ),
                    title:Text("Delhi"),
                  );
                },
                    separatorBuilder: (ctx,index){
                  return SizedBox(
                    height: 0,
                  );
                    },
                    itemCount:9
                ),
              ),
            ],
          ),
      )
    ]),
        ));
  }
}
