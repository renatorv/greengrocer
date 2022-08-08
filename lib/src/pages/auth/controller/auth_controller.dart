import 'package:get/get.dart';
import 'package:greengrocer/src/constants/storage_keys.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_repository.dart';
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/services/utils_services.dart';

import '../../../pages_route/app_pages.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final _authRepository = AuthRepository();

  final _utilsServices = UtilsServices();

  UserModel user = UserModel();

  Future<void> validateToken() async {
    // Recuperar o token que foi salvo localmente
    String? token = await _utilsServices.getLocalData(key: StorageKeys.token);

    if (token == null) {
      // não autenticado
      Get.offAllNamed(PagesRoutes.signInRoute);
      return; // com esse return garante-se que nada mais para baixo seja executado
    }

    AuthResult result = await _authRepository.validateToken(token);

    result.when(
      success: (user) {
        this.user = user;

        saveTokenAndPriceedToBase();
      },
      error: (msg) {
        signOut();
      },
    );
  }

  Future<void> signOut() async {
    // zerar user
    user = UserModel();

    // Remover o token localmente
    await _utilsServices.removeLocalData(key: StorageKeys.token);

    // ir para o login
    Get.offAllNamed(PagesRoutes.signInRoute);
  }

  void saveTokenAndPriceedToBase() {
    // salvar o token
    _utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);

    // ir para base
    Get.offAllNamed(PagesRoutes.baseRoute);
  }

  Future<void> signIn({required String email, required String pass}) async {
    isLoading.value = true;

    AuthResult result =
        await _authRepository.signIn(email: email, password: pass);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;

        saveTokenAndPriceedToBase();
      },
      error: (msg) {
        _utilsServices.showToast(
          message: msg,
          isError: true,
        );
      },
    );
  }
}
