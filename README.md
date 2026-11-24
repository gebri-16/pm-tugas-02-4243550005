# Tugas Rutin 2 - Aplikasi Console Kasir Sederhana

**Nama:** Bicanro Gebriyan Panjaitan
**NIM:** 4243550005
**Mata kuliah:** Pemrograman Mobile 

## Skenario 1: Pesanan valid
![Pesanan valid](screenshots/valid.jpg)

## Skenario 2: Pesanan dengan kode salah
![Pesanan ditolak](screenshots/tolak.jpg)

## Penjelasan

program ini adalah kasir console untuk toko oleh-oleh di Medan. program
menampilkan katalog lima produk dalam tabel, membaca pesanan satu baris
seperti P01x2, P03x1, lalu mencetak struk berisi item, total, diskon 10%
untuk total mulai Rp100.000, jumlah bayar, dan kategori yang dibeli. kode
atau jumlah yang salah dicatat sebagai item ditolak.

`var` dipakai untuk nilai yang berubah, `final` untuk nilai yang diisi
sekali saat program berjalan, dan `const` untuk nilai tetap yang sudah
diketahui sejak kode ditulis. Hampir semua variabel saya tulis dengan
`final`, seperti `katalog` (baris 19) dan `input` (baris 38). `var`
hanya muncul di `for` pada fungsi `rupiah` (baris 10) karena nilai `i`
terus bertambah.

null safety mencegah crash karena nilai kosong. `int.tryParse()` di
baris 55 dan `katalog[kode]` di baris 56 bisa bernilai null, jadi saya
periksa dulu lewat `produk == null` (baris 58) dan `jumlah == null`
(baris 62). Kalau salah, item masuk daftar ditolak. karena sudah dicek,
saya tidak perlu memakai tanda `!`.

## Hasil dart analyze
![dart analyze](screenshots/analyze.jpg)



## Pernyataan penggunaan AI

saya memakai claude (ai buatan anthropic) untuk membantu menyusun
kerangka program kasir ini, mulai dari tabel katalog dengan padRight dan
padLeft, cara memecah pesanan dengan split, sampai pengecekan null pada
katalog[kode] dan int.tryParse. claude juga membantu menjelaskan cara
menghitung subtotal dengan map, total dengan fold, dan diskon 10%. setelah
itu saya menjalankan programnya sendiri dengan pesanan yang valid dan
pesanan yang berisi kode salah seperti p99, lalu mempelajari cara kerja
tiap bagiannya. penjelasan di atas saya sesuaikan dengan kode yang saya
jalankan.