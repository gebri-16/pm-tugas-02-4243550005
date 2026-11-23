import 'dart:io';

// typedef memberi nama pada tipe record agar kode lebih mudah dibaca.
typedef Produk = ({String nama, String kategori, int harga});

/// Mengubah 45000 menjadi 'Rp45.000'.
String rupiah(int n) {
  final s = n.toString();
  final buf = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    // Sisipkan titik setiap 3 digit dari belakang.
    if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
    buf.write(s[i]);
  }
  return 'Rp$buf';
}

void main() {
  final Map<String, Produk> katalog = {
    'P01': (nama: 'Kopi Sidikalang 250 g', kategori: 'Kopi', harga: 45000),
    'P02': (nama: 'Kopi Gayo 250 g', kategori: 'Kopi', harga: 55000),
    'P03': (nama: 'Teh Kayu Aro 100 g', kategori: 'Teh', harga: 25000),
    'P04': (nama: 'Gula Aren 500 g', kategori: 'Pemanis', harga: 30000),
    'P05': (nama: 'Bolu Meranti', kategori: 'Makanan', harga: 80000),
  };

  // TODO 1: katalog sebagai tabel rapi
  print('KATALOG TOKO');
  print('${'Kode'.padRight(6)}${'Nama'.padRight(24)}${'Harga'.padLeft(12)}');
  print('-' * 42);
  katalog.forEach((kode, p) {
    print(
      '${kode.padRight(6)}${p.nama.padRight(24)}'
      '${rupiah(p.harga).padLeft(12)}',
    );
  });
  print('-' * 42);

  stdout.write('Pesanan (contoh: P01x2, P03x1): ');
  final String input = stdin.readLineSync() ?? ''; // String? -> String

  // TODO 2 & 3: pecah input, validasi, simpan yang valid / yang ditolak
  final List<({Produk produk, int jumlah})> valid = [];
  final List<String> ditolak = [];

  for (final mentah in input.split(',')) {
    final item = mentah.trim().toUpperCase();
    if (item.isEmpty) continue; // lewati bagian kosong, mis. koma di akhir

    final bagian = item.split('X'); // 'P01X2' -> ['P01', '2']
    if (bagian.length != 2) {
      ditolak.add('$item (format harus KODExJUMLAH)');
      continue;
    }

    final kode = bagian[0].trim();
    final jumlah = int.tryParse(bagian[1].trim()); // int? -> aman dari crash
    final produk = katalog[kode]; // Map selalu mengembalikan nullable

    if (produk == null) {
      ditolak.add('$item (kode "$kode" tidak ada)');
      continue;
    }
    if (jumlah == null || jumlah <= 0) {
      ditolak.add('$item (jumlah tidak valid)');
      continue;
    }
    // Di titik ini compiler tahu produk dan jumlah bukan null (type promotion),
    // jadi tidak perlu operator ! sama sekali.
    valid.add((produk: produk, jumlah: jumlah));
  }

  // TODO 4: subtotal (map), total (fold), diskon
  final daftar = valid
      .map(
        (v) => (
          nama: v.produk.nama,
          kategori: v.produk.kategori,
          jumlah: v.jumlah,
          subtotal: v.produk.harga * v.jumlah,
        ),
      )
      .toList();

  final int total = daftar.fold<int>(0, (sum, i) => sum + i.subtotal);
  final int diskon = total >= 100000 ? total ~/ 10 : 0; // 10%, pembagian bulat
  final int bayar = total - diskon;
  final Set<String> kategori = daftar.map((i) => i.kategori).toSet();

  // TODO 5: cetak struk
  print('');
  print('=' * 42);
  print('STRUK BELANJA'.padLeft(27));
  print('=' * 42);

  if (daftar.isEmpty) {
    print('Tidak ada item valid yang dibeli.');
  } else {
    for (final i in daftar) {
      print(
        '${i.nama.padRight(24)}${'x${i.jumlah}'.padLeft(4)}'
        '${rupiah(i.subtotal).padLeft(14)}',
      );
    }
    print('-' * 42);
    print('${'Total'.padRight(28)}${rupiah(total).padLeft(14)}');
    print('${'Diskon 10%'.padRight(28)}${('-${rupiah(diskon)}').padLeft(14)}');
    print('${'Jumlah bayar'.padRight(28)}${rupiah(bayar).padLeft(14)}');
    print('-' * 42);
    print('Kategori dibeli : ${kategori.join(', ')}');
  }

  if (ditolak.isNotEmpty) {
    print('Item ditolak    :');
    for (final d in ditolak) {
      print('  - $d');
    }
  }
}
