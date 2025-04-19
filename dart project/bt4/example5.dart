void main() {
  // Ví dụ vòng lặp for
  for (var i = 0; i < 5; i++) {
    print('Giá trị của i là: $i');
  }

  // Ví dụ vòng lặp for-in
  var fruits = ['Táo', 'Chuối', 'Cam', 'Xoài'];
  for (var fruit in fruits) {
    print('Trái cây: $fruit');
  }

  // Ví dụ vòng lặp while
  var j = 0;
  while (j < 5) {
    print('Giá trị của j là: $j');
    j++;
  }

  // Ví dụ vòng lặp do-while
  var k = 0;
  do {
    print('Giá trị của k là: $k');
    k++;
  } while (k < 5);

  // Ví dụ vòng lặp với break
  for (var m = 0; m < 10; m++) {
    if (m == 5) {
      break;
    }
    print('Giá trị của m là: $m');
  }

  // Ví dụ vòng lặp với continue
  for (var n = 0; n < 10; n++) {
    if (n % 2 == 0) {
      continue;
    }
    print('Giá trị của n là: $n');
  }
}