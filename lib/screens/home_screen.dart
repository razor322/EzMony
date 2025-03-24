// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_sqflite/db/db_helpert.dart';
import 'package:flutter_sqflite/models/transaction_model.dart';
import 'package:flutter_sqflite/screens/update_screen.dart';
import 'package:flutter_sqflite/utils/string_exrension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  DbHelper? dbHelper;

  void initState() {
    dbHelper = DbHelper();
    initDatabase();
    super.initState();
  }

  Future initDatabase() async {
    await dbHelper!.database();
    setState(() {});
  }

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
              setState(() {});
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
                Navigator.pushNamed(context, '/create').then((value) {
                  setState(() {});
                });
              },
              color: Colors.white,
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: FutureBuilder(
                    future: dbHelper!.totalPemasukan(),
                    builder: (context, snp) {
                      if (snp.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        if (snp.hasData) {
                          return Text(
                              "Total Pemasukan :${snp.data!.toRupiah()}");
                        }
                        return Text("Total Pemasukan : Rp. 0 ");
                      }
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: FutureBuilder(
                    future: dbHelper!.totalPengeluaran(),
                    builder: (context, snp) {
                      if (snp.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        if (snp.hasData) {
                          return Text(
                              "Total Pengeluaran : ${snp.data!.toRupiah()}");
                        }
                        return Text("Total Pengeluaran : Rp. 0");
                      }
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: FutureBuilder(
                    future: dbHelper!.totalSaldo(),
                    builder: (context, snp) {
                      if (snp.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        if (snp.hasData) {
                          return Text("Total Saldo : ${snp.data!.toRupiah()}");
                        }
                        return Text("Total Saldo : Rp. 0");
                      }
                    }),
              ),
              SizedBox(
                height: 30,
              ),
              FutureBuilder<List<TransaksiModel>>(
                  future: dbHelper!.getAll(),
                  builder: (context, snp) {
                    if (snp.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snp.hasData) {
                        return Expanded(
                          child: ListView.builder(
                              itemCount: snp.data!.length,
                              itemBuilder: (context, index) {
                                final data = snp.data![index];
                                return ListTile(
                                  leading: data.type == 1
                                      ? Icon(
                                          Icons.download,
                                          color: Colors.green,
                                          size: 30,
                                        )
                                      : Icon(
                                          Icons.upload,
                                          color: Colors.red,
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
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return UpdateScreen(
                                                transaksiModel: data);
                                          })).then((value) {
                                            setState(() {});
                                          });
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
                              }),
                        );
                      } else {
                        return Center(
                          child: Text(
                            "Tidak ada data",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        );
                      }
                    }
                  }),
            ],
          ),
        ));
  }
}
