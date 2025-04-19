import 'dart:math';

class Point
{
  double x, y;
  
  Point(this.x, this.y);

  double distanceTo(Point other)
  {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
  
}

void main()
{
  Point p1 = Point(0, 0);
  var p2 = Point(3, 3);
  print(p1.distanceTo(p2).toStringAsFixed(2));
  double d = p1.distanceTo(p2);
  print(d.toStringAsFixed(2));
}