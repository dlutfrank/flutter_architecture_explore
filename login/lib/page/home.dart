import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/bloc/index.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
        builder: (BuildContext context, LoginState state) {
      final isLoading = (state is Processing);
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "主页",
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(isLoading ? Icons.local_dining : Icons.ac_unit),
                onPressed: () {
                  if (state is Authed) {
                    BlocProvider.of<LoginBloc>(context)
                        .add(LoginOutEvent(userName: state.userName));
                  } else if (state is UnAuth) {
                    Navigator.of(context).pushNamed("/login");
                  }
                }),
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("User login"),
            ],
          ),
        ),
      );
    }, listener: (BuildContext context, LoginState state) {
      if (state is UnAuth) {
        Navigator.of(context).pushNamed('/login');
      }
    });
  }
}
