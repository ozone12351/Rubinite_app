import 'package:application/SOS/add_med_info.dart';
import 'package:application/SOS/poli_sent.dart';
import 'package:flutter/material.dart';

import '../generated/assets.dart';
import '../homepage.dart';

class AddFireInfo extends StatefulWidget {
  const AddFireInfo({Key? key}) : super(key: key);

  @override
  _AddFireInfo createState() => _AddFireInfo();
}

var more5 = false;
var less5 = false;
var forest = false;
var plane = false;
var chemi = false;
var idk = false;

class _AddFireInfo extends State<AddFireInfo> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setstate) {
      Image more5floorimage = more5 ? Image.asset(Assets.imageMore5tick, height: 108,) : Image.asset(Assets.imageMore5, height: 108,);
      Image less5floorimage = less5 ? Image.asset(Assets.imageLess5tick, height: 108,) : Image.asset(Assets.imageLess5, height: 108,);
      Image forestimage = forest ? Image.asset(Assets.imageForesttick, height: 108,) : Image.asset(Assets.imageForest, height: 108,);
      Image planeimage = plane ? Image.asset(Assets.imagePlanetick, height: 108,) : Image.asset(Assets.imagePlane, height: 108,);
      Image chemicalimage = chemi ? Image.asset(Assets.imageChemitick, height: 108,) : Image.asset(Assets.imageChemi, height: 108,);
      Image idkimage = idk ? Image.asset(Assets.imageIdktick, height: 108,) : Image.asset(Assets.imageIdk, height: 108,);

      return Scaffold(
        // appBar: AppBar(
        //     title: const Text("fire"),
        // ),
        body: Column(
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0)),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(39),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Please select \n type of fire",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),

                      const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0)),

                      // put in item for select height 250

                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              setstate(() {
                                if (more5 == false) {
                                  more5 = true;
                                  print(more5);
                                } else {
                                  more5 = false;
                                  print(more5);
                                }
                              });
                            },
                            child: Column(
                              children: [
                                more5floorimage,
                                Text("Building More \n than 5 floor",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setstate(() {
                                if (less5 == false) {
                                  less5 = true;
                                  print(less5);
                                } else {
                                  less5 = false;
                                  print(less5);
                                }
                              });
                            },
                            child: Column(
                              children: [
                                less5floorimage,
                                Text(
                                    "Building Less \n than 5 floor",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                      const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0)),

                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              setstate(() {
                                if (forest == false) {
                                  forest = true;
                                  print(forest);
                                } else {
                                  forest = false;
                                  print(forest);
                                }
                              });
                            },
                            child: Column(
                              children: [
                                forestimage,
                                Text("Forest Fire",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setstate(() {
                                if (plane == false) {
                                  plane = true;
                                  print(plane);
                                } else {
                                  plane = false;
                                  print(plane);
                                }
                              });
                            },
                            child: Column(
                              children: [
                                planeimage,
                                Text("Field Fire",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),),
                              ],
                            ),
                          )
                        ],
                      ),

                      const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 0)),

                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              setstate(() {
                                if (chemi == false) {
                                  chemi = true;
                                  print(chemi);
                                } else {
                                  chemi = false;
                                  print(chemi);
                                }
                              });
                            },
                            child: Column(
                              children: [
                                chemicalimage,
                                Text("Chemical/ \n Electric fire",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setstate(() {
                                if (idk == false) {
                                  idk = true;
                                  print(idk);
                                } else {
                                  idk = false;
                                  print(idk);
                                }
                              });
                            },
                            child: Column(
                              children: [
                                idkimage,
                                Text("I Don’t know",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),),
                              ],
                            ),
                          )
                        ],
                      ),
                              ///
                              ///
                              /// Future development!
                              ///
                      // const Padding(
                      //     padding: EdgeInsets.symmetric(
                      //         vertical: 10, horizontal: 0)),

                      // TextButton(
                      //   onPressed: () async {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => const AddMedInfo()),
                      //     );
                      //   },
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(
                      //         vertical: 13.5, horizontal: 70.5),
                      //     decoration: BoxDecoration(
                      //         color: const Color.fromRGBO(0, 26, 255, 1.0),
                      //         borderRadius: BorderRadius.circular(42)),
                      //     child: const Text(
                      //       "Has Patient!",
                      //       style: TextStyle(fontSize: 25, color: Colors.white),
                      //     ),
                      //   ),
                      // ),

                      TextButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PoliSent()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13.5, horizontal: 80.5),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(124, 221, 0, 1.0),
                              borderRadius: BorderRadius.circular(42)),
                          child: const Text(
                            "Sent",
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0)),
              ],
            ),
          ],
        ),
      );
    });
  }
}
