class TokenViewModel {
  String token;
  String idUser;
  String idColaborador;

  TokenViewModel({this.token, this.idUser, this.idColaborador});

  factory TokenViewModel.fromJson(Map<String, dynamic> json) {
    return new TokenViewModel(
        token: json["token"],
        idUser: json["idUser"],
        idColaborador: json["idColaborador"]);
  }
}
