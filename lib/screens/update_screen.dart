// import 'package:flutter/material.dart';
// import 'package:flutter_sqflite/db/db_helpert.dart';
// import 'package:flutter_sqflite/models/transaction_model.dart';
// import 'package:flutter_sqflite/utils/string_exrension.dart';

// class UpdateScreen extends StatefulWidget {
//   // final TransactionModel transaksiModel;
//   // const UpdateScreen({super.key, required this.transaksiModel});
//   const UpdateScreen({
//     super.key,
//   });

//   @override
//   State<UpdateScreen> createState() => _UpdateScreenState();
// }

// class _UpdateScreenState extends State<UpdateScreen> {
//   DbHelper dbHelper = DbHelper();
//   TextEditingController namaController = TextEditingController();
//   TextEditingController totalController = TextEditingController();
//   int _value = 1;

//   @override
//   void initState() {
//     dbHelper.database();
//     namaController.text = widget.transaksiModel.nama!;
//     totalController.text = widget.transaksiModel.total!.toString();
//     _value = widget.transaksiModel.type!;
//     super.initState();
//   }

//   void dispose() {
//     totalController.removeListener(_formatCurrency);
//     super.dispose();
//   }

//   void _formatCurrency() {
//     final text = totalController.text;
//     final selection = totalController.selection;

//     if (text.isNotEmpty) {
//       // Simpan posisi cursor sebelum format
//       final cursorPosition = selection.extentOffset;

//       // Format teks
//       final numericString = text.replaceAll(RegExp(r'[^0-9]'), '');
//       final value = int.tryParse(numericString) ?? 0;
//       final newText = value.toRupiah();

//       // Hitung posisi cursor baru
//       var newCursorPosition = 4;
//       if (cursorPosition > 1) {
//         newCursorPosition = newText.length;
//       }

//       // Terapkan perubahan
//       totalController.value = totalController.value.copyWith(
//         text: newText,
//         selection: TextSelection.collapsed(offset: newCursorPosition),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: const Text(
//           "Edit Transaksi",
//           style: TextStyle(
//               color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 10,
//               ),
//               TextField(
//                   controller: namaController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     labelText: "Jenis Transaksi",
//                   )),
//               const SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 "Tipe Transaksi",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               ListTile(
//                 title: const Text("Pemasukan"),
//                 leading: Radio(
//                   value: 1,
//                   groupValue: _value,
//                   onChanged: (value) {
//                     setState(() {
//                       _value = int.parse(value.toString());
//                     });
//                   },
//                 ),
//               ),
//               ListTile(
//                 title: const Text("Pengeluaran"),
//                 leading: Radio(
//                   value: 2,
//                   groupValue: _value,
//                   onChanged: (value) {
//                     setState(() {
//                       _value = int.parse(value.toString());
//                     });
//                   },
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextField(
//                 controller: totalController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   labelText: "Jumlah Transaksi",
//                 ),
//                 onChanged: (value) {
//                   _formatCurrency();
//                 },
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Center(
//                 child: ElevatedButton.icon(
//                   onPressed: () async {
//                     await dbHelper.update(widget.transaksiModel.id!, {
//                       "nama": namaController.text,
//                       "type": _value,
//                       "total": int.parse(
//                           totalController.text.fromRupiah().toString()),
//                       "updated_at": DateTime.now().toString()
//                     });
//                     Navigator.pop(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.deepPurple,
//                     foregroundColor: Colors.white,
//                     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   label: Text("Simpan"),
//                   icon: Icon(Icons.save),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
