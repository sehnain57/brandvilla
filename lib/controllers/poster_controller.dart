import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/poster_model.dart';

class PostersController extends GetxController {
  var isLoading = true.obs; // For shimmer loading
  var postersList = <Data>[].obs; // For storing posters

  @override
  void onInit() {
    fetchPosters();
    super.onInit();
  }

  void fetchPosters() async {
    try {
      isLoading(true); // Show loading indicator
      var response = await http.get(
        Uri.parse('https://brandvillab.leadgenadvertisements.com/api/category/v1/categories'),
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        PostersModel postersModel = PostersModel.fromJson(jsonData);
        if (postersModel.success == true) {
          postersList.assignAll(postersModel.data!);
        }
      } else {
        var jsonData = json.decode(response.body);
        print(jsonData);
        Get.snackbar("Error", "Failed to load posters");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false); // Hide loading indicator
    }
  }
}
