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
