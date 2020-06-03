import 'package:compra_games/api/account/account-service.dart';
import 'package:compra_games/api/account/i-account-service.dart';
import 'package:compra_games/api/settings/app-settings.dart';
import 'package:compra_games/model/infra/entity/produto-entity.dart';
import 'package:compra_games/model/infra/repository/produto/i-prdutor-repository.dart';
import 'package:compra_games/model/infra/repository/produto/produto-repository.dart';
import 'package:z_components/components/z-injector/z-injector.dart';
import 'package:z_components/infra/db/database.dart';


class AppConfiguration {
  static Future init() async {
    var db = new ZDatabase(
        dbName: AppSettings.DB_NAME,
        version: AppSettings.DB_VERSION,
        entities: [
    ProdutoEntity(),
        ]);

    try {
      await db.init();

      //banco repository
     ZInjector.registerDependency<IProdutoRepository>(
          new ProdutoRepository());



      // services

      ZInjector.registerDependency<IAccountService>(new AccountService());

    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
