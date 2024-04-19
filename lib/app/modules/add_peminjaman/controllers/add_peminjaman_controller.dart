import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/constan/endpoin.dart';
import '../../../data/model/response_book.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class AddPeminjamanController extends GetxController with StateMixin<List<DataBook>>{
  //TODO: Implement AddPeminjamanController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController tgl_pinjamController = TextEditingController();
  final TextEditingController tgl_pengembalianController = TextEditingController();
  final loading = false.obs;


  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  AddUser() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.pinjam,
            data: {
              "user_id": StorageProvider.read(StorageKey.iduser),
              "book_id": Get.parameters['id'],
              "tanggal_pinjam": tgl_pinjamController.text.toString(),
              "tanggal_kembali": tgl_pengembalianController.text.toString(),

            });

        if (response.statusCode == 201) {
          Get.back();
        } else {
          Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null)
          Get.snackbar("sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
      } else {
        Get.snackbar("sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("error", e.toString(), backgroundColor: Colors.red);
    }
  }

  getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.book,
      );
      if (response.statusCode == 200) {
        final ResponseBook responseBook = ResponseBook.fromJson(response.data);
        if (responseBook.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responseBook.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null)
          change(
              null, status: RxStatus.error("${e.response?.data['message']}"));
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
