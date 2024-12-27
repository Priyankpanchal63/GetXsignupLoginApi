import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxapiss/SIgninScreen.dart';
import 'package:getxapiss/sigupctrl.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up GetX'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.nameController.value,
                decoration: const InputDecoration(hintText: 'Name'),
              ),
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
                  controller.signUpApi();
                  Get.to(LoginScreen());
                },
                child: controller.loading.value
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
                  height: 45,
                  color: Colors.blue,
                  child: const Center(child: Text('Sign Up')),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
