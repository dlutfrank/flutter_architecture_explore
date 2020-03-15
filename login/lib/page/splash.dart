import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  Timer _timer;
  int _count = 3;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: _count), (_) {
      _count -= 1;
      if (_count <= 0) {
        _timer.cancel();
        this._toMainPage();
      } else {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Text("闪屏页: $_count"),
      ),
    );
  }

  _toMainPage() {
    Navigator.of(context).pushReplacementNamed('/home');
  }
}
