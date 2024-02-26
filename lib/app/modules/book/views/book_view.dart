import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/response_book.dart';
import '../../../routes/app_pages.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C77E9),
      body: Column(
        children: [
          // Bagian atas halaman dengan logo dan tulisan
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
          // Bagian tengah halaman dengan daftar buku
          SizedBox(height: 70),
          Expanded(

            child: controller.obx(
                  (state) => ListView.separated(
                itemCount: state!.length,
                    itemBuilder: (context, index) {
                      DataBook dataBook = state[index];
                      return Container(
                        width: 40.0, // Ubah nilai width sesuai kebutuhan
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text("${dataBook.judul}"),
                          subtitle: Text(
                            "Penulis ${dataBook.penulis}\n${dataBook.penerbit} - ${dataBook.tahunTerbit}",
                          ),
                          trailing: ElevatedButton(
                            onPressed: () => Get.toNamed(Routes.ADD_PEMINJAMAN,
                                parameters: {'id': (dataBook.id ?? 0).toString(), 'judul': dataBook.judul ?? '-'}),
                            child: Text("Pinjam"),
                          ),
                        ),
                      );
                    },
                separatorBuilder: (context, index) => Divider(),
              ),
              onLoading: Center(child: CupertinoActivityIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
