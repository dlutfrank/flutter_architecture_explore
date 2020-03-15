import 'package:login/data/user_model.dart';

abstract class IUserRepo {
  Future<void> saveAuth(String userName, String token);
  Future<String> login(String userName, String password);
  Future<void> deleteAuth(String userName);
  Future<UserModel> loadAuth();
}