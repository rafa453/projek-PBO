import 'Barang.dart';

class ItemTransaksi {
  Barang barang;
  int jumlah;
  int subtotal;

  ItemTransaksi(this.barang, this.jumlah)
    :subtotal = barang.hargaJual * jumlah;
  
  String getDetailItem() {
    return '  - ${barang.namaBarang} (${barang.merek}) | ${jumlah}x @${barang.hargaJual} = $subtotal';
  }
}
