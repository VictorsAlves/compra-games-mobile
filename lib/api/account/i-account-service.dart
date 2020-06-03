import 'package:compra_games/presenter/view-model/login-viewmodel.dart';
abstract class IAccountService {
  Future<LoginViewModel> login(LoginViewModel login);

  Future<String> buscarUserId(LoginViewModel login);

  Future<bool> verificarUsuario(LoginViewModel login);
}
