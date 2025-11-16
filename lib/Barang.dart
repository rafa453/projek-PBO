class Barang {
  String idBarang;
  String merek;
  String namaBarang;
  double hargaJual;
  double hargaBeli;

  Barang(this.idBarang, this.merek, this.namaBarang, this.hargaJual, this.hargaBeli);
  void getDetailProduk() {
    print(
      '$namaBarang ($merek) - ID: $idBarang\nHarga Jual: $hargaJual | Harga Beli: $hargaBeli',
    );
  }
}
