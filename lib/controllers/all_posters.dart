import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/all_posters.dart';
import 'cat_controller.dart';

class PostersController extends GetxController {
  var isLoading = true.obs;
  var postersList = <Data>[].obs;

  @override
  void onInit() {
    fetchPosters();
    super.onInit();
  }

  Future<void> fetchPosters() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(
          'https://brandvillab.leadgenadvertisements.com/api/poster/v1/posters'));

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = json.decode(response.body);
        AllPosters posters = AllPosters.fromJson(result);
        postersList.assignAll(posters.data!);
      } else {
        Get.snackbar('Error', 'Failed to load posters');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    } finally {
      isLoading(false);
    }
  }

  PosterControl posterControl = Get.put(PosterControl());

  Future<void> deletePoster(String id) async {
    try {
      String email = "admin@brandvilla.com";
      String password = "admin";

      String? token = await posterControl.adminLogin(email, password);
      final response = await http.delete(
          Uri.parse(
              'https://brandvillab.leadgenadvertisements.com/api/poster/v1/poster/$id'),
          headers: {"Authorization": "Bearer $token"});

      if (response.statusCode == 200 || response.statusCode == 201) {
        postersList.removeWhere((poster) => poster.id == id);
        Get.snackbar('Success', 'Poster deleted');
      } else {
        Get.snackbar('Error', 'Failed to delete poster');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred');
    }
  }
}
