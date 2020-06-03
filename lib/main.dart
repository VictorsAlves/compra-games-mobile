import 'package:compra_games/view/dashboard-page.dart';
import 'package:compra_games/view/splash-screen.dart';
import 'package:compra_games/view/user-login.dart';
import 'package:compra_games/view/user-register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'EXECUTOR',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        SplashScreen.ROUTER: (_) => new SplashScreen(),
        UserLogin.ROUTER: (_) => new UserLogin(),
        DashboardPage.ROUTER: (_) => new DashboardPage(),
        UserRegister.ROUTER: (_) => new UserRegister(),
      },
    );
  }
}
