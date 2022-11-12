import 'package:emigrar/constants/constantColors.dart';
import 'package:emigrar/constants/constantEnv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: cc.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 64.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "EMIGRAR",
                  style: TextStyle(color: cc.white, fontSize: 38),
                ),
              ),
            ),
            const SizedBox(height: 64.0),
            _postPanel(),
          ],
        ),
      ),
    );
  }
}

Widget _postPanel() {
  Env env = Env();
  CC cc = CC();

  bool isPostLiked = true;
  return Column(
    children: [
      SizedBox(
        width: double.infinity,
        child: Image.network("${env.cdnUrl}cdn/eed80eda3f278421_himalaya.jpg"),
      ),
      Row(
        children: [
          // like icon
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Icon(
              isPostLiked ? Icons.favorite : Icons.favorite_border_outlined,
              color: isPostLiked ? cc.red : cc.white,
              size: 32.0,
            ),
          ),

          // comments icon
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Icon(
              Icons.add_comment_outlined,
              color: cc.white,
              size: 32.0,
            ),
          ),

          // location icon
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Icon(
              Icons.location_on_outlined,
              color: cc.violet,
              size: 32.0,
            ),
          ),
        ],
      )
    ],
  );
}
