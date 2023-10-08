//
///
///
/// For future development!
///
///
///
//
// import 'package:application/SOS/poli_sent.dart';
// import 'package:flutter/material.dart';
//
// import '../generated/assets.dart';
//
// class AddMedInfo extends StatefulWidget {
//   const AddMedInfo({Key? key}) : super(key: key);
//   @override
//   _AddMedInfo createState() => _AddMedInfo();
// }
//
// var yes = false;
// var no = false;
// var idk = false;
//
// class medcheck extends _AddMedInfo{
//
//   Row medchecker = Row(
//     children: [
//       TextButton(
//         onPressed: () {
//           setstate(() {
//             if (yes == false) {
//               yes = true;
//               print(yes);
//             } else {
//               yes = false;
//               print(yes);
//             }
//           });
//         },
//         child: Column(
//           children: [
//           ,
//           ],
//         ),
//       )
//     ],
//   );
// }
//
//   class _AddMedInfo extends State<AddMedInfo> {
//   @override
//   Widget build(BuildContext context) {
//   return StatefulBuilder(
//   builder: (BuildContext context, StateSetter setstate) {
//
//
//   Image yesimg = yes ? Image.asset(Assets.imageFiretick, height: 108,) : Image.asset(Assets.imageFirefighter, height: 108,);
//   Image noimg = no ? Image.asset(Assets.imageFiretick, height: 108,) : Image.asset(Assets.imageFirefighter, height: 108,);
//   Image idkimg = idk ? Image.asset(Assets.imageFiretick, height: 108,) : Image.asset(Assets.imageFirefighter, height: 108,);
//
//
//     return Scaffold(
//       // appBar: AppBar(
//       //     title: const Text("fire"),
//       // ),
//       body: Column(
//         children: [
//
//           const Padding(
//               padding: EdgeInsets.symmetric(vertical: 25, horizontal: 0)),
//
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               const Padding(
//                   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0)),
//               Container(
//                 padding: const EdgeInsets.all(20.0),
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(39),
//                 ),
//                 child: Column(
//                   children: [
//                     const Text(
//                       "Please select \n Patient condition",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 32,
//
//                       ),
//                     ),
//
//                     const Padding(padding: EdgeInsets.symmetric(
//                         vertical: 25, horizontal: 0)),
//
//                     // put in item for select height 250
//
//
//
//
//
//
//
//                     const Padding(padding: EdgeInsets.symmetric(
//                         vertical: 20, horizontal: 0)),
//
//                     TextButton(
//                       onPressed: () async {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const AddMedInfo()),
//                         );
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 13.5, horizontal: 70.5),
//                         decoration: BoxDecoration(
//                             color: const Color.fromRGBO(
//                                 0, 26, 255, 1.0),
//                             borderRadius:
//                             BorderRadius.circular(42)),
//                         child: const Text(
//                           "Add more patient",
//                           style: TextStyle(
//                               fontSize: 25,
//                               color: Colors.white),
//                         ),
//                       ),
//                     ),
//
//
//                     TextButton(
//                       onPressed: () async {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const PoliSent()),
//                         );
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 13.5, horizontal: 90.5),
//                         decoration: BoxDecoration(
//                             color: const Color.fromRGBO(
//                                 124, 221, 0, 1.0),
//                             borderRadius:
//                             BorderRadius.circular(42)),
//                         child: const Text(
//                           "Sent",
//                           style: TextStyle(
//                               fontSize: 25,
//                               color: Colors.black),
//                         ),
//                       ),
//                     ),
//
//
//                   ],
//                 ),
//               ),
//               const Padding(
//                   padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
