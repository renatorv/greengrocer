import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> signIn({required String email, required String pass}) async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 3));

    isLoading.value = false;
  }
}
