class CusUser {
  late final String? uid;
  late final String? name;
  late final String? email;
  late final int? reward;

  CusUser({
    this.uid,
    this.name,
    this.email,
    this.reward,
  });

  CusUser.fromJson(Map<String, dynamic> json) {
    uid = json['_id'] ?? "";
    name = json['name'] ?? "";
    email = json['email'] ?? "";
    reward = json['reward'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = uid;
    _data['name'] = name;
    _data['email'] = email;
    _data['reward'] = reward;
    return _data;
  }
}
