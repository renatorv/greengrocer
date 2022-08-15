import 'package:get/get.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/pages/home/repository/home_repository.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/utils_services.dart';

const int itemsPerPage = 6;

class HomeController extends GetxController {
  final _homeRepository = HomeRepository();
  final utilsServices = UtilsServices();

  bool isLoading = false;

  List<CategoryModel> allCategories = [];
  CategoryModel? currentCategory;

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();

    getAllCategories();
  }

  void selectCategory(CategoryModel category) {
    currentCategory = category;
    update();
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    setLoading(true);

    //
    Map<String, dynamic> body = {
      'page': currentCategory!.pagination, // 97
      'categoryId': currentCategory!.id,
      'itemsPerPage': itemsPerPage
    };

    HomeResult<ItemModel> homeResult =
        await _homeRepository.getAllProducts(body);
    setLoading(false);

    homeResult.when(
      success: (data) {
        //
        print(data);
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  Future<void> getAllCategories() async {
    setLoading(true);
    HomeResult<CategoryModel> homeResult =
        await _homeRepository.getAllCategories();
    setLoading(false);

    homeResult.when(
      success: (data) {
        allCategories.assignAll(data);

        // Validação caso a lista venha vazia
        if (allCategories.isEmpty) return;

        selectCategory(allCategories.first);

        // print('Todas as categorias: $allCategories');
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
