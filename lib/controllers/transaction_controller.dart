import 'package:flutter/material.dart';
import 'package:flutter_sqflite/db/db_helpert.dart';
import 'package:flutter_sqflite/models/transaction_model.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  var dbHelper = DbHelper();
  var transactions = <TransactionModel>[].obs;
  var income = 0.obs;
  var outcome = 0.obs;
  var balance = 0.obs;
  TextEditingController namaController = TextEditingController();
  TextEditingController totalController = TextEditingController(text: "0");

  @override
  void onInit() async {
    await dbHelper.database();
    fetchTransactions();
    getBalanceAccount();
    super.onInit();
  }

  void getBalanceAccount() {
    getIncome();
    getOutcome();
    getBalance();
  }

  void fetchTransactions() async {
    var result = await dbHelper.getAll();
    transactions.value = result;
  }

  void getIncome() async {
    var result = await dbHelper.totalPemasukan();
    income.value = result;
  }

  void getOutcome() async {
    var result = await dbHelper.totalPengeluaran();
    outcome.value = result;
  }

  void getBalance() async {
    var result = await dbHelper.totalSaldo();
    balance.value = result;
  }

  void addTransaction(Map<String, dynamic> row) async {
    await dbHelper.insert(row);
    fetchTransactions();
  }

  void deleteTransaction(int idTransaction) {
    dbHelper.hapus(idTransaction);
    fetchTransactions();
  }

  void updateTransaction(int idTransaction, Map<String, dynamic> row) {}
}
