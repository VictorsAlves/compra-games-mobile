import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class IPresenter<T extends StatefulWidget> {
  final State<T> state;
  bool isInitialized = false;

  IPresenter({@required this.state});

  Future initView();

  Future reloadView() async {
    await initView();
  }

  void updateView() {
    state.setState(() {
      isInitialized = true;
    });
  }

  Future<T> navigate(Widget presenter) {
    return Navigator.push(
        state.context, new MaterialPageRoute(builder: (context) => presenter));
  }

  Future<T> navigateReplacement(Widget presenter) {
    return Navigator.pushReplacement(
        state.context, new MaterialPageRoute(builder: (context) => presenter));
  }

  Future<T> navigateNamed(String route) {
    return Navigator.pushNamed(state.context, route);
  }

  Future<T> navigateNamedReplacement(String route) {
    return Navigator.pushReplacementNamed(state.context, route);
  }
  void navigatorPushNamedAndRemoveUntil(String route, )  {
    Navigator.pushNamedAndRemoveUntil(state.context,route,
            (Route<dynamic> route) => false);
  }

  void voltar() {
    Navigator.pop(state.context);
  }
}
