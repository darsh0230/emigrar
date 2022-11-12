import 'dart:convert';

import 'package:emigrar/constants/constantEnv.dart';
import 'package:emigrar/models/postModel.dart';
import "package:http/http.dart" as http;

Future<List<Post>> getPosts() async {
  Env env = Env();

  try {
    var response = await http.get(
      Uri.parse(
        "${env.baseUrl}post/getPost",
      ),
    );

    if (response.statusCode == 200) {
      List<Post> posts = [];

      var postsData = jsonDecode(response.body.toString())["result"];

      for (var post in postsData) {
        posts.add(Post.fromJson(post));
      }

      return posts;
    }
    return [];
  } catch (e) {
    print(e);
    return [];
  }
}
