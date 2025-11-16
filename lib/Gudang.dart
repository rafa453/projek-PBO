import 'Barang.dart';
import 'package:dart_console/dart_console.dart';

Console console = Console();

class Gudang {
  String idGudang;
  String namaGudang;

  Map<String, int> stok = {};
  Map<String, Barang> daftarBarang = {};

  Gudang(this.idGudang, this.namaGudang);

  //mendaftarkan barang baru
  void daftarBarangBaru(Barang barang, int initialStok) {
    daftarBarang[barang.idBarang] = barang;
    stok[barang.idBarang] = initialStok;
    print(
      '${barang.namaBarang} berhasil didaftarkan di $namaGudang dengan stok awal $initialStok',
    );
  }

  int cekStock(String idBarang) {
    // Mengembalikan 0 jika idBarang tidak ditemukan
    return stok[idBarang] ?? 0;
  }

  void tambahStok(Barang barang, int jumlah) {
    if (daftarBarang.containsKey(barang.idBarang)) {
      stok[barang.idBarang] = cekStock(barang.idBarang) + jumlah;
      print(
        'stok ${barang.namaBarang} di $namaGudang ditambahkan $jumlah. Total : ${cekStock(barang.idBarang)}',
      );
    } else {
      //jika barang belum terdaftar
      daftarBarangBaru(barang, jumlah);
    }
  }

  bool kurangiStock(Barang barang, int jumlah) {
    int stokSekarang = cekStock(barang.idBarang);
    if (stokSekarang >= jumlah) {
      stok[barang.idBarang] = stokSekarang - jumlah;
      print(
        'Stok ${barang.namaBarang} di $namaGudang dikurangi $jumlah. Sisa: ${cekStock(barang.idBarang)}',
      );
      return true;
    } else {
      print(
        'Gagal mengurangi stok. Stok ${barang.namaBarang} hanya $stokSekarang, kurang $jumlah.',
      );
      return false;
    }
  }

  void tampilkanSemua() {
    console.setForegroundColor(ConsoleColor.brightWhite);
    console.writeLine('\n--- Laporan stok $namaGudang ---');
    stok.forEach((id, jumlah) {
      String namaBarang = daftarBarang[id]?.namaBarang ?? 'N/A';
      console.writeLine('$namaBarang (ID : $id) : $jumlah');
    });
    console.writeLine('----------------------------------');
  }
}
