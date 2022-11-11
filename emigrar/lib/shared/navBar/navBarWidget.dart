// ignore_for_file: prefer_const_constructors

import 'package:emigrar/constants/constantColors.dart';
import 'package:emigrar/providers/utilProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  @override
  Widget build(BuildContext context) {
    CC cc = CC();
    return SizedBox(
      height: 120.0,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40, left: 10.0, right: 10.0),
        child: Container(
          decoration: BoxDecoration(
              color: cc.lBlack, borderRadius: BorderRadius.circular(40.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _navBarItem(
                    icon: Icons.home, name: "home", index: 0, context: context),
                _navBarItem(
                    icon: Icons.search,
                    name: "Discover",
                    index: 1,
                    context: context),
                InkWell(
                  onTap: () {
                    _addBtnDialog(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: cc.violet,
                        borderRadius: BorderRadius.circular(32)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add,
                        color: cc.white,
                        size: 36.0,
                      ),
                    ),
                  ),
                ),
                _navBarItem(
                    icon: Icons.map_sharp,
                    name: "Maps",
                    index: 2,
                    context: context),
                _navBarItem(
                    icon: Icons.person_outline_outlined,
                    name: "Profile",
                    index: 3,
                    context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _navBarItem(
    {required BuildContext context,
    var icon,
    String? name,
    required int index}) {
  CC cc = CC();
  return InkWell(
    onTap: () {
      context.read<UtilProvider>().navBarController.index = index;
      context.read<UtilProvider>().changecurrNavBarIndex(index);
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          icon,
          color: context.watch<UtilProvider>().currNavBarIndex == index
              ? cc.violet
              : cc.white,
          size: 36.0,
        ),
        Text(
          name ?? "",
          style: TextStyle(
              color: context.watch<UtilProvider>().currNavBarIndex == index
                  ? cc.violet
                  : cc.white),
        )
      ],
    ),
  );
}

Future<void> _addBtnDialog(BuildContext context) async {
  CC cc = CC();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
          backgroundColor: CC().black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              24.0,
            ),
          ),
          // title: Text('Share your Experience'),
          content: Container(
            color: cc.black,
            child: SizedBox(
              height: 150,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Share Your Experience",
                    style: TextStyle(fontSize: 24, color: cc.red),
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  Container(
                    height: 1.0,
                    width: double.infinity,
                    color: cc.white,
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Add a Post",
                      style: TextStyle(fontSize: 18, color: cc.white),
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      context.read<UtilProvider>().navBarController.index = 2;
                      context.read<UtilProvider>().changecurrNavBarIndex(2);
                    },
                    child: Text(
                      "Start your Treak",
                      style: TextStyle(fontSize: 18, color: cc.white),
                    ),
                  )
                ],
              ),
            ),
          ));
    },
  );
}
