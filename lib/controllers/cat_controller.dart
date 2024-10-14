import 'dart:io';

import 'package:brandvilla/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'dart:convert';
import '../models/cat_model.dart';

class CategoriesController extends GetxController {
  var categories = <Data>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      var response = await http.get(
        Uri.parse(
            'https://brandvillab.leadgenadvertisements.com/api/category/v1/categories'),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var categoriesModel = CategoriesModel.fromJson(jsonResponse);
        categories.value = categoriesModel.data ?? [];
      } else {
        // Handle error response
        print("Failed to load categories: ${response.statusCode}");
      }
    } catch (e) {
      // Handle any exceptions
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}

class PosterControl extends GetxController {

  Future<String?> adminLogin(String email, String password) async {
    var url = Uri.parse('https://brandvillab.leadgenadvertisements.com/api/admin/v1/login');
    isLoading(true);
    try {
      // Prepare the body with email and password
      var body = jsonEncode({
        'email': email,
        'password': password,
      });

      // Send the POST request
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      // Check if the request was successful
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Decode the response body
        var responseBody = jsonDecode(response.body);
        print("Login successful: ${responseBody['message']}");
        print("Admin ID: ${responseBody['data']['admin']['id']}");
        print("Admin Email: ${responseBody['data']['admin']['email']}");
        print("Token: ${responseBody['data']['token']}");

        // Return the token
        return responseBody['data']['token'];
      } else {
        // Print the error response if login fails
        print("Failed to login: ${response.statusCode}, Body: ${response.body}");
        return null;
      }
    } catch (e) {
      // Handle any errors during the request
      print("Error during login: $e");
      return null;
    }
  }
  String? selectedCategoryId;
  File? selectedImage;

  // Function to set the selected category
  void setSelectedCategory(String? categoryId) {
    selectedCategoryId = categoryId;
  }
  List<int>? selectedImageBytes;
  // Function to set the selected image
  void setSelectedImageBytes(List<int>? bytes) {
    selectedImageBytes = bytes;
  }
  var isLoading = false.obs;
  // Function to upload poster (categoryId and image are required)
  Future<void> uploadPoster(BuildContext context) async {

    if (selectedCategoryId == null || selectedImageBytes == null) {
      print("Please select a category and an image");
      return;
    }
    String email = "admin@brandvilla.com";
    String password = "admin";

    String? token = await adminLogin(email, password);

    try {
      isLoading(true);

      // Create the multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://brandvillab.leadgenadvertisements.com/api/poster/v1/poster'),
      );

      String? mimeType = lookupMimeType('uploaded_image.jpg', headerBytes: selectedImageBytes);
      if (mimeType == null) {
        print("Could not determine MIME type");
        return;
      }

      // Parse the MIME type into `MediaType`
      List<String> mimeTypeSplit = mimeType.split('/');
      String mimeTypeMain = mimeTypeSplit[0];
      String mimeTypeSub = mimeTypeSplit[1];
      print(mimeTypeSub);
      print(mimeTypeMain);
      print(token);
      // Add the selected category ID
      request.fields['categoryId'] = selectedCategoryId!;
      request.headers['Authorization'] = "Bearer $token";
      request.files.add(http.MultipartFile.fromBytes(
        'image',
        selectedImageBytes!,
        filename: 'uploaded_image.jpg',
        contentType: MediaType(mimeTypeMain, mimeTypeSub),
      ));

      // Send the request and get the response
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Poster uploaded successfully");
        final data = jsonDecode(responseBody);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: AppText(text: data['message'])));
        // Handle the response
      } else {
        final data = jsonDecode(responseBody);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: AppText(text: data['message'])));
        print("Failed to upload poster: ${responseBody}");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}
