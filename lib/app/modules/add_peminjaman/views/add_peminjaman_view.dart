import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:peminjam_perpustakaan_c/app/data/model/response_book.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        'assets/book1.png',
                        width: 250,
                        height: 250,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: Colors.blue[500],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sinopsis :',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              // Sinopsis buku ditempatkan di samping gambar buku
                              ' ${Get.parameters['sinopsis'].toString()}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue[500],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Judul               : ${Get.parameters['judul'].toString()}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Penulis            : ${Get.parameters['penulis'].toString()}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Penerbit          : ${Get.parameters['penerbit'].toString()}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Tahun Terbit   : ${Get.parameters['tahun_terbit'].toString()}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  // Tanggal Pinjam
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: DateTimeField(
                      format: DateFormat("yyyy-MM-dd"),
                      controller: controller.tgl_pinjamController,
                      decoration: InputDecoration(
                        labelText: "Tanggal Pinjam",
                        border: OutlineInputBorder(),
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/schedule.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                      onShowPicker: (context, currentValue) async {
                        return showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Tanggal Pinjam tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                  ),

                  // Tanggal Pengembalian
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: DateTimeField(
                      format: DateFormat("yyyy-MM-dd"),
                      controller: controller.tgl_pengembalianController,
                      decoration: InputDecoration(
                        labelText: "Tanggal Pengembalian",
                        border: OutlineInputBorder(),
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/schedule.png',
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                      onShowPicker: (context, currentValue) async {
                        return showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Tanggal Pengembalian tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
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