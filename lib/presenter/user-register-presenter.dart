import 'package:compra_games/view/user-register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'i-presenter.dart';

class UserRegisterPresenter extends IPresenter<UserRegister> {
  UserRegisterPresenter(State<UserRegister> state) : super(state: state);
  var _userViewModel;
  var statusLogin;
  var controllerCelular;


  var controllerEmail = new TextEditingController();
  var controllerNome = new TextEditingController();
  var controllerSenha = new TextEditingController();
  var controllerRepetirSenha = new TextEditingController();
  var controllerLogin = new TextEditingController();

  FocusNode loginFocus;
  FocusNode emailFocus;
  FocusNode senhaFocus;
  FocusNode repetirSenhaFocus;
  FocusNode celularFocus;

  @override
  Future initView() {
    // TODO: implement initView
    return null;
  }
  Future<Null> register() async {
    if (_userViewModel.login.isEmpty ||
        _userViewModel.password.isEmpty ||
        _userViewModel.secondPassword.isEmpty ||
        _userViewModel.phone.isEmpty ||
        _userViewModel.email.isEmpty) {
      _userViewModel.messageError =
      "Ops, houve um erro\ntodos os campos deve estar preenchidos";
      _userViewModel.error = true;
      return;
    }

    if (_userViewModel.login.indexOf(" ") > -1) {
      _userViewModel.messageError =
      "Ops, houve um erro\no login nao deve conter espacos";
      _userViewModel.error = true;
      return;
    }

    if (_userViewModel.login.length < 5) {
      _userViewModel.messageError =
      "Ops, houve um erro\no login deve conter no minimo 5 caracteres";
      _userViewModel.error = true;
      return;
    }

    if (_userViewModel.password.length < 7) {
      _userViewModel.messageError =
      "Ops, houve um erro\na senha deve conter no minimo 7 caracteres";
      _userViewModel.error = true;
      return;
    }

    if (_userViewModel.secondPassword != _userViewModel.password) {
      _userViewModel.messageError =
      "Ops, houve um erro\na senha e o confirmacao de senha nao coincidem";
      _userViewModel.error = true;
      return;
    }

    if (_userViewModel.phone.length < 15) {
      _userViewModel.messageError = "Ops, houve um erro\ntelefone incorreto";
      _userViewModel.error = true;
      return;
    }

    if (_userViewModel.email.indexOf("@") < 1) {
      _userViewModel.messageError = "Ops, houve um erro\nemail incorreto";
      _userViewModel.error = true;
      return;
    }

    _userViewModel.isRegister = true;
     statusLogin = await insert(_userViewModel);

  }

  insert(userViewModel) {}
}
