import 'package:get/get.dart';
import 'package:greengrocer/src/models/category_model.dart';
import 'package:greengrocer/src/pages/home/repository/home_repository.dart';
import 'package:greengrocer/src/pages/home/result/home_result.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class HomeController extends GetxController {
  final _homeRepository = HomeRepository();
  final utilsServices = UtilsServices();

  bool _isLoading = false;

  List<CategoryModel> allCategories = [];

  void setLoading(bool value) {
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();

    getAllCategories();
  }

  Future<void> getAllCategories() async {
    setLoading(true);
    HomeResult<CategoryModel> homeResult =
        await _homeRepository.getAllCategories();
    setLoading(false);

    homeResult.when(
      success: (data) {
        allCategories.assignAll(data);

        print('Todas as categorias: $allCategories');
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
