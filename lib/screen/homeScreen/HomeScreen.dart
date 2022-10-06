import 'package:flutter/material.dart';
import 'package:oyo/screen/homeScreen/hotelView.dart';
import 'package:oyo/screen/homeScreen/room.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(onPressed: () { scaffoldKey.currentState!.openDrawer(); }, icon: Icon(Icons.menu,color: Colors.black,),),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("OYO",style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),),
        actions: [Container(margin: EdgeInsets.all(10),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage("https://media.istockphoto.com/vectors/letter-logo-formed-by-two-parallel-lines-with-noise-texture-vector-id1201523312?k=20&m=1201523312&s=612x612&w=0&h=muC5BerISf25lI9aWRDTUpWABqOADIO_OPfEX2ZkMU0="),
          ),
        )],

      ),
      drawer:Drawer(backgroundColor: Colors.red,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  height: 40,
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
                Container(

                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx,index){
                    return Container(margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage("https://www.tourmyindia.com/blog//wp-content/uploads/2021/12/Bangalore-Palace-Karnataka.jpg"),
                          ),
                          Text("Bengalore"),

                        ],
                      ),
                    );
                  },
                      separatorBuilder: (ctx,index){
                    return SizedBox(width: 10,);
                      }
                      , itemCount: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 170),
                  child: Text("Handpicked for you",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                 margin: EdgeInsets.all(5),
                  height: 266,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx,index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (ctx)=>Room()));
                          },
                          child: Container(margin: EdgeInsets.all(5),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               Container(
                            height: 160,width: 200,
                                 decoration: BoxDecoration(
                                   color: Colors.red,
                                   borderRadius: BorderRadius.circular(10),
                                   image: DecorationImage(fit: BoxFit.fill,
                                     image: NetworkImage("https://www.thepaulbangalore.in/images/rooms-and-suites/executive/Bedroom_Hotel_The_Paul_Bangalore_xgggto.jpg",)
                                   )
                                 ),
                               ),
                                Row(
                                  children: [
                                    Icon(Icons.star),
                                    Text("${3.2}")
                                  ],
                                ),
                                Text("Name"),
                                Text("Bengalore"),
                                Text("Price ${500}"),

                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (ctx,index){
                        return SizedBox(width: 10,);
                      }
                      , itemCount: 20),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 170),
                  child: Text("Handpicked for you",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  height: 210,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx,index){
                        return Container(margin: EdgeInsets.all(5),
                          child: Column(mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 200,width: 340,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(fit: BoxFit.fill,
                                        image: NetworkImage("https://d168jcr2cillca.cloudfront.net/uploadimages/sales_offer_mainpic_20110414122037SvenskaDesignHotel_Banner2.jpg",)
                                    )
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (ctx,index){
                        return SizedBox(width: 10,);
                      }
                      , itemCount: 3),
                ),
                Container(
                  height: 30,
          width: 260,
          decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
            border: Border.all()
                  ),
                  child: Center(child: Text("View All Offers")),
                ),SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right: 170),
                  child: Text("Be an OYO Wizard",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
                ),SizedBox(height: 10,),
                Container(
                  height: 200,width: 340,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(fit: BoxFit.fill,
                          image: NetworkImage("https://d168jcr2cillca.cloudfront.net/uploadimages/sales_offer_mainpic_20110414122037SvenskaDesignHotel_Banner2.jpg",)
                      )
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(right: 170),
                  child: Text("play & win with OYO",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
                ),SizedBox(height: 10,),
                Container(
                  height: 200,width: 340,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(fit: BoxFit.fill,
                          image: NetworkImage("https://d168jcr2cillca.cloudfront.net/uploadimages/sales_offer_mainpic_20110414122037SvenskaDesignHotel_Banner2.jpg",)
                      )
                  ),
                ),
                SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(right: 110),
              child: Text("Explore curated collections",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(5),
                  height:170,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx,index){
                        return Container(margin: EdgeInsets.all(5),
                          child: Column(mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 160,width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(fit: BoxFit.fill,
                                        image: NetworkImage("https://www.thepaulbangalore.in/images/rooms-and-suites/executive/Bedroom_Hotel_The_Paul_Bangalore_xgggto.jpg",)
                                    )
                                ),
                              ),

                            ],
                          ),
                        );
                      },
                      separatorBuilder: (ctx,index){
                        return SizedBox(width: 10,);
                      }
                      , itemCount: 20),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(right: 110),
                  child: Text("Explore curated collections",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.all(5),
                  height: 202,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx,index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (ctx)=>HotelView()));
                          },
                          child: Container(margin: EdgeInsets.all(5),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 160,width: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(fit: BoxFit.fill,
                                          image: NetworkImage("https://www.thepaulbangalore.in/images/rooms-and-suites/executive/Bedroom_Hotel_The_Paul_Bangalore_xgggto.jpg",)
                                      )
                                  ),
                                ),
                                Text("name"),
                                Text("tags"),

                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (ctx,index){
                        return SizedBox(width: 10,);
                      }
                      , itemCount: 20),
                ),

              ],

            ),
          ),
        ],
      ),
    );
  }
}
