import 'dart:io';

import 'package:dart_console/dart_console.dart';
import 'package:interact_cli/interact_cli.dart';
import 'package:project_pbo/Barang.dart';
import 'package:project_pbo/Gudang.dart';
import 'package:project_pbo/item_transaksi.dart';
import 'package:project_pbo/Pembeli.dart';
import 'package:project_pbo/Supplier.dart';
import 'package:project_pbo/Transaksi.dart';

final Console console = Console();

void main() {
  var gudangPusat = Gudang('G001', 'Gudang Utama');
  List<Pembeli> daftarPembeli = [];

  console.clearScreen();
  console.setTextStyle(bold: true);

  console.setForegroundColor(ConsoleColor.brightBlue);
  console.writeLine(
    '=======================================',
    TextAlignment.center,
  );
  console.setForegroundColor(ConsoleColor.brightYellow);
  console.writeLine(
    '    APLIKASI MANAJEMEN SEMBAKO (PBO)',
    TextAlignment.center,
  );
  console.setForegroundColor(ConsoleColor.brightBlue);
  console.writeLine(
    '=======================================',
    TextAlignment.center,
  );
  console.resetColorAttributes();

  
}
