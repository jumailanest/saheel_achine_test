import 'package:dio/dio.dart';
import 'package:saheel_machine_test/model/search_model.dart';
import 'package:saheel_machine_test/service/api_service.dart';
import 'package:saheel_machine_test/utils/config.dart';

class SearchRepository {
  final ApiService apiService = ApiService();

  Future<SearchModel> fetchSearch(String query) async {
    try {
      final response = await apiService.get(Config.searchFilter,queryParameters: {
        "name":query,
      });
      if (response.statusCode == 200) {
        final data = response.data; // Assuming the API returns a list
        return SearchModel.fromJson(data);
      } else {
        throw Exception('Failed to load banners');
      }
    } on DioException catch (e) {
      throw Exception('Error fetching banners: ${e.message}');
    }
  }
}
