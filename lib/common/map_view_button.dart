import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

class MapViewButton extends StatefulWidget {
  const MapViewButton({super.key});

  @override
  MapViewButtonState createState() => MapViewButtonState();
}

class MapViewButtonState extends State<MapViewButton> {
  String _location = '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA';
  Map<String, double> _coords = {
    'latitud': 37.4220041,
    'longitud': -122.0862462
  };
  String _placeLabel = 'Google Headquarters are here';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            _location,
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () => MapsLauncher.launchQuery(_location),
                  child: const Text('Launch Query')),
              const SizedBox(height: 32),
              TextButton(
                onPressed: () => MapsLauncher.launchCoordinates(
                    _coords["latitud"]!, _coords["longitud"]!, _placeLabel),
                child: const Text('Launch Coordinates'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
