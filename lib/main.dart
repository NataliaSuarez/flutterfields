import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutterfields/form_view.dart';
import 'package:open_location_picker/open_location_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Location location = Location();

  MyApp({super.key});

  Future<LatLng?> _getCurrentLocationUsingLocationPackage() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        throw Exception("Service is not enabled");
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        throw Exception("Permission not granted");
      }
    }
    var _locationData = await location.getLocation();

    return LatLng(_locationData.latitude!, _locationData.longitude!);
  }

  Future<LatLng> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var data = await Geolocator.getCurrentPosition();
    print(data);

    return LatLng(data.latitude, data.longitude);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OpenMapSettings(
      onError: (context, error) {
        print(error);
      },
      // getCurrentLocation: _getCurrentLocationUsingLocationPackage,
      getCurrentLocation: _determinePosition,
      reverseZoom: ReverseZoom.building,
      // getLocationStream: () => location.onLocationChanged
      //     .map((event) => LatLng(event.latitude!, event.longitude!)),
      getLocationStream: () => Geolocator.getPositionStream()
          .map((event) => LatLng(event.latitude, event.longitude)),
      child: MaterialApp(
        title: 'Flutter Fields',
        locale: const Locale('en', 'US'),
        localizationsDelegates: const [
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        // supportedLocales: const [],
        theme: ThemeData(
          primarySwatch: Colors.teal,
          fontFamily: 'Montserrat',
        ),
        home: Scaffold(
            appBar: AppBar(title: const Text('Flutter Fields')),
            body: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: FormView(),
            )),
      ),
    );
  }
}
