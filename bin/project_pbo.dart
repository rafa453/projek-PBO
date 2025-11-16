// Import packages interaktif
import 'package:interact_cli/interact_cli.dart' as cli;
import 'package:dart_console/dart_console.dart';

// Import kelas entitas Anda
import 'package:project_pbo/Barang.dart';
import 'package:project_pbo/Gudang.dart';
import 'package:project_pbo/item_transaksi.dart';
import 'package:project_pbo/Pembeli.dart';
import 'package:project_pbo/Supplier.dart';
import 'package:project_pbo/Transaksi.dart';

class SistemPenjualan {
  // --- PROPERTI ---
  final console = Console();
  Gudang gudang = Gudang("GD001", "Gudang Utama");
  List<Supplier> supplier = [];
  List<Pembeli> pembeli = [];
  List<Transaksi> transaksi = [];
  List<Barang> barang = [];
  int transaksiCounter = 1;

  SistemPenjualan() {
    // Data awal
    supplier.add(Supplier("SP001","PT SEMBAKO ABADI NAN JAYA","sembako@abadinanjaya.com",));
    supplier.add(Supplier("SP002", "PT PT BERAPA", "sembako@ptberapa.com"));
    barang.add(Barang("BR001", "KOKOKU", "Beras", 20000.0, 18000.0));
    barang.add(Barang("BR002", "KING", "Gula", 15000.0, 13000.0));
    gudang.tambahStok(barang[0], 50);
    gudang.tambahStok(barang[1], 50);
    pembeli.add(Pembeli("PB001", "Andi", "JL. Bunar 1"));
  }

  // --- FUNGSI PEMBANTU INPUT INTERACT_CLI DENGAN PERBAIKAN ---

  // Menggunakan Input.with<String> untuk memastikan stabilitas input string
  String _getInputString(String prompt) {
    String? result;

    while (true) {
      result = cli.Input(prompt: prompt).interact();

      if (result != null && result.isNotEmpty) {
        return result;
      }
      console.setForegroundColor(ConsoleColor.brightRed);
      console.writeLine('input tidak boleh kosong');
    }
  }

  int _getInputInt(String prompt) {
    int? resultInt;

    while (resultInt == null || resultInt.isNegative) {
      String? Input = cli.Input(prompt: prompt).interact();
      resultInt = int.tryParse(Input);

      if (resultInt == null) {
        console.setForegroundColor(ConsoleColor.brightRed);
        console.writeLine('input tidak boleh kosong');
      } else if (resultInt.isNegative) {
        console.setForegroundColor(ConsoleColor.brightRed);
        console.writeLine('input tidak boleh negatif/0');
      }
    }
    return resultInt;
  }

  // --- FUNGSI UTAMA ---
  void jalankan() {
    // ... (Logika jalankan() sama, menggunakan _getInputInt untuk menu)
    while (true) {
      console.setForegroundColor(ConsoleColor.blue);
      console.writeLine("\n===== SISTEM PENJUALAN SEMBAKO =====");
      console.resetColorAttributes();
      console.writeLine("1. Lihat barang");
      console.writeLine("2. Lihat stok gudang");
      console.writeLine("3. Tambah stok dari Supplier");
      console.writeLine("4. Lakukan pembelian");
      console.writeLine("5. Lihat riwayat transaksi");
      console.writeLine("6. Keluar");

      int pilihanInt;
      while (true) {
        pilihanInt = _getInputInt('Pilih opsi 1-6 : ');
        if (pilihanInt >= 1 && pilihanInt <= 6) {
          break;
        }
        console.setForegroundColor(ConsoleColor.brightRed);
        console.writeLine('input tidak valid, masukan angka 1-6!!');
        console.resetColorAttributes();
      }

      switch (pilihanInt) {
        case 1:
          tampilkanBarang();
          break;
        case 2:
          gudang.tampilkanSemua();
          break;
        case 3:
          tambahStokDariSupplier();
          break;
        case 4:
          lakukanPembelian();
          break;
        case 5:
          tampilkanRiwayatTransaksi();
          break;
        case 6:
          // Menggunakan Confirm dari interact_cli
          bool konfirmasi = cli.Confirm(
            prompt: "Apakah anda yakin ingin keluar?",
            defaultValue: false,
          ).interact();
          if (konfirmasi) {
            console.setForegroundColor(ConsoleColor.brightCyan);
            console.writeLine("Terima Kasih!");
            return;
          } else {
            console.setForegroundColor(ConsoleColor.brightRed);
            console.writeLine("kembali ke menu.");
          }
          break;
      }
    }
  }

  // Method untuk tampilkan daftar barang (Sama)
  void tampilkanBarang() {
    console.setForegroundColor(ConsoleColor.brightYellow);
    console.writeLine("\n--- Daftar Barang ---");
    if (barang.isEmpty) {
      console.writeLine("Tidak ada barang tersedia.");
      return;
    }
    for (var b in barang) {
      console.writeLine(
        "ID: ${b.idBarang} | Nama: ${b.namaBarang} | Merek: ${b.merek} | Harga Jual: Rp${b.hargaJual.toStringAsFixed(0)} | Harga Beli: Rp${b.hargaBeli.toStringAsFixed(0)}",
      );
    }
    console.resetColorAttributes();
  }

  void tambahStokDariSupplier() {
  console.setForegroundColor(ConsoleColor.brightCyan);
  console.writeLine("\n--- Tambah Stok dari Supplier ---");

  // Pilih supplier
  var namaSupplierList = supplier.map((s) => s.namaSupplier).toList();
  int idxSupplier = cli.Select(
    prompt: "Pilih Supplier:",
    options: namaSupplierList,
  ).interact();
  Supplier selectedSupplier = supplier[idxSupplier];

  tampilkanBarang();

  // Pilih barang
  var idBarangList = barang.map((b) => b.idBarang).toList();
  int idxBarang = cli.Select(
    prompt: "Pilih ID barang:",
    options: idBarangList,
  ).interact();

  Barang selectBarang = barang[idxBarang];

  int jumlah = _getInputInt("Jumlah tambah stok:");

  gudang.tambahStok(selectBarang, jumlah);

  console.setForegroundColor(ConsoleColor.brightGreen);
  console.writeLine(
    "Stok berhasil ditambahkan dari ${selectedSupplier.namaSupplier}.",
  );
  console.resetColorAttributes();
}


  //Method untuk melakukan pembelian
  void lakukanPembelian() {
    console.setForegroundColor(ConsoleColor.brightCyan);
    console.writeLine("\n--- Lakukan Pembelian ---");

    // Menggunakan Select untuk Pembeli
    var namaPembeliList = pembeli.map((p) => p.namaPembeli).toList();
    int idxPembeli = cli.Select(
      prompt: "Pilih Pembeli:",
      options: namaPembeliList,
    ).interact();

    Pembeli selectedPembeli = pembeli[idxPembeli];

    List<ItemTransaksi> items = [];
    double total = 0;

    while (true) {
      console.writeLine('\n--- Keranjang saat ini: ${items.length} item ---');
      tampilkanBarang();
      gudang.tampilkanSemua();

      // Menggunakan _getInputString
      String input = _getInputString(
        "Pilih ID barang (atau ketik 'selesai' untuk menyelesaikan):",
      );

      if (input.toLowerCase() == 'selesai') break;

      Barang? selectedBarang;
      try {
        selectedBarang = barang.firstWhere((b) => b.idBarang == input);
      } catch (e) {
        console.setForegroundColor(ConsoleColor.brightRed);
        console.writeLine("Barang tidak ditemukan.");
        continue;
      }

      int jumlah = _getInputInt("Jumlah:");

      if (jumlah <= 0) {
        console.setForegroundColor(ConsoleColor.brightRed);
        console.writeLine("Jumlah harus lebih dari 0.");
        continue;
      }

      // Kurangi stok
      if (gudang.kurangiStock(selectedBarang, jumlah) == false) {
        continue;
      }

      ItemTransaksi newItem = ItemTransaksi(selectedBarang, jumlah);
      items.add(newItem);
      total += newItem.subtotal;
      console.setBackgroundColor(ConsoleColor.brightGreen);
      console.writeLine(
        "Ditambahkan ke keranjang: ${selectedBarang.namaBarang} x$jumlah",
      );
    }

    if (items.isEmpty) {
      console.setForegroundColor(ConsoleColor.brightRed);
      console.writeLine("Tidak ada item dibeli. Transaksi dibatalkan.");
      return;
    }

    String idTransaksi = "TR${transaksiCounter.toString().padLeft(3, '0')}";
    Transaksi newTransaksi = Transaksi(
      idTransaksi,
      selectedPembeli,
      "Tunai",
      items,
    );
    transaksi.add(newTransaksi);
    transaksiCounter++;
    console.setForegroundColor(ConsoleColor.brightGreen);
    console.writeLine(
      "\nTransaksi berhasil! ID: $idTransaksi, Total: Rp${total.toStringAsFixed(0)}",
    );
    console.resetColorAttributes();
  }

  // Method untuk tampilkan riwayat transaksi (Sama)
  void tampilkanRiwayatTransaksi() {
    console.setForegroundColor(ConsoleColor.brightCyan);
    console.writeLine("\n--- Riwayat Transaksi ---");
    if (transaksi.isEmpty) {
      console.setForegroundColor(ConsoleColor.brightRed);
      console.writeLine("Tidak ada riwayat transaksi.");
      return;
    }

    for (var t in transaksi) {
      double total = t.items.fold(
        0.0,
        (sum, item) => sum + item.hitungSubtotal(), // <-- Koreksi di sini!
      );
      console.writeLine(
        "ID: ${t.idTransaksi} | Pembeli: ${t.pembeli.namaPembeli} | Total: Rp${total.toStringAsFixed(0)}",
      );
      console.writeLine("---");
    }
    console.resetColorAttributes();
  }
}

// --- FUNGSI MAIN (Entry Point) ---
void main() {
  SistemPenjualan app = SistemPenjualan();
  app.jalankan();
}
