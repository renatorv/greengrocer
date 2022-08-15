import 'package:greengrocer/src/constants/endpoints.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();
  Future<HomeResult<ItemModel>> getAllProducts(
      Map<String, dynamic> body) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getAllProducts,
      method: HttpMethods.post,
      body: body,
    );

    if (result['result'] != null) {
      List<ItemModel> data = List<Map<String, dynamic>>.from(result['result'])
          .map(ItemModel.fromMap)
          .toList();
      return HomeResult.success(data);
    } else {
      return HomeResult.error('Ocorreu um erro ao recuperar os itens.');
    }
  }

  //
  // Recupera todas as categorias
  Future<HomeResult<CategoryModel>> getAllCategories() async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getAllCategories,
      method: HttpMethods.post,
    );

    // se for != de null, significa que na chave result contem algo, no caso
    // uma lista de categorias
    if (result['result'] != null) {
      //Lista
      List<CategoryModel> data =
          (List<Map<String, dynamic>>.from(result['result']))
              .map(CategoryModel.fromMap)
              .toList(); // aula 92
      return HomeResult<CategoryModel>.success(data);
    } else {
      // Erro
      return HomeResult.error('Ocorreu um erro ao recuperar as categorias.');
    }
  }
}
