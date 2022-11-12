import 'package:emigrar/constants/constantColors.dart';
import 'package:emigrar/constants/constantEnv.dart';
import 'package:emigrar/models/postModel.dart';
import 'package:emigrar/screens/home/maps/mapsRoot.dart';
import 'package:emigrar/services/getPosts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:emigrar/providers/utilProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomeRoot extends StatefulWidget {
  const HomeRoot({Key? key}) : super(key: key);

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  Env env = Env();
  CC cc = CC();

  List<Post> allPosts = [];

  Widget _postPanel(String username, String caption, String imgUrl,
      double latitude, double longitude) {
    bool isPostLiked = false;

    return SizedBox(
      // height: 400.0,
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.panorama_fish_eye_outlined,
                  color: cc.white,
                ),
              ),
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Text(
                      username,
                      style: TextStyle(color: cc.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Text(
                      caption,
                      style: TextStyle(color: cc.white),
                    ),
                  ),
                ),
              ]),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: double.infinity,
            child: Image.network("${env.cdnUrl}${imgUrl}"),
          ),
          // left icons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // like icon
                  InkWell(
                    onTap: (() {
                      isPostLiked = !isPostLiked;
                      setState(() {});
                      print(isPostLiked);
                    }),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      child: Icon(
                        isPostLiked
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: isPostLiked ? cc.red : cc.white,
                        size: 32.0,
                      ),
                    ),
                  ),

                  // comments icon
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                    child: Icon(
                      Icons.add_comment_outlined,
                      color: cc.white,
                      size: 32.0,
                    ),
                  ),

                  // location icon
                  InkWell(
                    onTap: () {
                      context.read<UtilProvider>().changecurrNavBarIndex(2);
                      context.read<UtilProvider>().navBarController.index = 2;
                      context.read<UtilProvider>().addMarkers(Marker(
                          markerId: MarkerId("post"),
                          position: LatLng(latitude, longitude),
                          draggable: false,
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueAzure)));
                      gotoLocation(latitude, longitude);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      child: Icon(
                        Icons.location_on_outlined,
                        color: cc.violet,
                        size: 32.0,
                      ),
                    ),
                  ),
                ],
              ),
              // right icons
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0),
                    child: Icon(
                      Icons.save_alt_outlined,
                      color: cc.white,
                      size: 32.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      allPosts = await getPosts();
      setState(() {});
      // if (allPosts.length > 0) print(allPosts[0].imgUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    CC cc = CC();
    return Scaffold(
      backgroundColor: cc.black,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
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
            // const SizedBox(height: 18.0),
            SingleChildScrollView(
              physics: ScrollPhysics(),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: allPosts.length,
                itemBuilder: (context, index) {
                  return _postPanel(
                      "username",
                      allPosts[index].caption,
                      allPosts[index].imgUrl,
                      allPosts[index].location.latitude,
                      allPosts[index].location.longitude);
                },
              ),
            ),
            const SizedBox(height: 120.0),
          ],
        ),
      ),
    );
  }
}
