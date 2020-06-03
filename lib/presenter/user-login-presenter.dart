import 'package:compra_games/presenter/view-model/login-viewmodel.dart';
import 'package:compra_games/utils/dialog-utils.dart';
import 'package:compra_games/view/style/main-style.dart';
import 'package:compra_games/view/user-login.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_shifter/mask_shifter.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:z_components/components/z-alert-dialog.dart';
import 'package:z_components/config/z-dialog.dart';

import 'i-presenter.dart';




class UserLoginPresenter extends IPresenter<UserLogin> {


  DialogUtils _dialog;

  FocusNode password = new FocusNode();
  FocusNode passport = new FocusNode();
  FocusNode rne = new FocusNode();

  bool invalido = false;
  bool auth = true;

  bool estrangeiro = false;
  bool lembrarSenha = false;
  bool click = false;
  bool clicKCpf = false;

  LoginViewModel loginViewModel = new LoginViewModel();

  var controllerCPF = new TextEditingController();
  var controllerCPFesqueci = new TextEditingController();

  double fraction = 0.0;

  var textCpf;

  FocusNode focusCPF;
  FocusNode focusSenha;

  String codigo;
  String emailCompleto;

  UserLoginPresenter(State<UserLogin> state) : super(state: state);

  @override
  Future initView() async {
    _dialog = new DialogUtils(state.context);
    focusCPF = FocusNode();
    focusSenha = FocusNode();

  }



  bool validate(String valida) {
    if (!CPFValidator.isValid(valida)) {
      invalido = true;
      _dialog.showAlertDialogErro(
          "CPF Inválido!", "Por Favor insira um CPF válido.");
      if (valida == loginViewModel.email) {
        fieldFocusChange(state.context, focusCPF, focusCPF);
      }
      return true;
    }
    return false;
  }

  Future showEsqueciSenha() async {
    return showDialog(
      context: state.context,
      barrierDismissible: false,
      builder: (BuildContext context) => ZAlertDialog(
        zDialog: ZDialog.normal,
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.all(12),
                  child: new Text("ESQUECI MINHA SENHA",
                      style: MainStyle.get(context).styleTittleDialog),
                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    bottom: 10.0,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: new Column(
                    children: <Widget>[
                      new Text("Por favor, confirme o seu CPF abaixo:",
                          style: new TextStyle(
                              fontSize: MainStyle.get(context).fontSizePadrao,
                              color: Color(0xff707070)),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ],
            ),
            new Container(
              margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
              decoration: new BoxDecoration(
                border: Border.all(color: const Color(0xff999999), width: 0.7),
                borderRadius: BorderRadius.all(Radius.circular(
                        5.0) //                 <--- border radius here
                    ),
              ),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: new Container(
                      margin: const EdgeInsets.only(
                        right: 16.0,
                        top: 12.0,
                        bottom: 12.0,
                      ),
                      child: new TextField(
                        autofocus: true,
                        textAlign: TextAlign.center,
                        keyboardAppearance: Brightness.light,
                        controller: controllerCPFesqueci,
                        onSubmitted: (text) {},
                        keyboardType: TextInputType.number,
                        cursorColor: Color(0xFF2BBAB4),
                        style: new TextStyle(color: Color(0xFF000000)),
                        decoration: new InputDecoration.collapsed(
                            hintText: "* * * . * * * . * * * - * *",
                            hintStyle: new TextStyle(
                                color: Colors.grey.withOpacity(0.6))),
                        onChanged: (text) {
                          textCpf = text;
                          if (textCpf.length == 14) {
                            validate(controllerCPFesqueci.text);
                          }
                        },
                        inputFormatters: [
                          MaskedTextInputFormatterShifter(
                              maskONE: "XXX.XXX.XXX-XX",
                              maskTWO: "XXX.XXX.XXX-XX"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Container(
                  child: new InkWell(
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(20.0)),
                    splashColor: const Color(0xffe6e6e6),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: new Container(
                      padding: const EdgeInsets.all(12),
                      child: new Text(
                        "CANCELAR",
                        style: new TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color(0xff707070),
                            fontSize:
                                MainStyle.get(context).fontSizeLeadinCancelar),
                      ),
                    ),
                  ),
                  margin: const EdgeInsets.only(bottom: 8),
                ),
                new Container(
                  child: new InkWell(
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(20.0)),
                    splashColor: const Color(0xffe6e6e6),
                    onTap: () {
                      if (textCpf.length == 14) {
                        Navigator.pop(context);

                      } else {
                        showInputCodigoErro("seu CPF");
                      }
                    },
                    child: new Container(
                      padding: const EdgeInsets.all(12),
                      child: new Text(
                        "CONFIRMAR",
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MainStyle.get(context).fontSizeLeadinCancelar),
                      ),
                    ),
                  ),
                  margin: const EdgeInsets.only(bottom: 8),
                )
              ],
            )
          ],
        ),
      ),
    );
  }





  Future showDialogReconhecimentoUser(String text, String tipo) async {
    return showDialog(
      context: state.context,
      barrierDismissible: false,
      builder: (BuildContext context) => ZAlertDialog(
        zDialog: ZDialog.sucess,
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.all(12),
                  child: new Text("Usuário reconhecido",
                      style: MainStyle.get(context).styleTittleDialog),
                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    bottom: 10.0,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: new Column(
                    children: <Widget>[
                      new Text(
                          "Por favor, informe a seguir o código \n encaminhado para o $tipo cadastrado:",
                          style: new TextStyle(
                              fontSize: MainStyle.get(context).fontSizePadrao,
                              color: Color(0xff707070)),
                          textAlign: TextAlign.center),
                      new Text(text,
                          style: new TextStyle(
                              fontSize: MainStyle.get(context).fontSizePadrao,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  child: new InkWell(
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(20.0)),
                    splashColor: const Color(0xffe6e6e6),
                    onTap: () {
                      showInputCodigo(text, tipo);
                    },
                    child: new Container(
                      padding: const EdgeInsets.all(12),
                      child: new Text(
                        "OK",
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MainStyle.get(context).fontSizeLeadinCancelar),
                      ),
                    ),
                  ),
                  margin: const EdgeInsets.only(bottom: 7),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future showDialogReeviar() async {
    return showDialog(
      context: state.context,
      barrierDismissible: false,
      builder: (BuildContext context) => ZAlertDialog(
        zDialog: ZDialog.sucess,
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.all(12),
                  child: new Text("Novo código enviado",
                      style: MainStyle.get(context).styleTittleDialog),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    bottom: 10.0,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: new Column(
                    children: <Widget>[
                      new Text(
                          "Por favor, informe a seguir o código encaminhado para o e-mail cadastrado.",
                          style: new TextStyle(
                              fontSize: MainStyle.get(context).fontSizePadrao,
                              color: Color(0xff707070)),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  child: new InkWell(
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(20.0)),
                    splashColor: const Color(0xffe6e6e6),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: new Container(
                      padding: const EdgeInsets.all(12),
                      child: new Text(
                        "OK",
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                MainStyle.get(context).fontSizeLeadinCancelar),
                      ),
                    ),
                  ),
                  margin: const EdgeInsets.only(bottom: 8),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future showInputCodigo(String email, String tipo) async {
    return showDialog(
        context: state.context,
        barrierDismissible: false,
        builder: (BuildContext context) => ZAlertDialog(
              zDialog: ZDialog.normal,
              child: new Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.all(12),
                        child: new Text("ESQUECI MINHA SENHA",
                            style: MainStyle.get(context).styleTittleDialog),
                      )
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          bottom: 10.0,
                        ),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: new Column(
                          children: <Widget>[
                            new Text(
                                "Informe abaixo o código recebido pelo $tipo:",
                                style: new TextStyle(
                                    fontSize:
                                        MainStyle.get(context).fontSizePadrao,
                                    color: Color(0xff707070)),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      )
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 12.0,
                              ),
                              child: new PinCodeTextField(
                                autofocus: true,
                                highlightColor: const Color(0xff2BBAB4),
                                highlight: true,
                                defaultBorderColor: const Color(0xffC7C7CC),
                                hasTextBorderColor: const Color(0xffC7C7CC),
                                isCupertino: true,
                                maxLength: 6,
                                pinBoxHeight: 30.0,
                                pinBoxWidth: 30.0,
                                onTextChanged: (text) {
                                  codigo = text;
                                },
                                pinTextAnimatedSwitcherTransition:
                                    ProvidedPinBoxTextAnimation
                                        .scalingTransition,
                                pinTextAnimatedSwitcherDuration:
                                    Duration(milliseconds: 150),
                                pinTextStyle: new TextStyle(fontSize: 20),
                              )))
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new GestureDetector(
                        onTap: () {

                        },
                        child: new Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              borderRadius: new BorderRadius.all(
                                  const Radius.circular(20.0)),
                              border: Border.all(color: Color(0xff2bbab4)),
                            ),
                            child: new Container(
                              margin: EdgeInsets.only(
                                  left: 16.0, right: 16, top: 8, bottom: 8),
                              child: new Text(
                                "NÃO RECEBI O MEU CÓDIGO",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: MainStyle.get(context)
                                        .fontSizeLeadinCancelar,
                                    color: const Color(0xff2BB9B4)),
                              ),
                            )),
                      )
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Container(
                        child: new InkWell(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(20.0)),
                          splashColor: const Color(0xffe6e6e6),
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: new Container(
                            padding: const EdgeInsets.all(12),
                            child: new Text(
                              "CANCELAR",
                              style: new TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: MainStyle.get(context)
                                      .fontSizeLeadinCancelar,
                                  color: Color(0xff707070)),
                            ),
                          ),
                        ),
                        margin: const EdgeInsets.only(bottom: 8),
                      ),
                      new Container(
                        child: new InkWell(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(20.0)),
                          splashColor: const Color(0xffe6e6e6),
                          onTap: () {
                            if (codigo.length == 6) {
                              verificaCodigoEnviado(
                                  controllerCPFesqueci.text, codigo, email);
                            } else {
                              showInputCodigoErro("código");
                            }
                          },
                          child: new Container(
                            padding: const EdgeInsets.all(12),
                            child: new Text(
                              "CONFIRMAR",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MainStyle.get(context)
                                      .fontSizeLeadinCancelar),
                            ),
                          ),
                        ),
                        margin: const EdgeInsets.only(bottom: 8),
                      )
                    ],
                  )
                ],
              ),
            ));
  }

  Future showInputCodigoErro(String text) async {
    return showDialog(
        context: state.context,
        barrierDismissible: false,
        builder: (BuildContext context) => ZAlertDialog(
              zDialog: ZDialog.erro,
              child: new Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.all(12),
                        child: new Text("Erro",
                            style: MainStyle.get(context).styleTittleDialog),
                      )
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          bottom: 10.0,
                        ),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: new Column(
                          children: <Widget>[
                            new Text("Por favor, termine de digitar o $text.",
                                style: new TextStyle(
                                    fontSize:
                                        MainStyle.get(context).fontSizePadrao,
                                    color: Color(0xff707070)),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      )
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        child: new InkWell(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(20.0)),
                          splashColor: const Color(0xffe6e6e6),
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: new Container(
                            padding: const EdgeInsets.all(12),
                            child: new Text(
                              "OK",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MainStyle.get(context)
                                      .fontSizeLeadinCancelar),
                            ),
                          ),
                        ),
                        margin: const EdgeInsets.only(bottom: 8),
                      )
                    ],
                  )
                ],
              ),
            ));
  }

  Future showErroEnviarCod() async {
    return showDialog(
        context: state.context,
        barrierDismissible: false,
        builder: (BuildContext context) => ZAlertDialog(
              zDialog: ZDialog.erro,
              child: new Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.all(12),
                        child: new Text("Erro",
                            style: MainStyle.get(context).styleTittleDialog),
                      )
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                          bottom: 10.0,
                        ),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: new Column(
                          children: <Widget>[
                            new Text("Houve algum erro ao enviar o código",
                                style: new TextStyle(
                                    fontSize:
                                        MainStyle.get(context).fontSizePadrao,
                                    color: Color(0xff707070)),
                                textAlign: TextAlign.center),
                          ],
                        ),
                      )
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        child: new InkWell(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(20.0)),
                          splashColor: const Color(0xffe6e6e6),
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: new Container(
                            padding: const EdgeInsets.all(12),
                            child: new Text(
                              "OK",
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MainStyle.get(context)
                                      .fontSizeLeadinCancelar),
                            ),
                          ),
                        ),
                        margin: const EdgeInsets.only(bottom: 8),
                      )
                    ],
                  )
                ],
              ),
            ));
  }

  void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void verificaCodigoEnviado(String text, String codigo, String email) {}
}
