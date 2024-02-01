import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/response_getbook.dart';
import '../../../data/model/response_pinjam.dart';
import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeminjamanView'),
        centerTitle: true,
      ),
      body: controller.obx((state) => ListView.separated(
        itemCount: state!.length,
        itemBuilder: (context, index){
          DataBook datapinjam = state[index];
          return ListTile(
            title: Text("${datapinjam.book?.judul}"),
            subtitle: Text(" Kategori buku ${state[index].userId}\n pinjam : ${state[index].tanggalPinjam}\n Kembali : ${state[index].tanggalKembali}"),
            trailing: SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF080ba1),
                ),
                onPressed: (){

                },
                child: Text(
                  ' ${state[index].status}',
                ),
              ),
            )
          );
        }, separatorBuilder: ( context, index) =>Divider(),
      ))
    );
  }
}
