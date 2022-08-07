import 'package:get/get.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_repository.dart';
import 'package:greengrocer/src/pages/auth/result/auth_result.dart';
import 'package:greengrocer/src/pages_route/app_pages.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final _authRepository = AuthRepository();

  final _utilsServices = UtilsServices();

  UserModel user = UserModel();

  Future<void> validateToken() async {
    // _authRepository.validateToken(token);
  }

  Future<void> signIn({required String email, required String pass}) async {
    isLoading.value = true;

    AuthResult result =
        await _authRepository.signIn(email: email, password: pass);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;

        Get.offAllNamed(PagesRoutes.baseRoute);
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
