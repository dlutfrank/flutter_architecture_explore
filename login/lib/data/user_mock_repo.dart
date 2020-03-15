import 'package:login/data/user_model.dart';

import './abstract_user_repo.dart';

class UserMockRepo extends IUserRepo {
  bool _authed = false;
  @override
  Future<void> deleteAuth(String userName) async {
    _authed = false;
    return Future.delayed(Duration(seconds: 1));
  }

  @override
  Future<String> login(String userName, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return "$userName-token";
  }

  @override
  Future<void> saveAuth(String userName, String token) async {
    _authed = true;
    return Future.delayed(Duration(seconds: 1));
  }

  @override
  Future<UserModel> loadAuth() async {
    if (_authed) {
      return Future.value(UserModel(userName: "frank", token: "frank-token"));
    } else {
      return Future.value(null);
    }
  }
}
