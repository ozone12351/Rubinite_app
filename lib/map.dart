import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/api.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'dart:async';
// import 'package:location/location.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:open_app_settings/open_app_settings.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  late BitmapDescriptor customIcon; // Custom markers' icon
  Set<Marker> markers = {}; // Store markers
  bool hasMoreData = true; // bool to check that the api still has more data
  Timer? _apiRequestTimer; // Declare timer variable
  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = 
  //   FlutterLocalNotificationsPlugin(); // Initialize FlutterLocalNotificationsPlugin

  // bool buttonEnabled = false; // Enable the button with a delay

  // // Declare variables to store latitude and longitude
  // double currentLatitude = 13.803242;
  // double currentLongitude = 100.525289;

  double targetLatitude = 13.803242; // Store middle screen latitude
  double targetLongitude = 100.525289; // Store middle screen longitude

  // Store current camera position
  CameraPosition _currentCameraPosition = CameraPosition(
    target: LatLng(13.803242, 100.525289), // Start LatLong
    zoom: 9.0, // Start zoom level
  );

//   void initializeNotifications() async {
//   final AndroidInitializationSettings androidInitializationSettings =
//       AndroidInitializationSettings('app_icon');

//   final IOSInitializationSettings iosInitializationSettings =
//       IOSInitializationSettings(
//     requestAlertPermission: true,
//     requestBadgePermission: true,
//     requestSoundPermission: true,
//     onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {
//       // Handle when a notification is tapped
//     },
//   );

//   final InitializationSettings initializationSettings =
//       InitializationSettings(
//     android: androidInitializationSettings,
//     iOS: iosInitializationSettings,
//   );

//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onSelectNotification: (String? payload) async {
//     // Handle when a notification is tapped
//   });

//   // Request permissions if not granted
//   final bool? notificationPermissionGranted =
//       await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               IOSFlutterLocalNotificationsPlugin>()!
//           .requestPermissions(
//             alert: true,
//             badge: true,
//             sound: true,
//           );

//   if (notificationPermissionGranted != null &&
//       notificationPermissionGranted) {
//     // Permissions granted
//   }
// }

  @override
  void initState() {
    super.initState();
    loadCustomMarkerIcon();
    fetchDataAndCreateMarkers(targetLatitude, targetLongitude);
    // requestLocationPermission(); // Request location permission
    // startLocationUpdates(); // Start location updates
    // initializeNotifications(); // Initialize notifications

    // // Add a delay before enable the button
    // Future.delayed(Duration(seconds: 5), () {
    //   setState(() {
    //     buttonEnabled = true;
    //   });
    // });
  }

  Future<void> loadCustomMarkerIcon() async {
    final ByteData data = await rootBundle.load('assets/fireIcon.png');
    final Uint8List customIconData = data.buffer.asUint8List();
    customIcon = BitmapDescriptor.fromBytes(customIconData);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    fetchDataAndCreateMarkers(targetLatitude, targetLatitude); // Fetch data and create markers
  }

  Future<void> fetchDataAndCreateMarkers(double latitude, double longitude) async {
    final data = await fetchDataFromAPI(latitude, longitude);

    final markers = await Future.wait(data.map((item) async {
      final latitude = item['latitude'];
      final longitude = item['longitude'];
      // final title = item['title'];
      final locationInfo = await getLocationInfo(latitude, longitude);
      final title = "$locationInfo";
      final acq_date = item['acq_date'];
      final customMarkerId = item['customMarkerId'];

    return Marker(
      markerId: MarkerId(customMarkerId),
      position: LatLng(latitude, longitude),
      icon: customIcon,
      infoWindow: InfoWindow(
        title: title,
        snippet: "Heat detected!\nLocation: $latitude, $longitude\nDate: $acq_date\nSource: NASA FIRMS API (Suomi NPP)",
      ),
    );
  }));

  if (mounted) {
    setState(() {
      if (markers.isEmpty) {
        hasMoreData = false; // No more data available
      } else {
        this.markers.addAll(markers);
      }
    });
  }
}

  // Get markers' location info
  Future<String> getLocationInfo(double latitude, double longitude) async {
  try {
    final List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      final Placemark placemark = placemarks[0];
      final String city = placemark.locality ?? "Unknown City";
      final String state = placemark.administrativeArea ?? "Unknown State";
      final String country = placemark.country ?? "Unknown Country";
      return "$city, $state, $country";
    }
  } catch (e) {
    // print("Error getting location info: $e");
  }
  return "Unknown Location";
}

  // Update current camera position
  void _onCameraMove(CameraPosition position) {
    _currentCameraPosition = position;

    if (mounted) {
      setState(() {
      targetLatitude = position.target.latitude;
      targetLongitude = position.target.longitude;
      });
    }

    // print(currentLatitude);
    // print(currentLongitude);

    // Cancel previous timer if exists
    _apiRequestTimer?.cancel();

    // Delay fetch data from API
    _apiRequestTimer = Timer(Duration(milliseconds: 500), () {
      fetchDataAndCreateMarkers(targetLatitude, targetLongitude);
    });
  }

// // Request location permission
// Future<void> requestLocationPermission() async {
//   // Request foreground location permission
//   final PermissionStatus status = await Permission.location.request();

//   if (status.isGranted) {
//     // Request background location permission
//     final PermissionStatus backgroundStatus = await Permission.locationAlways.request();

//     if (backgroundStatus.isGranted) {
//       // Both foreground and background location permissions are granted
//       mapController.animateCamera(CameraUpdate.newCameraPosition(_currentCameraPosition));
//     }
//   }
// }

//   // Start continuous location updates
//   void startLocationUpdates() {
//     Geolocator.getPositionStream().listen((Position position) {
//       setState(() {
//         currentLatitude = position.latitude;
//         currentLongitude = position.longitude;
//       });

//       fetchDataAndCreateMarkers(currentLatitude, currentLongitude);
//     });
//   }

//   Future<void> showNotification({
//   required int id,
//   required String title,
//   required String body,
// }) async {
//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//     'channel_id', // CHANNEL ID
//     'Channel name', // CHANNEL NAME
//     'Channel description', // CHANNEL DESCRIPTION
//     importance: Importance.max,
//     priority: Priority.high,
//     ticker: 'ticker',
//   );
//   const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);

//   await flutterLocalNotificationsPlugin.show(
//     id,
//     title,
//     body,
//     platformChannelSpecifics,
//     payload: '', // Payload for notification handling
//   );
// }

//   void sendNotification() {
//   String notificationTitle = 'Notification Title';
//   String notificationBody = 'Notification Body';

//   showNotification(
//     id: 0, // Unique ID for notification
//     title: notificationTitle,
//     body: notificationBody,
//   );
// }


  @override
  void dispose() {
    // Dispose timer when widget is disposed to avoid memory leaks
    _apiRequestTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fire Map'),
          elevation: 2,
          leading: IconButton( // Back button
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(); // Navigate to previous screen
            },
          ),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: _currentCameraPosition,
          markers: markers,
          myLocationEnabled: true,
          minMaxZoomPreference: MinMaxZoomPreference(7, null), // Minimum & Maximum zoom level
          onCameraMove: _onCameraMove,
        ),
        // floatingActionButton: FloatingActionButton( // Test notification
        //   onPressed: () {
        //     // Send a notification when the button is pressed
        //     sendNotification();
        //     print("Pressed sendNotification button");
        //   },
        //   child: Icon(Icons.add_alert),
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _requestPermission,
        //   child: Icon(Icons.location_on),
        // ),
      )
    );
  }
}