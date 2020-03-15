import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/index.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _userCtl;
  TextEditingController _passwdCtl;

  @override
  void initState() {
    super.initState();
    _userCtl = TextEditingController();
    _passwdCtl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: null,
        title: Text(
          "登录页",
        ),
      ),
      body: BlocListener<LoginBloc, LoginState>(
          listener: (BuildContext context, LoginState state) {
            if (state is Authed) {
              Navigator.of(context).pop();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "用户名"),
                controller: _userCtl,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "密码"),
                controller: _passwdCtl,
                obscureText: true,
              ),
              RaisedButton(
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context).add(LoginInEvent(
                      userName: _userCtl.text, password: _passwdCtl.text));
                },
                child: Text("登录"),
              ),
            ],
          )),
    );
  }
}
