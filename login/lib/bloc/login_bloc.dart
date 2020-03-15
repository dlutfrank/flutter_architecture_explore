import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:login/data/abstract_user_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IUserRepo _userRepo;

  LoginBloc(IUserRepo userRepo) : _userRepo = userRepo;

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is QueryAuthEvent) {
      final userModel = await _userRepo.loadAuth();
      if (userModel != null && userModel.token != null) {
        yield Authed(userModel.userName, userModel.token);
      } else {
        yield UnAuth();
      }
    }
    if (event is LoginInEvent) {
      yield Processing();
      final token = await _userRepo.login(event.userName, event.password);
      if (token != null) {
        _userRepo.saveAuth(event.userName, token);
        yield Authed(event.userName, token);
      } else {
        yield UnAuth();
      }
    }
    if (event is LoginOutEvent) {
      yield Processing();
      await _userRepo.deleteAuth(event.userName);
      yield UnAuth();
    }
  }
}
