import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class UtilProvider with ChangeNotifier {
  final PersistentTabController navBarController =
      PersistentTabController(initialIndex: 0);

  int currNavBarIndex = 0;
  void changecurrNavBarIndex(int index) {
    currNavBarIndex = index;
    notifyListeners();
  }

  Set<Marker> mapsMarkers = {};
  void addMarkers(Marker marker) {
    mapsMarkers.add(marker);
    notifyListeners();
  }
}
