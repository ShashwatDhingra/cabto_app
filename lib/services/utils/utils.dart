import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class Utils {
  Future<Position> getUserLocaiton() async {
    Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) => throw Exception('Permission Denied'));

    return Geolocator.getCurrentPosition();
  }
  
}
