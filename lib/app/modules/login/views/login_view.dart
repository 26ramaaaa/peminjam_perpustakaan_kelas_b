import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: controller.formkey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(hintText: "Masukan Username"),
                validator: (value) {
                  if (value!.length < 5) {
                    return "username tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(hintText: "Masukan Password"),
                validator: (value) {
                  if (value!.length < 5) {
                    return "password tidak boleh kosong";
                  }
                  return null;
                },
              ),
              Obx(() => controller.loading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        controller.Login();
                        },
                      child: const Text("Login"))),
              ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.REGISTER),
                  child: const Text("Daftar"))
            ],
          ),
        ),
      ),
    );
  }
}
