import 'Barang.dart';

class ItemTransaksi {
  Barang barang;
  int jumlah;
  double subtotal;

  double hitungSubtotal() {
    // Asumsi: properti barang dan jumlah sudah ada
    // Harga dikalikan kuantitas
    return barang.hargaJual * jumlah; 
}

  ItemTransaksi(this.barang, this.jumlah)
    :subtotal = barang.hargaJual * jumlah;
  
  String getDetailItem() {
    return '  - ${barang.namaBarang} (${barang.merek}) | ${jumlah}x @${barang.hargaJual} = $subtotal';
  }
}
