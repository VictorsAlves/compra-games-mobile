import 'package:compra_games/model/infra/entity/produto-entity.dart';
import 'package:z_components/infra/interfaces/i-command.dart';
import 'package:z_components/infra/interfaces/i-query.dart';

abstract class IProdutoRepository
    implements
        ICommand<ProdutoEntity>,
        IQuery<ProdutoEntity> {


  Future<bool> buscar(String id);
}
