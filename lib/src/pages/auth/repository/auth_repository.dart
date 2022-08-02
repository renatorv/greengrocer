import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signIn({
    required String email,
    required String password,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );

    // se veio o result deu bom, caso contrário aconteceu um erro
    if (result['result'] != null) {
      print('Signin funcionou');
      print(result['result']);
      //{id: ejFjPEFQ8y, fullname: GreenGrocer, email: greengrocerteste@gmail.com, phone: (99) 99999-9999, cpf: 123.456.789-10, token: r:6e2faea38779e882dbd99a404818c051}

      final user = UserModel.fromMap(result['result']);

      print(user);
    } else {
      print('Signin não funcionou');
      print(result['error']);
    }
  }
}
