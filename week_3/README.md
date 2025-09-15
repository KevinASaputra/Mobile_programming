A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

# Tugas Praktikum

```dart
void main() {
  String nama = "Kevin Adika Saputra";
  String nim = "2341720017";

  for (int i = 0; i <= 201; i++) {
    if (isPrima(i)) {
      print("Bilangan prima: $i");
      print("Nama: $nama");
      print("NIM : $nim\n");
    }
  }
}

bool isPrima(int angka) {
  if (angka < 2) return false;
  for (int i = 2; i <= angka ~/ 2; i++) {
    if (angka % i == 0) {
      return false;
    }
  }
  return true;
}
```

### Hasil

---

```
Bilangan prima: 2
Nama: Kevin Adika Saputra
NIM : 2341720017

Bilangan prima: 3
Nama: Kevin Adika Saputra
NIM : 2341720017

Bilangan prima: 5
Nama: Kevin Adika Saputra
NIM : 2341720017

Bilangan prima: 7
Nama: Kevin Adika Saputra
NIM : 2341720017
```
