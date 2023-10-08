import 'package:flutter/material.dart';

import '../generated/assets.dart';
import '../homepage.dart';
import 'add_fire_info.dart';
import 'add_med_info.dart';

class MedSent extends StatelessWidget {
  const MedSent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      child: Scaffold(
        // appBar: AppBar(
        //     title: const Text("fire"),
        // ),
        body: Column(
          children: [

            const Padding(padding: EdgeInsets.symmetric(vertical: 25, horizontal: 0)),

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
                        "Your call has \n been sent!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,

                        ),
                      ),

                      const Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0)),

                      Image.asset(
                        Assets.imageCheck,
                        height: 260,
                      ),

                      const Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0)),

                      const Text(
                        "The Emergency team \n are going to \n your location. \n Our center will contact \n you back for more instruction.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),

                      ///
                      ///
                      /// Future development!
                      ///
                      // const Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0)),
                      // TextButton(
                      //   onPressed: () async {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => const AddMedInfo()),
                      //     );
                      //   },
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(
                      //         vertical: 13.5, horizontal: 40.5),
                      //     decoration: BoxDecoration(
                      //         color: const Color.fromRGBO(
                      //             124, 221, 0, 1.0),
                      //         borderRadius:
                      //         BorderRadius.circular(42)),
                      //     child: const Text(
                      //       "First AID Instruction",
                      //       style: TextStyle(
                      //           fontSize: 25,
                      //           color: Colors.black),
                      //     ),
                      //   ),
                      // ),


                      TextButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePageMobile()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13.5, horizontal: 60.5),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(
                                  124, 221, 0, 1),
                              borderRadius:
                              BorderRadius.circular(42)),
                          child: const Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.black
                            ),
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
      ),

      onWillPop: () async {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
            Text('Pop Screen Disabled. You cannot go to previous screen. Please continue!'),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      },


    );
  }
}
