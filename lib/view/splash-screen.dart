import 'package:compra_games/presenter/splash-screen-presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:z_components/components/z_loading.dart';

class SplashScreen extends StatefulWidget {
  static final String ROUTER = "/splash-screen";

  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  SplashScreenPresenter _presenter;

  @override
  void initState() {
    super.initState();
    _presenter = new SplashScreenPresenter(this);
    _presenter.initView();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new ZLoading(),
            ],
          ),
        ),
      ),
    );
  }
}
