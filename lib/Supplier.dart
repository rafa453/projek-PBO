import 'Barang.dart';

class Supplier {
  String idSupplier;
  String NamaSupplier;
  String Lokasi;
  List<Barang> daftarBarang = [];
  

  Supplier(this.idSupplier, this.NamaSupplier, this.Lokasi);
  void getDetailSupplier() {
    print('id suplier : $idSupplier');
    print('nama suplier : $NamaSupplier');
    print('lokasi : $Lokasi');
  }

  
}

