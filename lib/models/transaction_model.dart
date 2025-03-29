class TransactionModel {
  /*
  tipe
  1 -> pemasukan
  2 -> pengeluaran
  */
  int? id, type, total;
  String? nama, createdAt, updatedAt;

  TransactionModel(
      {this.id,
      this.type,
      this.total,
      this.nama,
      this.createdAt,
      this.updatedAt});

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
        id: json['id'],
        type: json['type'],
        total: json['total'],
        nama: json['nama'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }
}
