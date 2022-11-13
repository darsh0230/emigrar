import 'dart:convert';

import 'package:emigrar/constants/constantEnv.dart';
import 'package:emigrar/models/pathModel.dart';
import "package:http/http.dart" as http;

Future<List<Path>> getPaths() async {
  Env env = Env();

  try {
    var response = await http.get(
      Uri.parse(
        "${env.baseUrl}path/getPaths",
      ),
    );

    if (response.statusCode == 200) {
      List<Path> paths = [];

      var pathsData = jsonDecode(response.body.toString())["result"];

      for (var path in pathsData) {
        paths.add(Path.fromJson(path));
      }

      return paths;
    }
    return [];
  } catch (e) {
    print(e);
    return [];
  }
}
