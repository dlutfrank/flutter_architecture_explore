class UserModel {
  String userName;
  String token;

  UserModel({this.userName, this.token});

  @override
  String toString() {
    return "UserModel{ userName: $userName, token: $token}";
  }
}
