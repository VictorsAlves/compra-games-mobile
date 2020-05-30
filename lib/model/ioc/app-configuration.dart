import 'package:compra_games/api/account/account-service.dart';
import 'package:compra_games/api/account/i-account-service.dart';
import 'package:compra_games/settings/app-settings.dart';
import 'package:z_components/components/z-injector/z-injector.dart';
import 'package:z_components/infra/db/database.dart';


class AppConfiguration {
  static Future init() async {
    var db = new ZDatabase(
        dbName: AppSettings.DB_NAME,
        version: AppSettings.DB_VERSION,
        entities: [

        ]);

    try {
      await db.init();

      //banco repository
     // ZInjector.registerDependency<ISolicitacaoRepository>(
       //   new SolicitacaoRepository());



      // services

      ZInjector.registerDependency<IAccountService>(new AccountService());

    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
