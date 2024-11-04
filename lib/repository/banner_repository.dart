
import 'package:dio/dio.dart';
import 'package:saheel_machine_test/model/banner_model.dart';
import 'package:saheel_machine_test/service/api_service.dart';
import 'package:saheel_machine_test/utils/config.dart';


class BannerRepository {
  final ApiService apiService = ApiService();

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final response = await apiService.get(Config.displayBanner);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data; // Assuming the API returns a list
        return data.map((json) => BannerModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load banners');
      }
    } on DioException catch (e) {
      throw Exception('Error fetching banners: ${e.message}');
    }
  }
}
