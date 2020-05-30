import 'dart:io';
import 'package:compra_games/model/ioc/app-configuration.dart';
import 'package:compra_games/presenter/dashboard-page.dart';
import 'package:compra_games/presenter/splash-screen.dart';
import 'package:compra_games/view/i-presenter.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:z_components/components/z-injector/z-injector.dart';

class SplashScreenPresenter extends IPresenter<SplashScreen> {
  SharedPreferences _sharedPreferences;

  SplashScreenPresenter(State<SplashScreen> state) : super(state: state);

  @override
  Future initView() async {
    AppConfiguration.init().then((_) async {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _permission();
      await _verifyAppState();
    });
  }

  Future _permission() async {
    if (Platform.isAndroid) {
      await PermissionHandler().requestPermissions([
        PermissionGroup.storage,
        PermissionGroup.location,
        PermissionGroup.camera,
        PermissionGroup.microphone,
      ]);
    }
  }

  Future _verifyAppState() async {
    // se logado redireciona
    navigatorPushNamedAndRemoveUntil(DashboardPage.ROUTER);
  }
}
