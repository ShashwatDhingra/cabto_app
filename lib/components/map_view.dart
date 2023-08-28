import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:cabto_app/services/utils/cosnt/cosnts.dart';
import 'package:cabto_app/services/utils/utils.dart';
import 'package:cabto_app/view_model/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:cabto_app/.env';

class MapView extends StatefulWidget {
  MapView({super.key, this.destination});

  String? destination;

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  // Controller for Map
  Completer<GoogleMapController> _controller = Completer();

  bool _isLoading = false; // To track loading state

  // Marker List
  List<Marker> _marker = [];

  // PolyLines
  Set<Polyline> _route = HashSet<Polyline>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('here');
    locateUser();
    if (widget.destination != null) {
      makeRoute();
    }
  }

  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyProvider>(context);
    return Scaffold(
      body: Stack(children: [
        GoogleMap(
          polylines: _route,
          markers: Set<Marker>.of(_marker),
          onMapCreated: (controller) {
            _controller.complete(controller);
          },
          zoomControlsEnabled: false,
          initialCameraPosition:
              const CameraPosition(target: LatLng(28, 77), zoom: 2),
        ),
        if (_isLoading)
          const Center(
            child: CircularProgressIndicator(),
          ),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: white,
        child: const Icon(Icons.my_location),
        shape: const CircleBorder(eccentricity: 1),
        onPressed: () async {
          locateUser();
        },
      ),
    );
  }

  void locateUser() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    try {
      Position userLocation = await Utils().getUserLocaiton();

      // Added a Marker
      _marker.add(Marker(
          markerId: const MarkerId('userLocation'),
          position: LatLng(userLocation.latitude, userLocation.longitude)));

      // Animate Camera
      var userLocationCameraPosition = CameraPosition(
          target: LatLng(userLocation.latitude, userLocation.longitude),
          zoom: 14);

      var controller = await _controller.future;

      controller.animateCamera(
          CameraUpdate.newCameraPosition(userLocationCameraPosition));
    } catch (e) {
      // Handle error here
      print('Error getting user location: $e');
    } finally {
      setState(() {
        _isLoading = false; // Hide loading indicator
      });
    }
  }

  void makeRoute() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    // Getting the lat lng of user location
    Position userLocation = await Utils().getUserLocaiton();

    // Getting the lat lng of user destination
    List<Location> location = await locationFromAddress(widget.destination!);

    _marker.add(Marker(
        markerId: const MarkerId('2'),
        position: LatLng(location.last.latitude, location.last.longitude)));

    try {
      PolylinePoints polylinePoints = PolylinePoints();
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          SEARCH_PLACE_API,
          PointLatLng(userLocation.latitude, userLocation.longitude),
          PointLatLng(location.last.latitude, location.last.longitude));
      _route.add(Polyline(
          polylineId: const PolylineId('1'),
          points: getLatLngPoints(result),
          color: Colors.blue,
          width: 4));
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No Facility Supported! ')));
    } finally {
      setState(() {
        _isLoading = false; // Hide loading indicator
      });
    }
  }

  List<LatLng> getLatLngPoints(PolylineResult result) {
    List<LatLng> list = [];

    result.points.forEach((element) {
      list.add(LatLng(element.latitude, element.longitude));
    });

    return list;
  }
}
