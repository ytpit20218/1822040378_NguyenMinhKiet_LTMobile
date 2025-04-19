import 'dart:math';
import 'dart:io';

void main() {
  double a = 0, b = 0, c = 0;
  
  do {
    stdout.write("Nhập hệ số a (a khác 0): ");
    String? input = stdin.readLineSync();
    if (input != null) {
      a = double.tryParse(input) ?? 0; // có bắt lỗi
    }
  } while (a == 0);

  stdout.write("Nhập hệ số b: ");
  String? inputB = stdin.readLineSync();
  if (inputB != null) {
    b = double.tryParse(inputB) ?? 0;
  }

  stdout.write("Nhập hệ số c: ");
  String? inputC = stdin.readLineSync();
  if (inputC != null) {
    c = double.tryParse(inputC) ?? 0;
  }

  print("Bạn đã nhập: a = $a, b = $b, c = $c");

  // Tính toán delta
  double delta = b * b - 4 * a * c;
  if (delta > 0) {
    // Hai nghiệm phân biệt
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print("Phương trình ${a}x^2 + ${b}x + ${c} = 0 có hai nghiệm phân biệt: x1 = ${x1.toStringAsFixed(2)} và x2 = ${x2.toStringAsFixed(2)}");
  } else if (delta == 0) {
    // Một nghiệm kép
    double x = -b / (2 * a);
    print("Phương trình có một nghiệm kép: x = $x");
  } else {
    // Vô nghiệm
    print("Phương trình vô nghiệm");
  }
}
