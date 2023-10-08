import 'package:application/SOS/takepicture.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../generated/assets.dart';
import 'package:application/map.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextButton(
              onPressed: () => {},
              child: Image.asset(
                Assets.imageAlertIcon,
                height: 50.0,
                alignment: Alignment.centerLeft,
              ),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 50.0)),
            TextButton(
              onPressed: () => {},
              child: Image.asset(
                Assets.imageProfile,
                height: 50.0,
                alignment: Alignment.centerRight,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 50, 28, 0),
            child: Container(
              height: 126.0,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(39),
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              await availableCameras().then(
                    (value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => camera(cameras: value,),
                  ),
                ),
              );
            },
            child: Image.asset(
              Assets.imageSos,
              height: 421.0,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(53),
                topRight: Radius.circular(53),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 0)),
                TextButton(
                  onPressed: () => {},
                  child: Image.asset(
                    Assets.imageHomeIcon,
                    height: 70.0,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapPage()),
                    );
                  },
                  child: Image.asset(
                    Assets.imageFiremap,
                    height: 70.0,
                  ),
                ),
                TextButton(
                  onPressed: () => {},
                  child: Image.asset(
                    Assets.imageSetting,
                    height: 70.0,
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 50, horizontal: 0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
