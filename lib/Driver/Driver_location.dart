import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String street = "";
String subadmin = "";
String admin = "";
String code = "";

class Driver_location extends StatefulWidget {
  String? route;

  Driver_location({Key? key, this.route}) : super(key: key);

  @override
  State<Driver_location> createState() => _Driver_locationState();
}

class _Driver_locationState extends State<Driver_location> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Position> _getGeoLocationPosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(
            msg: 'Location permissions are denied',
            toastLength: Toast.LENGTH_LONG);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions',
          toastLength: Toast.LENGTH_LONG);
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[3];

    setState(() {
      street = place.street.toString();
      subadmin = place.subAdministrativeArea.toString();
      admin = place.administrativeArea.toString();
      code = place.postalCode.toString();
      FirebaseFirestore.instance
          .collection("Bus")
          .doc(widget.route)
          .update({
        //"Name": widget.route,
        //"Driver" : "",
        "Location": "${street} ${subadmin}"});
    });
  }

  askforlocation() async {
    Position position = await _getGeoLocationPosition();

    print("This is ${position}");

    GetAddressFromLatLong(position);
  }

  @override
  void initState() {
    askforlocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/wall.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Route : ${widget.route}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    decoration: TextDecoration.none),
              ),
              SizedBox(height: 20),
              Text(
                "Location : ${street}, ${subadmin}, ${admin}, ${code}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    decoration: TextDecoration.none),
              )
            ],
          ),
        ),
      ),
    );
  }
}
