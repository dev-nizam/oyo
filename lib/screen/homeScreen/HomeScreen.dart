import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:oyo/controll/bloc/SearchBloc/search_bloc.dart';
import 'package:oyo/controll/bloc/hotelBloc/hotel_bloc.dart';
import 'package:oyo/controll/model/HotelModel.dart';
import 'package:oyo/controll/model/SearchModel.dart';
import 'package:oyo/screen/homeScreen/hotelView.dart';
import 'package:oyo/screen/homeScreen/search%20screen.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key, required this.id, required this.inDate, required this.outDate}) : super(key: key);
final String id;
final String inDate;
final String outDate;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    BlocProvider.of<HotelBloc>(context).add(GetHotel(widget.id,widget.inDate,widget.outDate));
    // TODO: implement initState
    super.initState();
  }

  late SearchModel searchModel;
  late HotelModel hotelModel;
  TextEditingController checkout2controller = TextEditingController();
  TextEditingController checkout1controller = TextEditingController();
  TextEditingController TextCheckingController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HotelBloc, HotelState>(
        builder: (context, state) {
          if (state is HotelLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HotelError) {
            Center(
              child: Text("something went wrong "),
            );
          }
          if (state is HotelLoaded) {
            hotelModel = BlocProvider.of<HotelBloc>(context).hotelModel;
            return Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Colors.white,
                centerTitle: true,
                title: Text(
                  "OYO",
                  style: TextStyle(
                      fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
                ),
                actions: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://media.istockphoto.com/vectors/letter-logo-formed-by-two-parallel-lines-with-noise-texture-vector-id1201523312?k=20&m=1201523312&s=612x612&w=0&h=muC5BerISf25lI9aWRDTUpWABqOADIO_OPfEX2ZkMU0="),
                    ),
                  )
                ],
              ),
              drawer: Drawer(
                backgroundColor: Colors.red,
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
                          child: GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (ctx)=>SearchScreen()));},
                            child: TextField(
                              enabled: false,
                              controller: TextCheckingController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.withOpacity(.2),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                prefixIcon: Icon(Icons.search),
                                hintText: "Search for city,location or hotel",
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                return Container(
                                  margin: EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 35,
                                        backgroundImage: NetworkImage(
                                            "https://www.tourmyindia.com/blog//wp-content/uploads/2021/12/Bangalore-Palace-Karnataka.jpg"),
                                      ),
                                      Text("Bengalore"),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (ctx, index) {
                                return SizedBox(
                                  width: 10,
                                );
                              },
                              itemCount: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 170),
                          child: Text(
                            "Handpicked for you",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 266,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    // Navigator.push(context,
                                    //     MaterialPageRoute(builder: (ctx) => Room()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 160,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                    hotelModel.data!.body!.searchResults!.results![index].optimizedThumbUrls!.srpDesktop.toString(),
                                                  ))),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.star),
                                            Text("${3.2}")
                                          ],
                                        ),
                                        Text(hotelModel.data!.body!.searchResults!.results![index].name.toString()),
                                        Text(hotelModel.data!.body!.searchResults!.results![index].address!.streetAddress.toString()),
                                        Text("Price ${hotelModel.data!.body!.searchResults!.results![index].ratePlan!.price!.exactCurrent.toString()}"),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (ctx, index) {
                                return SizedBox(
                                  width: 10,
                                );
                              },
                              itemCount: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 170),
                          child: Text(
                            "Exclusive offer for you",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 210,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                return Container(
                                  margin: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 200,
                                        width: 340,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                  "https://cdn.grabon.in/gograbon/images/merchant/1616310125326.jpg",
                                                ))),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (ctx, index) {
                                return SizedBox(
                                  width: 10,
                                );
                              },
                              itemCount: 3),
                        ),
                        Container(
                          height: 30,
                          width: 260,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all()),
                          child: Center(child: Text("View All Offers")),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 170),
                          child: Text(
                            "Be an OYO Wizard",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 200,
                          width: 340,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    "https://www.oyorooms.com/officialoyoblog/wp-content/uploads/2019/06/Bolg-Oyo-Wizard1.png",
                                  ))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 170),
                          child: Text(
                            "play & win with OYO",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 200,
                          width: 340,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    "https://www.zingoy.com/blog/wp-content/uploads/2020/02/OYO-Q-Quiz.jpg",
                                  ))),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 110),
                          child: Text(
                            "Explore curated collections",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 170,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                return Container(
                                  margin: EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 160,
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                  "https://wanderlustandlipstick.com/blogs/goneworkabout/files/2015/11/quotes-about-work-and-travel.jpg",
                                                ))),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (ctx, index) {
                                return SizedBox(
                                  width: 10,
                                );
                              },
                              itemCount: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 110),
                          child: Text(
                            "Explore curated collections",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          height: 202,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) => HotelView()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 160,
                                          width: 200,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                    "https://www.cvent.com/sites/default/files/image/2021-10/hotel%20room%20with%20beachfront%20view.jpg",
                                                  ))),
                                        ),
                                        Text("name"),
                                        Text("tags"),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (ctx, index) {
                                return SizedBox(
                                  width: 10,
                                );
                              },
                              itemCount: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }return Container(
            color: Colors.red,
          );

        },
      ),
    );
  }
}
