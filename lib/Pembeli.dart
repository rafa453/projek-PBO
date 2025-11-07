class Pembeli {
  String idPembeli;
  String NamaPembeli;
  String Alamat;

  Pembeli(this.idPembeli, this.NamaPembeli, this.Alamat);
  void getDetail() {
    print('ID : $idPembeli');
    print('Nama : $NamaPembeli');
    print('Alamat : $Alamat');
  }
}
