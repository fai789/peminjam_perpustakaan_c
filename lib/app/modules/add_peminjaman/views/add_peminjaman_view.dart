import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C77E9),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 76,
            decoration: BoxDecoration(
              color: Colors.blue[500],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(19.0),
                bottomRight: Radius.circular(19.0),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 60,
                    width: 60,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Intelectual',
                        style: TextStyle(
                          fontFamily: 'Candal',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Nexus Library',
                        style: TextStyle(
                          fontFamily: 'Candal',
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/book1.png', // Replace with your actual path
              width: 250,
              height: 250,
              // Set the width as per your requirement
            ),

          ),
          SizedBox(height: 200),
          Center(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.tgl_pinjamController,
                    decoration:
                    InputDecoration(hintText: "Masukan Tanggal Pinjam"),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Tanggal Pinjam tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.tgl_pengembalianController,
                    decoration: InputDecoration(
                        hintText: "Masukan Tanggal Pengembalian"),
                    validator: (value) {
                      if (value!.length < 2) {
                        return "Tanggal Pengembalian tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  Obx(() => controller.loading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: () {
                      controller.AddUser();
                    },
                    child: Text("Pinjam"),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
