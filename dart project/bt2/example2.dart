import 'dart:ffi';
import 'dart:io';

void main()
{
  //Nhập tên người dùng
  stdout.write('Nhập tên của bạn: ');
  String name = stdin.readLineSync()!;

  stdout.write('Nhập tuổi của bạn: ');
  int tuoi = int.parse(stdin.readLineSync()!);

  print("Xin chào bạn $name với số tuổi là $tuoi");
}

