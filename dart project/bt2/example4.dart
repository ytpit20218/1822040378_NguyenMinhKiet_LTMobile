/*
  Chuỗi là 1 tợp hợp ký tự UTF-16
*/
import 'dart:ffi';

void main()
{
  var s1 = 'Nguyen Minh Kiet';
  var s2 = "NMK";
  //Chèn giá trị của 1 biểu thức, biến vào trong chuỗi: ${....}

  double diemtoan = 9.5;
  double diemvan = 7.5;
  var s3 = 'Xin chao $s1, bạn đã đặt tổng điểm là: ${diemvan+diemvan}';
  print(s3);

  //Tạo ra chuỗi nằm ở nhiều dòng
  var s4 = '''
    Dòng 1
    Dòng 2
    Dòng 3
    Dòng 4
    Dòng 5
  ''';
  var s5 = """
    Dòng kép 1
    Dòng kép 2
    Dòng kép 3
    Dòng kép 4
    Dòng kép 5
  """;

  print(s4);
  print(s5);
  var s6 = 'Đây là 1 đoạn \n Đây là 1 đoạn khác';
  print(s6);

  var s7 = r'Đây là 1$ \n Đây là 1 đoạn khác';  // raw
  print(s7);

  var s8 = "Chuỗi 1 " + "Chuỗi 2";
  print(s8);
  var s9 = "Chuỗi "
  "này "
  "là "
  "1 "
  "chuỗi ";
  print(s9);

}



