import 'package:compra_games/presenter/user-login-presenter.dart';
import 'package:compra_games/view/style/main-style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'components/shadow-text.dart';

class UserLogin extends StatefulWidget {
  static final String ROUTER = "/login";

  @override
  State<StatefulWidget> createState() => new _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  UserLoginPresenter _view;

  @override
  void initState() {
    super.initState();

    _view = new UserLoginPresenter(this);

    _view.initView();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/fundo.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        new Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomPadding: true,
          body: new Container(
            child: new Stack(
              children: <Widget>[
                new ListView(
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[_logo()],
                    ),
                    new Stack(
                      children: <Widget>[
                        new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                top: 160.0,
                              ),
                              child: new ShadowText(
                                  "           Ainda não tem sua conta? \n Clique no botão abaixo e cadastre-se",
                                  style: MainStyle.get(context)
                                      .mainStyleTextWhite),
                            ),
                            new Column(
                              children: <Widget>[
                                new GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/user-register");
                                  },
                                  child: new Container(
                                    color: Colors.transparent,
                                    margin: EdgeInsets.only(
                                        left: 90.0, right: 90.0),
                                    padding:
                                        EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                                    child: new Container(
                                      margin: EdgeInsets.only(
                                          top: 10.0, bottom: 10.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 2.0),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30.0))),
                                      child: new Container(
                                        margin:
                                            EdgeInsets.only(bottom: 7, top: 5),
                                        alignment: Alignment.center,
                                        child: new ShadowText("CADASTRO",
                                            style: MainStyle.get(context)
                                                .styleButtonTextWhite),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        new Container(
                          margin: EdgeInsets.only(
                              top: 100,
                              left: MainStyle.get(context).marginRightLeft,
                              right: MainStyle.get(context).marginRightLeft),
                          child: new SizedBox(
                            width: double.infinity,
                            child: RaisedButton(
                              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, "/dashboard");

                              },
                              color: Colors.black,
                              child: new Text(
                                "ENTRAR",
                                style:
                                    MainStyle.get(context).styleButtonTextWhite,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _logo() {
    return new Container(
        height: 85,
        width: 180,
        child: Center(
            child: Text("COMPRA GAMES",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))));
  }
}
