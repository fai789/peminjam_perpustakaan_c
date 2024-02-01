import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('${Get.parameters['judul']}'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
            key: controller.formKey,
            child: Column(children: [
              TextFormField(
                  controller: controller.tgl_pinjamController,
                  decoration: InputDecoration(hintText: "Masukan Tanggal Pinjam"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Username tidak boleh kosong";
                    }
                    return null;
                  }),
              TextFormField(
                  controller: controller.tgl_pengembalianController,
                  decoration: InputDecoration(hintText: "Masukan Tanggal Pengembalian"),
                  validator: (value) {
                    if (value!.length < 2) {
                      return "Password tidak boleh kosong";
                    }
                    return null;
                  }),

              Obx(() => controller.loading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                  onPressed: () {
                    controller.AddUser();
                  },
                  child: Text("Pinjam")))
            ])),
      ),
    );
  }
}
