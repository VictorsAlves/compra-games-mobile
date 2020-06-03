class TokenInput {
  String idUsuario;
  String app;
  String token;

  TokenInput({this.token, this.idUsuario, this.app});

  Map toMap(){
    return {
      "token": this.token,
      "idUsuario": this.idUsuario,
      "app": this.app
    };
  }
}
