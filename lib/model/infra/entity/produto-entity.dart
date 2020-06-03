import 'package:z_components/infra/db/database-utils.dart';
import 'package:z_components/infra/entities/z-entity.dart';
import 'package:z_components/infra/schema/z-column.dart';
import 'package:z_components/infra/schema/z-table.dart';

class ProdutoEntity extends ZEntity {
  String idTipoProblema;
  String idTipo;
  String idProblema;

  ProdutoEntity(
      {this.idTipoProblema,
        this.idTipo,
        this.idProblema,
        int id,
        String idConta})
      : super(id: id, idConta: idConta);

  @override
  void buildTable() {
    setTableName();
    this.table = new ZTable(version: 1, columns: [
      new ZColumn(
          version: 1,
          name: "ID",
          type: DatabaseUtils.INTEGER,
          primaryKey: true,
          autoIncrement: true,
          notNull: true),
      new ZColumn(version: 1, name: "IDCONTA", type: DatabaseUtils.TEXT),
      new ZColumn(version: 1, name: "IDTIPOPROBLEMA", type: DatabaseUtils.TEXT),
      new ZColumn(version: 1, name: "IDTIPO", type: DatabaseUtils.TEXT),
      new ZColumn(version: 1, name: "IDPROBLEMA", type: DatabaseUtils.TEXT),
    ]);
  }

  @override
  ZEntity fromMap(Map<String, dynamic> map) {
    this.id = map["ID"];
    this.idConta = map["IDCONTA"];
    this.idTipoProblema = map["IDTIPOPROBLEMA"];
    this.idTipo = map["IDTIPO"];
    this.idProblema = map["IDPROBLEMA"];


    return this;
  }

  @override
  void setTableName() {
    tableName = "TIPOPROBLEMA";
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "ID": this.id,
      "IDCONTA": this.idConta,
      "IDTIPOPROBLEMA": this.idTipoProblema,
      "IDTIPO": this.idTipo,
      "IDPROBLEMA": this.idProblema,
    };
  }
}
