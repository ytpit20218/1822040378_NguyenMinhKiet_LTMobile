void main() {
  // Khai báo các kiểu dữ liệu khác nhau
  int soNguyen = 10;
  double soThuc1 = 3.14;
  double soThuc2 = 2.718;
  double soThuc3 = 1.618;
  String chuoiKyTu = "Xin chào";
  bool giaTriBoolean = true;

  // In giá trị của các biến ra console
  print("Giá trị của số nguyên: $soNguyen");
  print("Giá trị của số thực 1: $soThuc1");
  print("Giá trị của số thực 2: $soThuc2");
  print("Giá trị của số thực 3: $soThuc3");
  print("Giá trị của chuỗi ký tự: $chuoiKyTu");
  print("Giá trị của Boolean: $giaTriBoolean");
  int calculateSum(int a, int b) {
    return a + b;
  }

  int sum = calculateSum(soNguyen, 5);
  print("Tổng của $soNguyen và 5 là: $sum");
}

