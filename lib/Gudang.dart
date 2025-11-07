import 'package:project_pbo/Supplier.dart';

import 'Barang.dart';

class Gudang {
  String idGudang;
  String namaGudang;
  Barang barang;
  Supplier supplier;

  Map<Barang, int> stokBarang = {};

  Gudang(this.idGudang, this.namaGudang, this.barang, this.supplier);

  void cekStok() {
    print("===== STOK GUDANG: $namaGudang =====");
    if (stokBarang.isEmpty) {
      print('Belum ada barang yang masuk');
    } else {
      stokBarang.forEach((barang, jumlah) {
        print("${barang.NamaBarang} (ID: ${barang.idBarang}) - Stok: $jumlah");
      });
    }
  }

  void tambahStok() {
    
  }

  void kurangiStok() {

  }
}
