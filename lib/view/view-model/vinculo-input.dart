class VinculoInput {
  String idAnexo;
  bool isPrevia;
  String idAnexoOriginal;

  VinculoInput({this.idAnexo, this.isPrevia: false, this.idAnexoOriginal});

  factory VinculoInput.fromJson(Map<String, dynamic> json) {
    return new VinculoInput(
        idAnexo: json['idAnexo'],
        idAnexoOriginal: json['idAnexoOriginal'],
        isPrevia: json['isPrevia']);
  }

  Map toMap() {
    return {
      "idAnexoOriginal": this.idAnexoOriginal,
      "isPrevia": this.isPrevia,
      "idAnexo": this.idAnexo,
    };
  }
}
