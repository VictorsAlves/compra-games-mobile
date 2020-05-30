import 'dart:developer';
import 'package:compra_games/api/account/i-account-service.dart';
import 'package:compra_games/settings/api-settings.dart';
import 'package:compra_games/view/view-model/login-viewmodel.dart';



class AccountService extends Service implements IAccountService {
  static final String _URL_NO_API = "${ApiSettings.ENDPOINT}/Account";

  AccountService() : super();

  @override
  Future<String> buscarUserId(LoginViewModel login) {
    // TODO: implement buscarUserId
    return null;
  }

  @override
  Future<LoginViewModel> login(LoginViewModel login) {
    // TODO: implement login
    return null;
  }

  @override
  Future<bool> verificarUsuario(LoginViewModel login) {
    // TODO: implement verificarUsuario
    return null;
  }


}
