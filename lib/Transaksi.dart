import 'package:project_pbo/Barang.dart';

import 'Pembeli.dart';

class Transaksi {
  String idTransaksi;
  DateTime TanggalTransaksi;
  String JenisPembayaran;
  int TotalHarga = 0;
  int jumlah;
  Pembeli pembeli;
  List<Barang> daftarBarang = [];

  Transaksi(
    this.idTransaksi,
    this.TanggalTransaksi,
    this.JenisPembayaran,
    this.TotalHarga,
    this.jumlah,
    this.pembeli
  );
  void addItem(Barang barang) {
    daftarBarang.add(barang);
    print('Barang : ${barang.NamaBarang}');
    print('Harga : RP.${barang.HargaJual}');
    print('Jumlah : ${jumlah}');
  }

  void hitungTotal(Barang barang) {
    daftarBarang.add(barang);
    TotalHarga = barang.HargaJual * jumlah;
    print('total harga: ${TotalHarga}');
  }

  void cekStruk() {
    print('=======================');
    print('====STRUK TRANSAKSI====');
    print('== 1.ID pembeli : ${pembeli.idPembeli}==');
    print('== 2.ID transaksi : $idTransaksi==');
    print('== 3.Tanggal Transaksi $TanggalTransaksi==');
    print('== 4.Jenis Pembayaran $JenisPembayaran==');
    print('== 5.Total harga $TotalHarga==');
    print('=======================');
  }
}
