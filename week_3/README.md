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

NIM : 2341720017

...

Bilangan prima: 181
Nama: Kevin Adika Saputra
NIM : 2341720017

Bilangan prima: 191
Nama: Kevin Adika Saputra
NIM : 2341720017

Bilangan prima: 193
Nama: Kevin Adika Saputra
NIM : 2341720017

Bilangan prima: 197
Nama: Kevin Adika Saputra
NIM : 2341720017

Bilangan prima: 199
Nama: Kevin Adika Saputra
NIM : 2341720017


Exited.
```

# Tugas Praktikum 1 2 3

```dart
void main() {
  praktikum1(); //Tinggal panggil functuin praktikum1(), praktikum2(), dan praktikum3()
}

void praktikum3() {
  for (int index = 10; index < 27; index++) {
    if (index == 21)
      break;
    else if (index > 1 || index < 7) continue;
    print(index);
  }
}

void praktikum1() {
  String test = "test2";
  if (test == "test1") {
    print("Test1");
  } else if (test == "test2") {
    print("Test2");
  } else {
    print("Something else");
  }

  if (test == "test2") print("Test2 lagi");

  test = "true";
  if (test.isNotEmpty) {
    print("Kebenaran");
  }
}

void praktikum2() {
  int counter = 0;
  while (counter < 33) {
    print(counter);
    counter++;
  }

  do {
    print(counter);
    counter++;
  } while (counter < 77);
}


```

### Hasil

```
praktikum1() :

Test2
Test2 again
Kebenaran

Exited.

```

---

```
praktikum2() :

0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76

Exited.

```

---

```
Praktikum3() :
Tidak ada hasil

```
