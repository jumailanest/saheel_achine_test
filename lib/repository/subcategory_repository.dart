import 'package:dio/dio.dart';
import 'package:saheel_machine_test/model/sub_category_model.dart';
import 'package:saheel_machine_test/service/api_service.dart';
import 'package:saheel_machine_test/utils/config.dart';

class SubcategoryRepository {
  final ApiService apiService = ApiService();

  Future<List<SubCategoryModel>> fetchSubCategory() async {
    try {
      final response = await apiService.get(Config.categorySubcategoryView);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data; // Assuming the API returns a list
        return data.map((json) => SubCategoryModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load sub category');
      }
    } on DioException catch (e) {
      throw Exception('Error fetching sub category: ${e.message}');
    }
  }
}
