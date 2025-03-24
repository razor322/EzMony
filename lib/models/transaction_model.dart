class TransaksiModel {
  /*
  tipe
  1 -> pemasukan
  2 -> pengeluaran
  */
  int? id, type, total;
  String? nama, createdAt, updatedAt;

  TransaksiModel(
      {this.id,
      this.type,
      this.total,
      this.nama,
      this.createdAt,
      this.updatedAt});

  factory TransaksiModel.fromJson(Map<String, dynamic> json) {
    return TransaksiModel(
        id: json['id'],
        type: json['type'],
        total: json['total'],
        nama: json['nama'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }
}
