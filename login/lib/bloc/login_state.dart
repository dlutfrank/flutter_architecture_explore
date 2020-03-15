part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class Processing extends LoginState{}

class Authed extends LoginState {
  final String token;
  final String userName;
  Authed(this.userName, this.token);
}

class UnAuth extends LoginState {}


