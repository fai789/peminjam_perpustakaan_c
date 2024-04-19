import 'dart:html';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_c/app/data/provider/storage_provider.dart';
import 'package:peminjam_perpustakaan_c/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

  }

  @override
  void onClose() {
    super.onClose();
  }
  void logout() async {
    StorageProvider.delete(StorageKey.status);
    StorageProvider.delete(StorageKey.iduser);
    Get.offAndToNamed(Routes.LOGIN);
}

  void increment() => count.value++;
}
