import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';
import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import 'package:dio/dio.dart' as dio;

class LoginController extends GetxController {
  final loading = false.obs;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();


  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    String status = StorageProvider.read(StorageKey.status);
    log("status : $status");
    if (status == "logged") {
      Get.offAllNamed(Routes.HOME);
    }
  }
    @override
    void onClose() {
      super.onClose();
    }
    Login() async {
      loading(true);
      try {
        FocusScope.of(Get.context!).unfocus();
        formkey.currentState?.save();
        if (formkey.currentState!.validate()) {
          final response = await ApiProvider.instance().post(Endpoint.login,
              data: dio.FormData.fromMap({
                "nama": namaController.text.toString(),
                "username": usernameController.text.toString(),
                "password": passwordController.text.toString(),
                "telp": telpController.text.toString(),
                "alamat": alamatController.text.toString(),
              }));
          if (response.statusCode == 200) {
            await StorageProvider.write(StorageKey.status, "Logged");
            Get.offAllNamed(Routes.HOME);
          } else {
            Get.snackbar(
                "Sorry", "Login Gagal", backgroundColor: Colors.red);
          }
        }
        loading(false);
      } on dio.DioException catch (e) {
        loading(false);
        if (e.response != null) {
          if (e.response?.data != null) {
            Get.snackbar("Sorry", "${e.response?.data['message']}",
                backgroundColor: Colors.orange);
          }
        } else {
          Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
        }
      } catch (e) {
        loading(false);
        Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
      }
    }
  }

