class TipoEquipamentoHierarquicoViewModel {
  String idTipoEquipamento;
  String descricao;
  String idPai;
  int nivel;
  String caminho;
  String idTipoHierarquia;
  String idConta;

  TipoEquipamentoHierarquicoViewModel({
    this.idTipoEquipamento,
    this.descricao,
    this.idPai,
    this.nivel,
    this.caminho,
    this.idTipoHierarquia,
    this.idConta,
  });

  factory TipoEquipamentoHierarquicoViewModel.fromJson(Map<String, dynamic> json) {
    return new TipoEquipamentoHierarquicoViewModel(
      idTipoEquipamento: json['idTipoEquipamento'],
      descricao: json['descricao'],
      idPai: json['idPai'],
      nivel: json['nivel'],
      caminho: json['caminho'],
      idTipoHierarquia: json['idTipoHierarquia'],
      idConta: json['idConta'],
    );
  }

  Map toMap() {
    return {
      "idTipoEquipamento": this.idTipoEquipamento,
      "descricao": this.descricao,
      "idPai": this.idPai,
      "nivel": this.nivel,
      "caminho": this.caminho,
      "idTipoHierarquia": this.idTipoHierarquia,
      "idConta": this.idConta,
    };
  }
}
