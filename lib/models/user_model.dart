class UserModel {
  String? username;
  String? uid;

  UserModel({this.username, this.uid});

  String get name => username!;
  String get id => uid!;

  set name(String name) => username = name;
  set id(String id) => uid = id;

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['uid'] = uid;
    return data;
  }
}
