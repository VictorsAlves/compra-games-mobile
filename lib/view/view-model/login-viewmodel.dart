class LoginViewModel {
  String email;
  String cpf;
  String password;
  String app;

  LoginViewModel({this.email: "", this.cpf: "", this.password: ""});

  Map toMap() {
    return {
      "cpf": this.cpf,
      "email": this.email,
      "password": this.password,
      "app": this.app
    };
  }
}
