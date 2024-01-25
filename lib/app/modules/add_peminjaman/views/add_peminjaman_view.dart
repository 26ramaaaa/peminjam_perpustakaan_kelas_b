import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pinjam Buku ${Get.parameters['judul'].toString()}'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: controller.tanggalPinjamController,
            decoration: InputDecoration(hintText: "Masukan Tanggal Peminjaman"),
            validator: (value) {
              if (value!.length < 5) {
                return "tanggal peminjaman tidak boleh kosong";
              }
              return null;
            },
          ),
          TextFormField(
            controller: controller.tanggalKembaliController,
            decoration: InputDecoration(hintText: "Masukan Tanggal Kembali"),
            validator: (value) {
              if (value!.length < 5) {
                return "tanggal kembali tidak boleh kosong";
              }
              return null;
            },
          ),
          Obx(() => controller.loading.value?
          CircularProgressIndicator():
          ElevatedButton(onPressed: () {
            controller.tanggalPinjamController;
          }, child: Text("Pinjam"))
          )
        ],
      ),
    );
  }
}
