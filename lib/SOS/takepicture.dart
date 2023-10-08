import 'dart:async';
import 'dart:io';

import 'package:application/SOS/firesent.dart';
import 'package:application/SOS/poli_sent.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../generated/assets.dart';
import '../homepage.dart';
import 'med_sent.dart';



class camera extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const camera({this.cameras, Key? key}) : super(key: key);

  @override
  _cameraState createState() => _cameraState();
}

class _cameraState extends State<camera> {
  late CameraController controller;
  XFile? image;

  var Fire = false;
  var Med = false;
  var Poli = false;
  var Heli = false;

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![0],
      ResolutionPreset.max,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (width < 600 && image == null) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: width - 58,
                    top: 10,
                    bottom: 10,
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(39))),
                  child: BackButton(
                    onPressed: () => {
                      Navigator.of(context).pop(),
                    },
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0)),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(39),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Please take \n Pictures",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.transparent,
                            ),
                            child: SizedBox(
                              height: 441,
                              child: CameraPreview(controller),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () async {
                            image = await controller.takePicture();
                            setState(() {});
                          },
                          child: Image.asset(
                            Assets.imageCameraIcon,
                            height: 91,
                          )),
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
    } //end <600 null

    else if (width < 600 && image != null) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: width - 58,
                    top: 10,
                    bottom: 10,
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(39))),
                  child: BackButton(
                    onPressed: () => {
                      Navigator.of(context).pop(),
                    },
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0)),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(39),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Please check \n The Pictures",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.transparent,
                          ),
                          child: Center(
                              child:
                                  //Android/iOS
                                  Image.file(
                            File(image!.path),
                            // width: 301,
                            height: 441,
                          )),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {

                          /// show popup
                          ///
                          /// make it when selected show green box
                          ///
                          ///
                          /// POPUP
                          showDialog(
                              context: context,
                              builder: (BuildContext context)
                          {
                            return StatefulBuilder(  // You need this, notice the parameters below:
                                builder: (BuildContext context, StateSetter setstate) {
                                  Image fireimage = Fire  ? Image.asset(Assets.imageFiretick, height: 108,) : Image.asset(Assets.imageFirefighter, height: 108,);
                                  Image medimage = Med  ? Image.asset(Assets.imageAmbulancetick, height: 108,) : Image.asset(Assets.imageAmbulance, height: 108,);
                                  Image poliimage = Poli  ? Image.asset(Assets.imagePolicetick, height: 108,) : Image.asset(Assets.imagePolice, height: 108,);
                                  Image heliimage = Heli  ? Image.asset("assets/image/helitick.jpg", height: 108,) : Image.asset(Assets.imageHeli , height: 108,);

                                  return Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 0.4),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Column(
                                      children: [
                                        const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 120, horizontal: 0)),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            // 2 icon for select fire and med
                                            TextButton(
                                              onPressed: () {
                                                setstate((){
                                                  if (Fire == false) {
                                                    Fire = true;
                                                    print(Fire);
                                                  } else {
                                                      Fire = false;
                                                      print(Fire);
                                                    }
                                                });
                                              },
                                              child: fireimage,

                                            ),

                                            TextButton(
                                              onPressed: () async {
                                                setstate((){
                                                  if (Med == false) {
                                                    Med = true;
                                                    print(Med);
                                                  } else {
                                                    Med = false;
                                                    print(Med);
                                                  }
                                                });
                                              },
                                              child:medimage
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          children: [
                                            // 2 icon for select pol & other
                                            TextButton(
                                              onPressed: () async {
                                                setstate((){
                                                  if (Poli == false) {
                                                    Poli = true;
                                                    print(Poli);
                                                  } else {
                                                    Poli = false;
                                                    print(Poli);
                                                  }
                                                });
                                              },
                                              child: poliimage,
                                            ),

                                            TextButton(
                                              onPressed: () async {
                                                setstate((){
                                                  if (Heli == false) {
                                                    Heli = true;
                                                    print(Heli);
                                                  } else {
                                                    Heli = false;
                                                    print(Heli);
                                                  }
                                                });
                                              },
                                              child: heliimage,
                                            ),
                                          ],
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            //check fire med poli heli if non is tick then select all
                                            if (Fire == true && Med == false) {
                                              // sent data to db if have time
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (
                                                      context) => const fireSent()));
                                            } else
                                            if (Fire == true && Med == true) {
                                              // sent data to db (if have time to make)
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (
                                                      context) => const fireSent()));
                                            } else if (Med == true) {
                                              // sent data to db (if have time to make)
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (
                                                      context) => const MedSent()));
                                            } else
                                            if (Poli == true || Heli == true) {
                                              // sent data to db (if have time to make)
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (
                                                      context) => const PoliSent()));
                                            } else {
                                              // max emergency
                                              // sent data to db (if have time to make)
                                              Fire = true;
                                              Med = true;
                                              Poli = true;
                                              Heli = true;
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (
                                                      context) => const fireSent()));
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 13.5,
                                                horizontal: 40.5),
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    124, 221, 0, 1.0),
                                                borderRadius:
                                                BorderRadius.circular(42)),
                                            child: const Text(
                                              "Confirmed SOS",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (
                                                  context) => const HomePageMobile()),
                                            );
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 13.5,
                                                horizontal: 50.5),
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    255, 107, 0, 1.0),
                                                borderRadius:
                                                BorderRadius.circular(42)),
                                            child: const Text(
                                              "Cancel SOS",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });

                            ///
                            ///
                            /// end popup
                            ///
                          }
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13.5, horizontal: 60.5),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(124, 221, 0, 1.0),
                              borderRadius: BorderRadius.circular(42)),
                          child: const Text(
                            "Confirmed",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          image = null;
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13.5, horizontal: 50.5),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 107, 0, 1.0),
                              borderRadius: BorderRadius.circular(42)),
                          child: const Text(
                            "Retake Photo",
                            style: TextStyle(fontSize: 20, color: Colors.black),
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
    } else if (width > 600 && image == null) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SizedBox(
                  width: 258,
                  child: CameraPreview(controller),
                ),
              ),
            ),
            TextButton(
                onPressed: () async {
                  image = await controller.takePicture();
                  setState(() {});
                },
                child: Image.asset(
                  Assets.imageCameraIcon,
                  height: 91,
                )),
          ],
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child:
                    //Android/iOS
                    Image.file(
                  File(image!.path),
                  width: 258,
                  // height: 200,
                ),
              ),
            ),
            TextButton(
                onPressed: () async {
                  image = await controller.takePicture();
                  setState(() {});
                },
                child: Image.asset(
                  Assets.imageCameraIcon,
                  height: 91,
                )),
          ],
        ),
      );
    }
  }
}

// if (pictureFile != null)
// //Android/iOS
// Image.file(
// File(pictureFile!.path),
// // width: 301,
// // height: 200,
// scale: 20,
// ),

// Future<void> main() async {
//   // Ensure that plugin services are initialized so that `availableCameras()`
//   // can be called before `runApp()`
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();
//
//   // Get a specific camera from the list of available cameras.
//   final firstCamera = cameras.first;
//
//   runApp(
//     MaterialApp(
//       theme: ThemeData.dark(),
//       home: TakePictureScreen(
//         // Pass the appropriate camera to the TakePictureScreen widget.
//         camera: firstCamera,
//       ),
//     ),
//   );
// }
//
// // A screen that allows users to take a picture using a given camera.
// class TakePictureScreen extends StatefulWidget {
//   final CameraDescription camera;
//
//   const TakePictureScreen({
//     Key? key,
//     required this.camera,
//   }) : super(key: key);
//
//   @override
//   TakePictureScreenState createState() => TakePictureScreenState();
// }
//
// class TakePictureScreenState extends State<TakePictureScreen> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     // To display the current output from the Camera,
//     // create a CameraController.
//     _controller = CameraController(
//       // Get a specific camera from the list of available cameras.
//       widget.camera,
//       // Define the resolution to use.
//       ResolutionPreset.medium,
//     );
//
//     // Next, initialize the controller. This returns a Future.
//     _initializeControllerFuture = _controller.initialize();
//   }
//
//   @override
//   void dispose() {
//     // Dispose of the controller when the widget is disposed.
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Take a picture')),
//       // You must wait until the controller is initialized before displaying the
//       // camera preview. Use a FutureBuilder to display a loading spinner until the
//       // controller has finished initializing.
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // If the Future is complete, display the preview.
//             return CameraPreview(_controller);
//           } else {
//             // Otherwise, display a loading indicator.
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         // Provide an onPressed callback.
//         onPressed: () async {
//           // Take the Picture in a try / catch block. If anything goes wrong,
//           // catch the error.
//           try {
//             // Ensure that the camera is initialized.
//             await _initializeControllerFuture;
//
//             // Attempt to take a picture and get the file `image`
//             // where it was saved.
//             final image = await _controller.takePicture();
//
//             // If the picture was taken, display it on a new screen.
//             await Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => DisplayPictureScreen(
//                   // Pass the automatically generated path to
//                   // the DisplayPictureScreen widget.
//                   imagePath: image.path,
//                 ),
//               ),
//             );
//           } catch (e) {
//             // If an error occurs, log the error to the console.
//             print(e);
//           }
//         },
//         child: const Icon(Icons.camera_alt),
//       ),
//     );
//   }
// }
//
// // A widget that displays the picture taken by the user.
// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;
//
//   const DisplayPictureScreen({Key? key, required this.imagePath}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Display the Picture')),
//       // The image is stored as a file on the device. Use the `Image.file`
//       // constructor with the given path to display the image.
//       body: Image.file(File(imagePath)),
//     );
//   }
// }
