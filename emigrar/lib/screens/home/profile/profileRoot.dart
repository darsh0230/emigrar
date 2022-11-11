import 'package:emigrar/constants/constantColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileRoot extends StatefulWidget {
  const ProfileRoot({Key? key}) : super(key: key);

  @override
  State<ProfileRoot> createState() => _ProfileRootState();
}

class _ProfileRootState extends State<ProfileRoot> {
  @override
  Widget build(BuildContext context) {
    CC cc = CC();
    return Container(
      color: cc.Black,
      child: Text("Profile"),
    );
  }
}
