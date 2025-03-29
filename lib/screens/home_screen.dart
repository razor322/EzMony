// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_sqflite/controllers/transaction_controller.dart';
import 'package:flutter_sqflite/db/db_helpert.dart';
import 'package:flutter_sqflite/models/transaction_model.dart';
import 'package:flutter_sqflite/routes/app_routes.dart';
import 'package:flutter_sqflite/screens/update_screen.dart';
import 'package:flutter_sqflite/styles/app_sizes.dart';
import 'package:flutter_sqflite/utils/extensions/double.extension.dart';
import 'package:flutter_sqflite/utils/extensions/string_exrension.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.put(TransactionController());
  DbHelper? dbHelper;

  // void initState() {
  //   dbHelper = DbHelper();
  //   initDatabase();
  //   super.initState();
  // }

  // Future initDatabase() async {
  //   await dbHelper!.database();
  //   setState(() {});
  // }

  showAlertDialog(BuildContext context, int idTransaction) {
    AlertDialog alert = AlertDialog(
      title: Text(
        "Peringatan",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
      content: Text(
        "Anda yakin ingin mengapus data transaksi ini?",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16),
      ),
      actions: [
        Center(
          child: TextButton(
            onPressed: () {
              dbHelper!.hapus(idTransaction);
              Navigator.pop(context);
              // setState(() {});
            },
            child: Text(
              "Yakin",
              style: TextStyle(color: Colors.black),
            ),
          ),
        )
      ],
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text(
            "Home EzMony",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Get.toNamed(AppRoutes.create);
                // Navigator.pushNamed(context, '/create').then((value) {});
              },
              color: Colors.white,
            )
          ],
        ),
        body: _buildBody());
  }

  Widget _buildBody() => _buildContent();

  Widget _buildContent() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSizes.s30.toVerticalSpace(),
          Obx(() {
            return Column(
              children: [
                Center(
                  child: Text(
                    "Total Pemasukan : ${controller.income.value.toRupiah()}",
                  ),
                ),
                AppSizes.s10.toVerticalSpace(),
                Center(
                  child: Text(
                    "Total Pengeluaran : ${controller.outcome.value.toRupiah()}",
                  ),
                ),
                AppSizes.s10.toVerticalSpace(),
                Center(
                  child: Text(
                    "Total Saldo : ${controller.balance.value.toRupiah()}",
                  ),
                ),
              ],
            );
          }),

          AppSizes.s30.toVerticalSpace(),

          Expanded(child: Obx(() {
            if (controller.transactions.isEmpty) {
              return Center(
                child: Text("Belum ada transaksi"),
              );
            } else {
              return ListView.separated(
                  separatorBuilder: (context, index) =>
                      AppSizes.s10.toVerticalSpace(),
                  itemCount: controller.transactions.length,
                  itemBuilder: (context, index) {
                    final data = controller.transactions[index];
                    return ListTile(
                      leading: Icon(
                        data.type == 1 ? Icons.download : Icons.upload,
                        color: data.type == 1 ? Colors.green : Colors.red,
                        size: 30,
                      ),
                      title: Text(data.nama!),
                      subtitle: Text(
                        data.total!.toRupiah(),
                      ),
                      trailing: Wrap(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Navigator.of(context).push(
                              //     MaterialPageRoute(
                              //         builder: (context) {
                              //   return UpdateScreen(
                              //       transaksiModel: data);
                              // })).then((value) {
                              //   setState(() {});
                              // });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () {
                              showAlertDialog(context, data.id!);
                            },
                          ),
                        ],
                      ),
                    );
                  });
            }
          }))

          // FutureBuilder<List<TransactionModel>>(
          //     future: dbHelper!.getAll(),
          //     builder: (context, snp) {
          //       if (snp.connectionState == ConnectionState.waiting) {
          //         return Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       } else {
          //         if (snp.hasData) {
          //           return Expanded(
          //             child: ListView.builder(
          //                 itemCount: snp.data!.length,
          //                 itemBuilder: (context, index) {
          //                   final data = snp.data![index];
          //                   return ListTile(
          //                     leading: data.type == 1
          //                         ? Icon(
          //                             Icons.download,
          //                             color: Colors.green,
          //                             size: 30,
          //                           )
          //                         : Icon(
          //                             Icons.upload,
          //                             color: Colors.red,
          //                             size: 30,
          //                           ),
          //                     title: Text(data.nama!),
          //                     subtitle: Text(
          //                       data.total!.toRupiah(),
          //                     ),
          //                     trailing: Wrap(
          //                       children: [
          //                         IconButton(
          //                           icon: Icon(Icons.edit),
          //                           onPressed: () {
          //                             // Navigator.of(context).push(
          //                             //     MaterialPageRoute(
          //                             //         builder: (context) {
          //                             //   return UpdateScreen(
          //                             //       transaksiModel: data);
          //                             // })).then((value) {
          //                             //   setState(() {});
          //                             // });
          //                           },
          //                         ),
          //                         IconButton(
          //                           icon: Icon(Icons.delete),
          //                           color: Colors.red,
          //                           onPressed: () {
          //                             showAlertDialog(context, data.id!);
          //                           },
          //                         ),
          //                       ],
          //                     ),
          //                   );
          //                 }),
          //           );
          //         } else {
          //           return Center(
          //             child: Text(
          //               "Tidak ada data",
          //               style: TextStyle(
          //                   color: Colors.black,
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w500),
          //             ),
          //           );
          //         }
          //       }
          //     }),
        ],
      ),
    );
  }
}
