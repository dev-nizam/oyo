import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:oyo/controll/bloc/SearchBloc/search_bloc.dart';
import 'package:oyo/controll/bloc/hotelBloc/hotel_bloc.dart';
import 'package:oyo/controll/model/HotelModel.dart';
import 'package:oyo/controll/model/SearchModel.dart';
import 'package:oyo/screen/homeScreen/hotelView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    BlocProvider.of<SearchBloc>(context).add(getSearch(""));
    BlocProvider.of<HotelBloc>(context).add(GetHotel());
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
    return BlocBuilder<HotelBloc, HotelState>(
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
        if (state is HotelLoaded) {}
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
                  child: TextField(
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
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (TextCheckingController
                                  .value.text.isNotEmpty) {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      GlobalKey<FormState> formKey =
                                          GlobalKey();
                                      return AlertDialog(
                                        content: Form(
                                          key: formKey,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  DatePicker.showDatePicker(
                                                      context,
                                                      showTitleActions: true,
                                                      minTime:
                                                          DateTime(2018, 3, 5),
                                                      maxTime:
                                                          DateTime(2025, 6, 7),
                                                      onConfirm: (date) {
                                                    setState(() {
                                                      checkout1controller.text =
                                                          date
                                                              .toString()
                                                              .split(' ')
                                                              .first;
                                                    });
                                                  },
                                                      currentTime:
                                                          DateTime.now(),
                                                      locale: LocaleType.en);
                                                },
                                                child: TextFormField(
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Empty";
                                                    }
                                                    return null;
                                                  },
                                                  controller:
                                                      checkout1controller,
                                                  enabled: false,
                                                  decoration: InputDecoration(
                                                    errorStyle: TextStyle(
                                                        color: Colors.red),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .red)),
                                                    focusColor: Colors.black,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                    labelText: 'Check in',
                                                    hintStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                  ),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  DatePicker.showDatePicker(
                                                      context,
                                                      showTitleActions: true,
                                                      minTime: DateTime.now(),
                                                      maxTime:
                                                          DateTime(2025, 6, 7),
                                                      onConfirm: (date) {
                                                    setState(() {
                                                      checkout2controller.text =
                                                          date
                                                              .toString()
                                                              .split(' ')
                                                              .first;
                                                    });
                                                  },
                                                      currentTime:
                                                          DateTime.now(),
                                                      locale: LocaleType.en);
                                                },
                                                child: TextFormField(
                                                  validator: (val) {
                                                    if (val!.isEmpty) {
                                                      return "Empty";
                                                    }
                                                    return null;
                                                  },
                                                  enabled: false,
                                                  controller:
                                                      checkout2controller,
                                                  decoration: InputDecoration(
                                                    errorStyle: TextStyle(
                                                        color: Colors.red),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .red)),
                                                    focusColor: Colors.black,
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                    labelText: 'Check Out',
                                                    hintStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ),
                                                  ),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    Navigator.pop(context);
                                                    //           id: widget
                                                    //               .searchModel
                                                    //               .suggestions![index]
                                                    //               .entities![0]
                                                    //               .destinationId
                                                    //               .toString(),
                                                    //           inDate: checkout1controller.text,
                                                    //           outDate: checkout2controller.text,
                                                    //         )));
                                                  }
                                                },
                                                child: const Text("okay"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }
                            },
                            icon: Icon(Icons.arrow_forward),
                          ),
                          hintText: "Search for city,location or hotel",
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
                                                "https://www.thepaulbangalore.in/images/rooms-and-suites/executive/Bedroom_Hotel_The_Paul_Bangalore_xgggto.jpg",
                                              ))),
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
      },
    );
  }
}
