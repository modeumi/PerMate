class UserModel {
  String? email;
  String? name;
  String? nickname;
  String? brith;
  String? gender;

  UserModel({
    this.email,
    this.name,
    this.nickname,
    this.brith,
    this.gender,
  });

  UserModel.FromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    nickname = json['nickname'];
    brith = json['brith'];
    gender = json['gender'];
  }
}
