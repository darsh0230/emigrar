class Post {
  Post({
    required this.uid,
    required this.imgUrl,
    required this.caption,
    required this.location,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String uid;
  late final String imgUrl;
  late final String caption;
  late final Location location;
  late final String id;
  late final String createdAt;
  late final String updatedAt;

  Post.fromJson(Map<String, dynamic> json) {
    uid = json['uid'] ?? "";
    imgUrl = json['imgUrl'] ?? "";
    caption = json['caption'] ?? "";
    location = Location.fromJson(json['location']);
    id = json['id'] ?? "";
    createdAt = json['createdAt'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uid'] = uid;
    _data['imgUrl'] = imgUrl;
    _data['caption'] = caption;
    _data['location'] = location.toJson();
    _data['id'] = id;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}

class Location {
  Location({
    required this.latitude,
    required this.longitude,
  });
  late final double latitude;
  late final double longitude;

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'] ?? 0.0;
    longitude = json['longitude'] ?? 0.0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    return _data;
  }
}
