import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/repository/auth_repository.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final _authRepository = AuthRepository();

  Future<void> signIn({required String email, required String pass}) async {
    isLoading.value = true;

    await _authRepository.signIn(email: email, password: pass);

    isLoading.value = false;
  }
}
