class SolicitacaoInput {
  String idAmbiente;
  String idTipoProblema;
  String idTipoEquipamento;
  String idCanal;
  String texto;
  String idConta;
  String titulo;

  SolicitacaoInput({
    this.idAmbiente,
    this.idTipoProblema,
    this.idTipoEquipamento,
    this.idCanal,
    this.texto,
    this.idConta,
    this.titulo
  });

  factory SolicitacaoInput.fromJson(Map<String, dynamic> json) {
    return new SolicitacaoInput(
        idAmbiente: json['idAmbiente'],
        idTipoProblema: json['idTipoProblema'],
        idTipoEquipamento: json['idTipoEquipamento'],
        idCanal: json['idCanal'],
        texto: json['texto'],
        idConta: json['idConta'],
        titulo: json['titulo']
    );
  }

  Map toMap() {
    return {
      "idAmbiente": this.idAmbiente,
      "idTipoProblema": this.idTipoProblema,
      "idTipoEquipamento": this.idTipoEquipamento,
      "idCanal": this.idCanal,
      "texto": this.texto,
      "idConta": this.idConta,
      "titulo": this.titulo
    };
  }
}
