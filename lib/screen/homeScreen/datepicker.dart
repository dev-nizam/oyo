// import 'package:flutter/material.dart';
//
//
// class PopDatepicker extends StatefulWidget {
//   const PopDatepicker({Key? key}) : super(key: key);
//
//   @override
//   State<PopDatepicker> createState() => _PopDatepickerState();
// }
//
// class _PopDatepickerState extends State<PopDatepicker> {
//   TextEditingController checkout2controller = TextEditingController();
//   TextEditingController checkout1controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child:showDialog(
//             context: context,
//             builder: (ctx) {
//               GlobalKey<FormState> formKey = GlobalKey();
//               return AlertDialog(
//                 content: Form(
//                   key: formKey,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           // DatePicker.showDatePicker(context,
//                           //     showTitleActions: true,
//                           //     minTime: DateTime(2018, 3, 5),
//                           //     maxTime: DateTime(2025, 6, 7),
//                           //     onConfirm: (date) {
//                           //       setState(() {
//                           //         checkout1controller.text =
//                           //             date.toString().split(' ').first;
//                           //       });
//                           //     },
//                           //     currentTime: DateTime.now(),
//                           //     locale: LocaleType.en);
//                         },
//                         child: TextFormField(
//                           validator: (val) {
//                             if (val!.isEmpty) {
//                               return "Empty";
//                             }
//                             return null;
//                           },
//                           controller: checkout1controller,
//                           enabled: false,
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(color: Colors.red),
//                             errorBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.red)
//                             ),
//                             focusColor: Colors.black,
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(
//                                     Radius.circular(20))),
//                             labelText: 'Check in',
//                             hintStyle: TextStyle(
//                               color: Colors.black,
//                               fontSize: 18,
//                               fontStyle: FontStyle.italic,
//                             ),
//                           ),
//                           style: TextStyle(
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           // DatePicker.showDatePicker(context,
//                           //     showTitleActions: true,
//                           //     minTime: DateTime.now(),
//                           //     maxTime: DateTime(2025, 6, 7),
//                           //     onConfirm: (date) {
//                           //       setState(() {
//                           //         checkout2controller.text =
//                           //             date.toString().split(' ').first;
//                           //       });
//                           //     },
//                           //     currentTime: DateTime.now(),
//                           //     locale: LocaleType.en);
//                         },
//                         child: TextFormField(
//                           validator: (val) {
//                             if (val!.isEmpty) {
//                               return "Empty";
//                             }
//                             return null;
//                           },
//                           enabled: false,
//                           controller: checkout2controller,
//                           decoration: InputDecoration(
//                             errorStyle: TextStyle(color: Colors.red),
//                             errorBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(color: Colors.red)
//                             ),
//                             focusColor: Colors.black,
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.all(
//                                     Radius.circular(20))),
//                             labelText: 'Check Out',
//                             hintStyle: TextStyle(
//                               color: Colors.black,
//                               fontSize: 18,
//                               fontStyle: FontStyle.italic,
//                             ),
//                           ),
//                           style: TextStyle(
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: () {
//                           if (formKey.currentState!.validate()) {
//                             // Navigator.push(
//                             //     context,
//                             //     MaterialPageRoute(
//                             //         builder: (ctx) => ScreenHome(
//                             //           id: widget
//                             //               .searchModel
//                             //               .suggestions![index]
//                             //               .entities![0]
//                             //               .destinationId
//                             //               .toString(),
//                             //           inDate: checkout1controller.text,
//                             //           outDate: checkout2controller.text,
//                             //         )));
//                           }
//                         },
//                         child: const Text("okay"),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             });
//
//
//
//         ),
//
//     );
//   }
// }
