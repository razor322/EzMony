import 'package:intl/intl.dart';

extension CurrencyFormatting on int {
  String toRupiah() {
    final format = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 0,
    );
    return format.format(this);
  }
}

extension StringCurrency on String {
  String toRupiahFormat() {
    final numericString = replaceAll(RegExp(r'[^0-9]'), '');
    if (numericString.isEmpty) return 'Rp 0';
    return (int.tryParse(numericString) ?? 0).toRupiah();
  }

  int fromRupiah() {
    return int.tryParse(replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
  }
}
