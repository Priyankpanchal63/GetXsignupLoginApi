import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class SignUpController extends GetxController {
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool loading = false.obs;

  void signUpApi() async {
    loading.value = true;
    try {
      final response = await post(Uri.parse('https://reqres.in/api/register'), body: {
        "name": nameController.value.text.toString(),
        "email": emailController.value.text.toString(),
        "password": passwordController.value.text.toString(),
      });

      var data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        loading.value = false;
        Get.snackbar('SignUp', 'Registration successful');
      } else {
        loading.value = false;
        Get.snackbar('SignUp', data['error']);
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }
}
