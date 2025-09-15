void main() {
  praktikum2(); //Tinggal panggil functuin praktikum1(), praktikum2(), dan praktikum3()
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
