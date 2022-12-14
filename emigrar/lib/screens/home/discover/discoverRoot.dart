import 'package:emigrar/constants/constantColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DiscoverRoot extends StatefulWidget {
  const DiscoverRoot({Key? key}) : super(key: key);

  @override
  State<DiscoverRoot> createState() => _DiscoverRootState();
}

class _DiscoverRootState extends State<DiscoverRoot> {
  @override
  Widget build(BuildContext context) {
    CC cc = CC();
    return Container(
      color: cc.black,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "COMING SOON",
          style: TextStyle(fontSize: 50.0, color: cc.white),
        ),
      )),
    );
  }
}
