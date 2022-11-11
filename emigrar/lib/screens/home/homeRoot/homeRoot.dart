import 'package:emigrar/constants/constantColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeRoot extends StatefulWidget {
  const HomeRoot({Key? key}) : super(key: key);

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  @override
  Widget build(BuildContext context) {
    CC cc = CC();
    return Container(
      color: cc.Black,
      child: Text("Home page"),
    );
  }
}
