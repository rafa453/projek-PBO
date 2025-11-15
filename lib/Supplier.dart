class Supplier {
  String idSupplier;
  String namaSupplier;
  String lokasi;

  Supplier(this.idSupplier, this.namaSupplier, this.lokasi);

  void getDetailSupplier() {
    print('id suplier : $idSupplier');
    print('nama suplier : $namaSupplier');
    print('lokasi : $lokasi');
  }

  
}

