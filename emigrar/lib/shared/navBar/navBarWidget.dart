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
              color: cc.black, borderRadius: BorderRadius.circular(40.0)),
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
                _navBarItem(icon: Icons.add, index: 0, context: context),
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
  return InkWell(
    onTap: () {
      context.read<UtilProvider>().navBarController.index = index;
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 36.0,
        ),
        Text(
          name ?? "",
          style: TextStyle(color: Colors.white),
        )
      ],
    ),
  );
}
