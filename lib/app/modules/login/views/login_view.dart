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
          Container(
          child: Column(
          children: [

            Container(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF61677D),
                    letterSpacing: -0.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(
                    hintText: 'Masukan Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value){
                    if (value!.isEmpty){
                      return 'Username tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [

              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xFF61677D),
                          letterSpacing: -0.2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextFormField(
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          hintText: 'Masukan Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value){
                          if (value!.isEmpty){
                            return 'Password tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
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
        ]
      ),
     ),
    ]
    ),
    ),
    ),
    );
  }
}
