import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:oyo/controll/bloc/SearchBloc/search_bloc.dart';
import 'package:oyo/controll/model/SearchModel.dart';
import 'package:oyo/screen/homeScreen/HomeScreen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchModel searchModel;
  TextEditingController TextCheckingController = TextEditingController();
  TextEditingController checkout2controller = TextEditingController();
  TextEditingController checkout1controller = TextEditingController();

  void initState() {
    super.initState();
  }

  String kannuga = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 50),
            child: TextField(
              onChanged: (value) {
                BlocProvider.of<SearchBloc>(context).add(getSearch(value));
              },
              controller: TextCheckingController,
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
          BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            if (state is SearchLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is SearchError) {
              return Center(
                child: Text("something went wrong "),
              );
            }
            if (state is SearchLoaded) {
              searchModel = BlocProvider.of<SearchBloc>(context).searchModel;
              return Container(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .85,
                      child: ListView.separated(
                          itemBuilder: (ctx, index) {
                            return Container(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          searchModel.suggestions![index].group
                                              .toString(),
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              if (kannuga.isNotEmpty) {
                                                setState(() {
                                                  kannuga = "";
                                                });
                                              } else {
                                                setState(() {
                                                  kannuga = index.toString();
                                                });
                                              }
                                            },
                                            icon: Icon(
                                              Icons
                                                  .arrow_drop_down_circle_outlined,
                                              size: 30,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: kannuga == index.toString(),
                                    child: ListView.separated(
                                      itemBuilder: (ctx, ind) {
                                        return GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (ctx) {
                                                  GlobalKey<FormState> formKey =
                                                      GlobalKey();
                                                  return AlertDialog(
                                                    content: Form(
                                                      key: formKey,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              DatePicker.showDatePicker(
                                                                  context,
                                                                  showTitleActions:
                                                                      true,
                                                                  minTime:
                                                                      DateTime(
                                                                          2018,
                                                                          3,
                                                                          5),
                                                                  maxTime:
                                                                      DateTime(
                                                                          2025,
                                                                          6,
                                                                          7),
                                                                  onConfirm:
                                                                      (date) {
                                                                setState(() {
                                                                  checkout1controller
                                                                          .text =
                                                                      date
                                                                          .toString()
                                                                          .split(
                                                                              ' ')
                                                                          .first;
                                                                });
                                                              },
                                                                  currentTime:
                                                                      DateTime
                                                                          .now(),
                                                                  locale:
                                                                      LocaleType
                                                                          .en);
                                                            },
                                                            child:
                                                                TextFormField(
                                                              validator: (val) {
                                                                if (val!
                                                                    .isEmpty) {
                                                                  return "Empty";
                                                                }
                                                                return null;
                                                              },
                                                              controller:
                                                                  checkout1controller,
                                                              enabled: false,
                                                              decoration:
                                                                  InputDecoration(
                                                                errorStyle: TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                                errorBorder: OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red)),
                                                                focusColor:
                                                                    Colors
                                                                        .black,
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(20))),
                                                                labelText:
                                                                    'Check in',
                                                                hintStyle:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                              ),
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              DatePicker.showDatePicker(
                                                                  context,
                                                                  showTitleActions:
                                                                      true,
                                                                  minTime:
                                                                      DateTime
                                                                          .now(),
                                                                  maxTime:
                                                                      DateTime(
                                                                          2025,
                                                                          6,
                                                                          7),
                                                                  onConfirm:
                                                                      (date) {
                                                                setState(() {
                                                                  checkout2controller
                                                                          .text =
                                                                      date
                                                                          .toString()
                                                                          .split(
                                                                              ' ')
                                                                          .first;
                                                                });
                                                              },
                                                                  currentTime:
                                                                      DateTime
                                                                          .now(),
                                                                  locale:
                                                                      LocaleType
                                                                          .en);
                                                            },
                                                            child:
                                                                TextFormField(
                                                              validator: (val) {
                                                                if (val!
                                                                    .isEmpty) {
                                                                  return "Empty";
                                                                }
                                                                return null;
                                                              },
                                                              enabled: false,
                                                              controller:
                                                                  checkout2controller,
                                                              decoration:
                                                                  InputDecoration(
                                                                errorStyle: TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                                errorBorder: OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red)),
                                                                focusColor:
                                                                    Colors
                                                                        .black,
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(20))),
                                                                labelText:
                                                                    'Check Out',
                                                                hintStyle:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 18,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                              ),
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              if (formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (ctx) => HomeScreen(
                                                                          id: searchModel
                                                                              .suggestions![index]
                                                                              .entities![0]
                                                                              .destinationId
                                                                              .toString(),
                                                                          inDate: checkout1controller.text,
                                                                          outDate: checkout2controller.text,
                                                                        )));
                                                              }
                                                            },
                                                            child: const Text(
                                                                "okay"),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: ListTile(
                                              title: Text((searchModel
                                                  .suggestions![index]
                                                  .entities![ind]
                                                  .name
                                                  .toString()))),
                                        );
                                      },
                                      itemCount: searchModel
                                          .suggestions![index].entities!.length,
                                      separatorBuilder: (ctx, index) {
                                        return Divider(
                                          thickness: 4,
                                        );
                                      },
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (ctx, index) {
                            return Divider(
                              thickness: 4,
                            );
                          },
                          itemCount: searchModel.suggestions!.length),
                    )
                  ],
                ),
              );
            }
            return Container();
          }),
        ],
      ),
    );
  }
}
