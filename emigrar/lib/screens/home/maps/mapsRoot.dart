import 'package:emigrar/constants/constantColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MapsRoot extends StatefulWidget {
  const MapsRoot({Key? key}) : super(key: key);

  @override
  State<MapsRoot> createState() => _MapsRootState();
}

class _MapsRootState extends State<MapsRoot> {
  @override
  Widget build(BuildContext context) {
    CC cc = CC();
    return Container(
      color: cc.black,
      child: Text("Maps"),
    );
  }
}
