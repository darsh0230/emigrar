import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class UtilProvider with ChangeNotifier {
  final PersistentTabController navBarController =
      PersistentTabController(initialIndex: 0);
}
