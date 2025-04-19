import 'dart:math';

class Point
{
  double? x;  //thuộc tính instance
  double? z = 0; //thuộc tính instance z, có giá trị mặc định là 0
  double? y = 0; //thuộc tính instance y, có giá trị mặc định là 0
  double? a;
  late double? b = this.z; //thuộc tính instance b, có giá trị mặc định là this.z, giá trị của this.z sẽ được gán sau khi khởi tạo đối tượng
}
