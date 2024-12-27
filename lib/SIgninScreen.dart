import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxapiss/singupscreen.dart';

import 'losiCtrl.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login GetX'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.emailController.value,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              TextFormField(
                controller: controller.passwordController.value,
                obscureText: true,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(height: 40),
              Obx(() => InkWell(
                onTap: () {
                  controller.loginApi();
                },
                child: controller.loading.value
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
                  height: 45,
                  color: Colors.green,
                  child: const Center(child: Text('Login')),
                ),
              )),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.to(() => const SignUpPage());
                },
                child: const Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
