import 'dart:async';
import 'dart:math' as math;

import 'package:emigrar/constants/constantColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapsRoot extends StatefulWidget {
  const MapsRoot({Key? key}) : super(key: key);

  @override
  State<MapsRoot> createState() => _MapsRootState();
}

class _MapsRootState extends State<MapsRoot> {
  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _initialCameraPosition =
      const CameraPosition(target: LatLng(13.0368676, 77.5631121), zoom: 14.5);

  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;

  GoogleMapController? mapsController;
  Location locationTracker = new Location();
  LocationData? newLoactionData;
  Set<Marker> mapsMarkers = {};

  List<LatLng> polylineCoordinates = [
    // LatLng(13.0366, 77.5630),
    // LatLng(13.0366, 77.5632)
  ];
  Map<PolylineId, Polyline> polylines = {};

  bool checkCoordinates(oldLat, oldLong, newLat, newLong) {
    if (math.sqrt(
            math.pow(oldLat - newLat, 2) + math.pow(oldLong - newLong, 2)) >
        0.0001) return true;
    return false;
  }

  void updateMarkerAndCircle(newLocData) {
    LatLng latlng = LatLng(newLocData.latitude, newLocData.longitude);
    setState(() {
      mapsMarkers.add(Marker(
          markerId: MarkerId('my_loc'),
          position: latlng,
          draggable: false,
          // icon: curLocIcon,
          icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueViolet)));
      if (polylineCoordinates.isNotEmpty &&
          checkCoordinates(
              polylineCoordinates[polylineCoordinates.length - 1].latitude,
              polylineCoordinates[polylineCoordinates.length - 1].longitude,
              newLocData.latitude,
              newLocData.longitude))
        polylineCoordinates
            .add(LatLng(newLocData.latitude, newLocData.longitude));
    });
  }

  Future<void> gotoLocation(double? lat, double? long) async {
    final GoogleMapController controller = mapsController!;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat!, long!),
      zoom: 15,
      // tilt: 50.0,
      bearing: 45.0,
    )));
  }

  Future<void> _onMapCreated(controller) async {
    // print(context.watch<RouteProvider>().stopNames);
    // var _auth = FirebaseAuth.instance;
    // print(_auth.currentUser!.uid);

    String _darkMapStyle =
        await rootBundle.loadString('assets/map_styles.json');

    mapsController = controller;
    mapsController?.setMapStyle(_darkMapStyle);
    //TODO: get this at the start of the app and display a page if location is not enabled like in bounce
    _serviceEnabled = await locationTracker.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await locationTracker.requestService();
      if (!_serviceEnabled!) {
        print('Service not enabled');
        return;
      }
    }
    _permissionGranted = await locationTracker.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await locationTracker.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    var _locationData = await locationTracker.getLocation();
    newLoactionData = _locationData;
    updateMarkerAndCircle(_locationData);
    gotoLocation(_locationData.latitude, _locationData.longitude);
    if (_locationData.latitude != null)
      polylineCoordinates.add(LatLng(
          _locationData.latitude ?? 0.0, _locationData.longitude ?? 0.0));

    locationTracker.onLocationChanged.listen((newLocData) {
      newLoactionData = newLocData;
      updateMarkerAndCircle(newLocData);
      // print(newLocData);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id, color: CC().violet, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    CC cc = CC();
    return Container(
      color: cc.black,
      child: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _initialCameraPosition,
            markers: mapsMarkers,
            polylines: Set<Polyline>.of(polylines.values),
            onMapCreated: _onMapCreated,
          ),
        ],
      ),
    );
  }
}
