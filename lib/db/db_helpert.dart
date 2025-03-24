import 'dart:io';
import 'package:flutter_sqflite/models/transaction_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DbHelper {
  final String _dbName = 'ezmony.db';
  final int _dbVersion = 2;

  // Atribut di Model Transaksi
  final String namaTabel = 'transaksi';
  final String id = 'id';
  final String type = 'type';
  final String total = 'total';
  final String nama = 'nama';
  final String createdAt = 'created_at';
  final String updatedAt = 'updated_at';

  static Database? _database;

  Future<Database?> database() async {
    if (_database != null) return _database;
    try {
      _database = await initDatabase();
      print("Database initialized: $_database");
    } catch (e) {
      print("Error initializing database: $e");
    }
    return _database;
  }

  Future<Database> initDatabase() async {
    try {
      Directory databaseDirectory = await getApplicationDocumentsDirectory();
      String path = join(databaseDirectory.path, _dbName);
      print("Database path: $path");
      return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
    } catch (e) {
      print("Error opening database: $e");
      rethrow;
    }
  }

  Future _onCreate(Database db, int version) async {
    try {
      await db.execute(
          'CREATE TABLE $namaTabel ($id INTEGER PRIMARY KEY, $nama TEXT NULL, $type INTEGER, $total INTEGER, $createdAt TEXT NULL, $updatedAt TEXT NULL)');
    } catch (e) {
      print("Error creating table: $e");
    }
  }

  Future<List<TransaksiModel>> getAll() async {
    try {
      if (_database == null) {
        await database();
      }
      final data = await _database!.query(namaTabel);
      List<TransaksiModel> result =
          data.map((e) => TransaksiModel.fromJson(e)).toList();
      return result;
    } catch (e) {
      print("Error fetching data: $e");
      return [];
    }
  }

  Future<int> insert(Map<String, dynamic> row) async {
    try {
      if (_database == null) {
        await database();
      }
      final query = await _database!.insert(namaTabel, row);
      return query;
    } catch (e) {
      print("Error inserting data: $e");
      return -1;
    }
  }

  Future<int> totalPemasukan() async {
    try {
      if (_database == null) {
        await database();
      }
      final query = await _database!.rawQuery(
          "SELECT SUM(total) as total FROM $namaTabel WHERE type = 1");
      return int.parse(query.first['total'].toString());
    } catch (e) {
      print("Error calculating total income: $e");
      return 0;
    }
  }

  Future<int> totalPengeluaran() async {
    try {
      if (_database == null) {
        await database();
      }
      final query = await _database!.rawQuery(
          "SELECT SUM(total) as total FROM $namaTabel WHERE type = 2");

      // Periksa apakah nilai total adalah null
      final total = query.first['total'];
      if (total == null) {
        return 0; // Kembalikan 0 jika total adalah null
      }

      return int.parse(total.toString());
    } catch (e) {
      print("Error calculating total expense: $e");
      return 0; // Kembalikan 0 jika terjadi error
    }
  }

  Future<int> totalSaldo() async {
    try {
      if (_database == null) {
        await database();
      }

      // Hitung total pemasukan (type=1)
      final pemasukanQuery = await _database!.rawQuery(
          "SELECT SUM(total) as total FROM $namaTabel WHERE type = 1");
      final totalPemasukan = pemasukanQuery.first['total'] as int? ?? 0;

      // Hitung total pengeluaran (type=2)
      final pengeluaranQuery = await _database!.rawQuery(
          "SELECT SUM(total) as total FROM $namaTabel WHERE type = 2");
      final totalPengeluaran = pengeluaranQuery.first['total'] as int? ?? 0;

      // Hitung saldo (pemasukan - pengeluaran)
      return totalPemasukan - totalPengeluaran;
    } catch (e) {
      print("Error calculating total income: $e");
      return 0;
    }
  }

  Future<int> hapus(idTransaksi) async {
    try {
      if (_database == null) {
        await database();
      }
      final query = await _database!
          .delete(namaTabel, where: '$id = ?', whereArgs: [idTransaksi]);
      return query;
    } catch (e) {
      print("Error deleting data: $e");
      return -1;
    }
  }

  Future<int> update(int idTransaksi, Map<String, dynamic> row) async {
    try {
      if (_database == null) {
        await database();
      }
      final query = await _database!
          .update(namaTabel, row, where: '$id = ?', whereArgs: [idTransaksi]);
      return query;
    } catch (e) {
      print("Error updating data: $e");
      return -1;
    }
  }
}
