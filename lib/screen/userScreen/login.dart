import 'package:flutter/material.dart';
import 'package:oyo/screen/homeScreen/HomeScreen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          " OYO",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 150,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 17,
                      backgroundImage: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "English",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_drop_down_outlined,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 280,
            ),
            Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Hello! Amazing deals are just a \n Sign_up away.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 5),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(left: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        prefixIcon: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 5,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ))),
                            width: 90,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundImage: NetworkImage(
                                      "https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"),
                                ),
                                Text("+91"),
                                Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        hintText: "Enter Mobile Number"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 50,
                      width: 350,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Continue"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          )))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text("OR"),
                Expanded(
                  child: Divider(
                    thickness: 1,
                  ),
                ),
              ],
            ),
            SizedBox(
                height: 50,
                width: 350,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.whatsapp,
                              color: Colors.green,
                              size: 40,
                            ),
                            Text(
                              "Continue with Whatsapp",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ))),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 50,
                width: 350,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.g_mobiledata,
                              color: Colors.red,
                              size: 40,
                            ),
                            Text(
                              "Continue with Google",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ))),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => HomeScreen()));
                },
                child: Text(
                  "I'II Signup later",
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}
