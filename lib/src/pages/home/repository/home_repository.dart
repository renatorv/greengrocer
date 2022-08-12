import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();
  // Recupera todas as categorias
  Future<HomeResult> getAllCategories() async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getAllCategories,
      method: HttpMethods.post,
    );

    // se for != de null, significa que na chave result contem algo, no caso
    // uma lista de categorias
    if (result['result'] != null) {
      //Lista
      List<CategoryModel> data =
          (result['result'] as List<Map<String, dynamic>>)
              .map(CategoryModel.fromMap)
              .toList(); // aula 92
      return HomeResult<CategoryModel>.success(data);
    } else {
      // Erro
      return HomeResult.error(
          'Ocorreu um erro inesperado ao recuperar as categorias.');
    }
  }
}
