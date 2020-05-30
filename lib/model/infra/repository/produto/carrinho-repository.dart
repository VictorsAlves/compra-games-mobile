import 'package:compra_games/model/infra/entity/carrinho-entity.dart';
import 'package:compra_games/model/infra/repository/produto/i-carrinho-repository.dart';
import 'package:z_components/infra/abstract-repository.dart';


class ProdutoRepository
    extends AbstractRepository<ProdutoEntity>
    implements IProdutoRepository {

  @override
  Future<bool> buscar(String idOrdemServico) async {
    try {
      var res = await db.queryFirstAsync(
          "SELECT * FROM SOLICITACAOORDEMSERVICO WHERE IDORDEMSERVICO = ?",
          arguments: [idOrdemServico]);
      if (res != null) {
        return true;
      }
      return false;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<ProdutoEntity> findById(int id) {
    // TODO: implement findById
    return null;
  }

  @override
  Future<ProdutoEntity> findLast() {
    // TODO: implement findLast
    return null;
  }
}
