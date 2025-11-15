class Pembeli {
  String idPembeli;
  String namaPembeli;
  String alamat;

  Pembeli(this.idPembeli, this.namaPembeli, this.alamat);

  void getDetail() {
    print('ID : $idPembeli');
    print('Nama : $namaPembeli');
    print('Alamat : $alamat');
  }
}
