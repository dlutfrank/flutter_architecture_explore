part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  List<Object> get props => [];
}

class LoginInEvent extends LoginEvent {
  final String userName;
  final String password;
  LoginInEvent({
    @required this.userName,
    @required this.password,
  });

  @override
  List<Object> get props => [userName, password];
}

class LoginOutEvent extends LoginEvent {
  final String userName;

  LoginOutEvent({
    @required this.userName,
  });

  @override
  List<Object> get props => [userName];
}

class QueryAuthEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}
