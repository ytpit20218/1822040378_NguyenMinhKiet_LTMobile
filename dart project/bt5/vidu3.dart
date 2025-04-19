class Rectangle {
  double width;
  double height;
  double left;
  double top;
  late double? _z;

  Rectangle(this.width, this.height, this.left, this.top);

  Rectangle.withZ(this._z) : width = 0, height = 0, left = 0, top = 0;

  double get z => _z ?? 0;
  set z(double value) 
  {
    if (value >= 0) {
      _z = value;
    }
  }
}

class MyMath {
  static double pi = 3.14159;
  static double sqrt(double x) {
    return x * x;
  }
}

void main() {
  var rect = Rectangle(3, 4, 20, 15);
  print('width: ${rect.width}');
  print('height: ${rect.height}');
  print('left: ${rect.left}');
  print('top: ${rect.top}');
  rect.z = 10;
  print('z: ${rect.z}');
  print('pi: ${MyMath.pi}');
  print('sqrt: ${MyMath.sqrt(4)}');
  var rectWithZ = Rectangle.withZ(5);
  print('Rectangle with Z: ${rectWithZ.z}');
  
}