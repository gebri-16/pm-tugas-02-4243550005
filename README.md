# Tugas Rutin 2 - Aplikasi Console Kasir Sederhana

**Nama:** Bicanro Gebriyan Panjaitan
**NIM:** 4243550005
**Mata kuliah:** Pemrograman Mobile 

## Skenario 1: Pesanan valid
![Pesanan valid](screenshots/valid.jpg)

## Skenario 2: Pesanan dengan kode salah
![Pesanan ditolak](screenshots/tolak.jpg)

## Penjelasan
Di program kasir ini saya memakai tiga kata kunci untuk menyimpan nilai.
`var` untuk nilai yang boleh berubah, `final` untuk nilai yang hanya
diisi sekali saat program berjalan, dan `const` untuk nilai tetap yang
sudah pasti sejak kode ditulis. Hampir semua variabel di kasir.dart
saya tulis dengan `final`, misalnya `katalog`, `input`, dan `total`,
karena nilainya tidak berubah setelah diisi. `var` hanya muncul di
perulangan `for` pada fungsi `rupiah` karena nilai `i` terus bertambah.

Null safety membuat program tidak crash karena nilai kosong. Di baris 56,
`katalog[kode]` bisa bernilai null kalau kode produknya tidak ada, dan di
baris 55 `int.tryParse()` bernilai null kalau jumlahnya bukan angka. Dua
nilai itu saya periksa dulu di baris 58 (`produk == null`) dan baris 62
(`jumlah == null`). Kalau salah, item dicatat sebagai item ditolak, bukan
dipakai begitu saja. Setelah dicek, Dart tahu nilainya pasti ada, jadi
saya tidak perlu memakai tanda `!`.

## Hasil dart analyze
![dart analyze](screenshots/analyze.jpg)


## Pernyataan penggunaan AI
disini saya di bantu oleh ai (claude) untuk bagian kerangka kode nya, setelahnya saya menjalankan program ini sendiri serta menguji nya dengan beberapa pesan, tapi saya tidak sekedar dibantu untuk kode nya, saya juga mempelajari beberapa tiap bagian kode nyaa