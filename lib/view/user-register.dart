import 'package:compra_games/presenter/user-register-presenter.dart';
import 'package:compra_games/view/style/main-style.dart';
import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  static final String ROUTER = "/user-register";

  @override
  State<StatefulWidget> createState() => new _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  UserRegisterPresenter _presenter;


  // UserViewModel _userViewModel = new UserViewModel();

  @override
  void initState() {
    _presenter = new UserRegisterPresenter(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Compra-Games",
            style: TextStyle(
              fontSize: 20,
              color: Colors.orange,
            ),
          ),
          backgroundColor: Colors.orange, //fffafa
          centerTitle: true,
        ),
        backgroundColor: Colors.orange,
        body: new Stack(children: <Widget>[
          _body(),
          new Container(
              child: LinearProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),
          ))
        ]));
  }

  Widget _body() {
    return new Column(
      children: <Widget>[
        new Expanded(
          child: _formularioCadastro(),
        ),
      ],
    );
  }

  Widget _formularioCadastro() {
    return new ListView(
      children: <Widget>[
        new Container(
          margin: EdgeInsets.all(30.0),
          //padding: EdgeInsets.only(left: 10.0, top: 20.0, bottom: 20.0),
          alignment: Alignment.center,
          child: Center(
            child: new Text(
              "CADASTRO",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
        ),
        new Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Colors.black),
                  bottom: BorderSide(color: Colors.black))),
          child: new Column(
            children: <Widget>[
              new Container(
                color: Colors.white,
                child: GestureDetector(
                  //Login
                  onTap: () {
                    FocusScope.of(context).requestFocus(_presenter.loginFocus);
                  },
                  child: new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Expanded(
                            flex: 3,
                            child: new Container(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: new Text(
                                "Login",
                              ),
                            ),
                          ),
                          new Expanded(
                            flex: 7,
                            child: new Container(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 16.0),
                              child: new TextField(
                                onSubmitted: (term) => _fieldFocusChange(
                                    context, _presenter.loginFocus,_presenter. emailFocus),
                                onChanged: (text) {
                                  /*    if (_presenter.userViewModel.error)
                                    _userViewModel.error = false;
                                  _userViewModel.login = text;*/
                                },
                                keyboardType: TextInputType.text,
                                maxLength: 20,
                                textCapitalization: TextCapitalization.words,
                                focusNode: _presenter.loginFocus,
                                controller: _presenter.controllerLogin,
                                cursorColor: Colors.orange,
                                decoration: InputDecoration(
                                  counterText: "",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange),
                                  ),
                                  hintText: "Login",
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              new Container(
                color: Colors.white,
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).requestFocus(_presenter.senhaFocus),
                  child: Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Expanded(
                            flex: 3,
                            child: new Container(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: new Text(
                                "Senha",
                              ),
                            ),
                          ),
                          new Expanded(
                            flex: 7,
                            child: new Container(
                              padding: EdgeInsets.only(left: 8.0, right: 16.0),
                              child: new TextField(
                                  onSubmitted: (term) => _fieldFocusChange(
                                      context, _presenter.senhaFocus, _presenter.repetirSenhaFocus),
                                  onChanged: (text) {
                                    /*        if (_userViewModel.error)
                                    _userViewModel.error = false;
                                  _userViewModel.password = text;*/
                                  },
                                  maxLength: 35,
                                  controller: _presenter.controllerSenha,
                                  focusNode: _presenter.senhaFocus,
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.orange,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.orange),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.orange),
                                    ),
                                    isDense: false,
                                    hintText: "•••••••",
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              new Container(
                color: Colors.white,
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).requestFocus(_presenter.senhaFocus),
                  child: Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Expanded(
                            flex: 3,
                            child: new Container(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                              ),
                              child: new Text(
                                "Repetir Senha",
                              ),
                            ),
                          ),
                          new Expanded(
                            flex: 7,
                            child: new Container(
                              margin:
                                  const EdgeInsets.only(left: 8.0, right: 16.0),
                              child: new TextField(
                                  onSubmitted: (term) => _fieldFocusChange(
                                      context, _presenter.repetirSenhaFocus, _presenter.celularFocus),
                                  onChanged: (text) {
                                    /*           if (_userViewModel.error)
                                    _userViewModel.error = false;
                                  _userViewModel.secondPassword = text;*/
                                  },
                                  maxLength: 35,
                                  keyboardType: TextInputType.text,
                                  controller: _presenter.controllerRepetirSenha,
                                  focusNode: _presenter.repetirSenhaFocus,
                                  cursorColor: Colors.orange,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.orange),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.orange),
                                    ),
                                    isDense: false,
                                    hintText: "•••••••",
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              new Container(
                //CELULAR
                color: Colors.white,
                child: GestureDetector(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(_presenter.celularFocus),
                  child: new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Expanded(
                            flex: 3,
                            child: new Container(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: new Text(
                                  "Celular",
                                )),
                          ),
                          new Expanded(
                            flex: 7,
                            child: new Container(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 16.0),
                              child: new TextField(
                                  onSubmitted: (term) => _fieldFocusChange(
                                      context, _presenter.celularFocus, _presenter.emailFocus),
                                  maxLength: 15,
                                  onChanged: (text) {
                                    /* if (_userViewModel.error)
                                    _userViewModel.error = false;*/
                                    /*  _userViewModel.phone = text;
                                  if (text.length == 15) {
                                    _fieldFocusChange(
                                        context, celularFocus, emailFocus);
                                  }*/
                                  },
                                  controller: _presenter.controllerCelular,
                                  focusNode: _presenter.celularFocus,
                                  keyboardType: TextInputType.phone,
                                  cursorColor: Colors.orange,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.orange),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.orange),
                                    ),
                                    hintText: "(••) 9••••-••••",
                                  )),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              new Container(
                //E-MAIL
                color: Colors.white,
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).requestFocus(_presenter.emailFocus),
                  child: new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Expanded(
                            flex: 3,
                            child: new Container(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: new Text(
                                "E-mail",
                              ),
                            ),
                          ),
                          new Expanded(
                            flex: 7,
                            child: new Container(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 16.0),
                              child: new TextField(
                                onSubmitted: (term) => _fieldFocusChange(
                                    context, _presenter.emailFocus, _presenter.emailFocus),
                                onChanged: (text) {
                                  /*     if (_userViewModel.error)
                                    _userViewModel.error = false;
                                  _userViewModel.email = text;*/
                                },
                                maxLength: 150,
                                controller: _presenter.controllerEmail,
                                focusNode: _presenter.emailFocus,
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Colors.orange,
                                decoration: InputDecoration(
                                  counterText: "",
                                  hintText: "email@email.com",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        new Container(
          margin: EdgeInsets.only(top: 35.0),
          alignment: Alignment.centerRight,
        ),
        _buildError(),
        new Container(
          padding: EdgeInsets.only(left: 15.0, bottom: 15.0, top: 15),
          alignment: Alignment.center,
          child: new Text(
            "Li e concordo com os termos de uso.",
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new InkWell(
                onTap: () => _presenter.register(),
                child: new Container(
                  margin: EdgeInsets.only(left: 40.0, right: 40.0),
                  padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                  child: new Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      border: Border.all(color: Colors.orange, width: 2.0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    child: new Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 70,
                          bottom: MediaQuery.of(context).size.height / 70,
                          right: MediaQuery.of(context).size.height / 9,
                          left: MediaQuery.of(context).size.height / 10),
                      alignment: Alignment.center,
                      child: new Text(
                        "CADASTRAR",
                        style: new TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildError() {
    return new Container(
        padding: EdgeInsets.only(left: 35, right: 35, bottom: 20.0),
        alignment: Alignment.center,
        child: AnimatedOpacity(
            opacity: 1,
            duration: Duration(milliseconds: 250),
            child: new Text("Erro",
                textAlign: TextAlign.center,
                style: new TextStyle(color: Colors.red, fontSize: 16))));
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
