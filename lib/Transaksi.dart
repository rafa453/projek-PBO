import 'item_transaksi.dart';
import 'Pembeli.dart';

class Transaksi {
  String idTransaksi;
  DateTime tanggalTransaksi;
  String jenisPembayaran;
  double totalHarga = 0;

  //relasi 'melakukan' dan 'berisi'
  Pembeli pembeli;
  List<ItemTransaksi> items = [];

  Transaksi(this.idTransaksi, this.pembeli, this.jenisPembayaran, this.items)
    : tanggalTransaksi = DateTime.now();

  void addItem(ItemTransaksi itemTransaksi) {
    items.add(itemTransaksi);
  }

  double hitungTotal() {
    totalHarga = 0;
    for (var item in items) {
      totalHarga += item.subtotal;
    }
    return totalHarga;
  }

  void cetakStruk() {
    hitungTotal(); // Pastikan total sudah dihitung
    print('\n=======================================');
    print('          STRUK PEMBELIAN SEMBAKO');
    print('=======================================');
    print('ID Transaksi: $idTransaksi');
    print('Tanggal: ${tanggalTransaksi.toString().split(' ')[0]}');
    print('Pembeli: ${pembeli.namaPembeli}');
    print('Pembayaran: $jenisPembayaran');
    print('---------------------------------------');
    items.forEach((item) => print(item.getDetailItem( )));
    print('---------------------------------------');
    print('TOTAL BAYAR: $totalHarga');
    print('=======================================');
  }
}
