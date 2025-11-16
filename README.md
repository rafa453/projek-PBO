# 🛒 Project PBO: Sistem Penjualan Sembako CLI

Proyek ini adalah implementasi sistem manajemen penjualan dan inventaris sederhana berbasis Command Line Interface (CLI) menggunakan bahasa pemrograman Dart dan prinsip-prinsip Object-Oriented Programming (PBO).

---

## ✨ Fitur Utama Aplikasi

Sistem ini memungkinkan pengguna untuk mengelola stok gudang, mencatat transaksi pembelian oleh pelanggan, dan memelihara data master (Barang, Pembeli, Supplier).

* **Manajemen Stok:** Menambah stok dari Supplier dan mengurangi stok otomatis saat terjadi transaksi pembelian.
* **Transaksi Interaktif:** Proses pembelian yang melibatkan pemilihan Pembeli dan Barang secara *real-time* menggunakan menu interaktif.
* **Validasi Input:** Menggunakan *library* `interact_cli` untuk memastikan input data (angka, pilihan menu) valid dan berada dalam jangkauan yang benar.
* **Laporan:** Menampilkan daftar stok gudang dan riwayat transaksi.
* **Enkapsulasi OOP:** Setiap entitas (Barang, Gudang, Pembeli, Supplier, Transaksi) dienkapsulasi dalam kelasnya masing-masing.

---

## 🚀 Teknologi dan Dependensi

| Kategori | Teknologi/Package | Deskripsi |
| :--- | :--- | :--- |
| **Bahasa Pemrograman** | Dart | Bahasa utama untuk logika aplikasi dan OOP. |
| **Interface** | `dart:io` | Library bawaan Dart untuk input/output standar. |
| **Interaksi CLI** | `interact_cli` | Digunakan untuk membuat menu pilihan (`Select`), konfirmasi (`Confirm`), dan input dengan validasi yang lebih baik daripada `dart:io`. |
| **Styling Console** | `dart_console` | Digunakan untuk memberikan warna (foreground/background) pada output terminal. |

---

## ⚙️ Prasyarat Instalasi

Pastikan sistem Anda sudah terinstal Dart SDK.

1.  **Instal Dart SDK:** Ikuti petunjuk resmi dari [Dart website](https://dart.dev/get-dart).
2.  **Clone Repository:**
    ```bash
    git clone [https://github.com/rafa453/projek-PBO.git](https://github.com/rafa453/projek-PBO.git)
    cd projek-PBO
    ```
3.  **Install Dependencies:** Ambil semua *package* yang dibutuhkan (termasuk `interact_cli` dan `dart_console`).
    ```bash
    dart pub get
    ```

---

## 📂 Susunan Project

Struktur proyek mengikuti konvensi Dart:
