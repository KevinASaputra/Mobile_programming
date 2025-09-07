A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

# Project Title

A brief description of what this project does and who it's for

# Jawaban Tugas — Flutter & Dart

> **Nama:** Kevin Adika S
> **Mata Kuliah:** Mobile Programming Dart And Flutter
> **Kelas/NRP:** TI-3G

---

## Soal 2 — Mengapa harus memahami **Dart** sebelum menggunakan **Flutter**?

Memahami Dart lebih dulu itu **krusial** karena:

1. **Semua kode Flutter ditulis dengan Dart**
   Tanpa memahami sintaks, tipe data, OOP, koleksi, async/await, dan null safety Dart, Anda akan kesulitan membaca widget maupun menulis logika aplikasi.

2. **Fitur bahasa Dart = fitur Flutter**

   - **Null Safety** memengaruhi cara Anda mendefinisikan model, state, dan dependency injection.
   - **Generics & Extensions** sering dipakai di state management (Provider, Riverpod, Bloc).
   - **Isolates/Futures/Streams** sangat penting untuk operasi async (HTTP, database, compute).

3. **Produktivitas & debug yang jauh lebih cepat**
   Mengerti alur kontrol, exceptions, dan type system Dart membuat Anda cepat menemukan akar masalah dibanding “coba-coba widget”.

4. **Arsitektur & skalabilitas**
   Konsep OOP Dart (class, mixin, abstract) menjadi fondasi pattern di Flutter (Repository, UseCase, DI, Service Layer).

5. **Kualitas kode**
   Pemanfaatan fitur bahasa (immutable `const`, `final`, `late`, `extension`, `sealed/class`) membuat kode lebih aman, ringkas, dan mudah diuji.

**Intinya:** Flutter adalah _UI toolkit_, sedangkan Dart adalah **bahasanya**. Menguasai bahasa = menguasai alatnya.

---

## Soal 3 — Ringkasan Codelab (Poin-Poin Penting)

Gunakan daftar berikut sebagai _cheatsheet_ saat mengembangkan aplikasi Flutter:

- **Setup & Struktur Proyek**

  - `lib/` berisi kode aplikasi; entry point di `lib/main.dart`.
  - Jalankan dengan **hot reload** (`r` di terminal / tombol petir).

- **Widget Dasar**

  - Segalanya adalah **Widget**.
  - **StatelessWidget** untuk UI statis; **StatefulWidget** untuk UI yang berubah karena state.

- **Layout & Styling**

  - Gunakan `Row`, `Column`, `Stack`, `SizedBox`, `Expanded/Flexible`, `Padding`, `Align`.
  - Tema global: `ThemeData`, `ColorScheme`, `TextTheme`.

- **Navigation**

  - `Navigator.push` / `pop`, `MaterialPageRoute`, atau _router_ modern (`go_router`/`RouterConfig`).

- **State Management (Dasar)**

  - `setState` untuk lokal/halaman kecil.
  - Naik kelas: `Provider` / `Riverpod` / `Bloc` untuk state kompleks dan testable.

- **Asynchronous**

  - `Future`, `async/await`, `FutureBuilder`.
  - **HTTP**: `http`/`dio` untuk REST; parsing JSON ke model (gunakan `factory fromJson`, `json_serializable`).

- **List & Builder**

  - `ListView.builder`, `GridView.builder`, `ListTile`, `RefreshIndicator`.

- **Form & Validasi**

  - `Form`, `TextFormField`, `validator`, `GlobalKey<FormState>`.

- **Assets & Images**

  - Daftarkan di `pubspec.yaml` (`assets:`), gunakan `Image.asset`/`Image.network`.

- **Testing & Lint**

  - `flutter test` untuk unit/widget test; aktifkan lints (`flutter_lints`) untuk kualitas.

- **Build & Release**

  - Android: `app/build.gradle`, _signing configs_.
  - iOS: Xcode signing; atur `Bundle Identifier`.

---

## Soal 4 — **Perbedaan Null Safety vs `late` Variable** (Penjelasan & Contoh)

### A. Konsep Utama

- **Null Safety (NNBD)**

  - Secara default, tipe **tidak boleh null**.
  - Tipe nullable ditandai `?` (contoh: `String?`).
  - Operator penting:

    - `?.` (safe access), `??` (default fallback), `??=` (set jika null), `!` (force non-null, hati-hati!).

- **`late` Variable**

  - Menunda inisialisasi variabel **non-nullable** sampai sebelum dipakai pertama kali.
  - Cocok saat nilai baru tersedia di kemudian waktu (mis. DI, `initState`, expensive computation _lazy_).
  - Jika diakses **sebelum** diinisialisasi → **`LateInitializationError`** (runtime).

> Ringkas: **Null Safety** adalah sistem tipe untuk mencegah _null reference_ di **compile-time**.
> **`late`** adalah kata kunci untuk **menunda** inisialisasi variabel non-nullable ke **runtime** (dengan risiko error jika salah pakai).

---

### B. Contoh 1 — Null Safety Dasar

```dart
void main() {
  String name = 'Rudi';       // non-nullable: wajib berisi
  // name = null;              // ❌ error compile-time

  String? nickname;           // nullable: boleh null
  print(nickname);            // null

  // Safe access & default value
  print(nickname?.toUpperCase());      // null (tidak melempar)
  print(nickname ?? 'Tanpa Julukan');  // "Tanpa Julukan"

  // Set jika masih null
  nickname ??= 'Diwan';
  print(nickname);                        // "Diwan"

  // Hindari pakai '!' kecuali yakin tidak null
  print(nickname!.toUpperCase());         // "DIWAN"
}
```

**Catatan:** Kompiler membantu Anda **sebelum runtime**, mencegah banyak bug _null reference_.

---

### C. Contoh 2 — `late` untuk Lazy Initialization

```dart
late final Database db; // akan diisi belakangan, tetapi harus tepat sekali (final)

Future<void> init() async {
  db = await Database.connect(); // inisialisasi tertunda
}

Future<void> run() async {
  await init();
  print(db.version); // aman: sudah diinisialisasi
}
```

**Kapan dipakai?**

- Saat nilai **pasti** tersedia sebelum digunakan, tetapi **tidak saat deklarasi** (mis. perlu async/DI).
- `late final` cocok untuk **lazy singleton** atau resource berat.

---

### D. Contoh 3 — `late` Salah Pakai (Runtime Error)

```dart
late String token;

void main() {
  // print(token); // ❌ LateInitializationError: token belum diinisialisasi
  token = 'ABC123';
  print(token);    // ✅ aman setelah diisi
}
```

**Pelajaran:** `late` **tidak** melindungi Anda dari kesalahan urutan eksekusi; cek alur agar tidak mengakses lebih awal.

---

### E. Contoh 4 — Membandingkan Pendekatan

```dart
class ProfileService {
  // A. Nullable + guard (aman oleh desain)
  String? _cachedName;

  String getNameWithNullSafety() {
    // handle ketika null
    return _cachedName ?? 'Guest';
  }

  // B. Non-nullable + late (wajib inisialisasi sebelum akses)
  late final String _nonNullName;

  void loadName(String name) {
    _nonNullName = name; // inisialisasi tertunda
  }

  String getNameWithLate() {
    return _nonNullName; // ❗ error runtime jika belum loadName()
  }
}

void main() {
  final s = ProfileService();

  // Pendekatan A: aman walau belum set
  print(s.getNameWithNullSafety()); // "Guest"

  // Pendekatan B: harus memanggil loadName lebih dulu
  // print(s.getNameWithLate());    // ❌ LateInitializationError
  s.loadName('Rudi');
  print(s.getNameWithLate());       // ✅ "Rudi"
}
```

**Kesimpulan Praktis**

- Gunakan **nullable (`?`)** jika nilai **memang bisa tidak ada** dan Anda siap memberi _fallback_.
- Gunakan **`late`** jika nilai **pasti ada** sebelum dipakai, hanya waktunya **ditunda** (setelah init, setelah fetch, dll).

---
