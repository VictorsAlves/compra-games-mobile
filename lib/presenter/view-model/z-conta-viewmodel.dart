class ZContaViewModel {
  String idConta;
  String cPFOuCNPJ;
  String nome;
  String nomeFantasia;
  String tipoPessoa;
  String dataCriacao;
  String cEP;
  String cidade;
  String endereco;
  int numero;
  String bairro;
  String estado;
  String pais;
  String telefone;
  String email;
  String userID;
  String sobrenome;
  String contexto;
  String tipoTenant;

  ZContaViewModel(
      {this.idConta,
      this.cPFOuCNPJ,
      this.nome,
      this.nomeFantasia,
      this.tipoPessoa,
      this.dataCriacao,
      this.cEP,
      this.cidade,
      this.endereco,
      this.numero,
      this.bairro,
      this.estado,
      this.pais,
      this.telefone,
      this.email,
      this.userID,
      this.sobrenome,
      this.contexto,
      this.tipoTenant});

  factory ZContaViewModel.fromJson(Map<String, dynamic> json) {
    return new ZContaViewModel(
        idConta: json["idConta"],
        cPFOuCNPJ: json["cpfOucnpj"],
        nome: json["nome"],
        nomeFantasia: json["nomeFantasia"],
        tipoPessoa: json["tipoPessoa"],
        dataCriacao: json["dataCriacao"],
        cEP: json["cep"],
        cidade: json["cidade"],
        endereco: json["endereco"],
        numero: json["numero"],
        bairro: json["bairro"],
        estado: json["estado"],
        pais: json["pais"],
        telefone: json["telefone"],
        email: json["email"],
        userID: json["userId"],
        sobrenome: json["sobrenome"],
        contexto: json["contexto"],
        tipoTenant: json["tipoTenant"]);
  }
}
