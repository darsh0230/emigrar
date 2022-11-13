class Path {
  String? sId;
  List<PathPolyLines>? pathPolyLines;
  String? color;

  Path({this.sId, this.pathPolyLines, this.color});

  Path.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['pathPolyLines'] != null) {
      pathPolyLines = <PathPolyLines>[];
      json['pathPolyLines'].forEach((v) {
        pathPolyLines!.add(new PathPolyLines.fromJson(v));
      });
    }
    color = json['color'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.pathPolyLines != null) {
      data['pathPolyLines'] =
          this.pathPolyLines!.map((v) => v.toJson()).toList();
    }
    data['color'] = this.color;
    return data;
  }
}

class PathPolyLines {
  double? latitude;
  double? longitude;

  PathPolyLines({this.latitude, this.longitude});

  PathPolyLines.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'] ?? 0.0;
    longitude = json['longitude'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
