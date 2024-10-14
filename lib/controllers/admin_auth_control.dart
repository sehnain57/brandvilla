import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../constants/app_text.dart';

class AdminAuthController extends GetxController {
  var adminToken = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadAdminToken();
  }

  void _loadAdminToken() async {
    final prefs = await SharedPreferences.getInstance();
    adminToken.value = prefs.getString('adminToken') ?? '';
  }

  addToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("adminToken", token);
    prefs.setBool("adminTokenDone", true);
  }

  RxBool isLoading = false.obs;

  Future<String?> adminLogin(
      String email, String password, BuildContext context) async {
    var url = Uri.parse(
        'https://brandvillab.leadgenadvertisements.com/api/admin/v1/login');
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

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: AppText(text: responseBody['message'])));
        addToken(responseBody['data']['token'].toString());
        Get.toNamed("/admin");

        return responseBody['data']['token'];
      } else {
        final data = jsonDecode(response.body);

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: AppText(text: data['message'])));

        // Print the error response if log
        // in fails
        print(
            "Failed to login: ${response.statusCode}, Body: ${response.body}");
        return null;
      }
    } catch (e) {
      // Handle any errors during the request
      print("Error during login: $e");
      return null;
    } finally {
      isLoading(false);
    }
  }
}
