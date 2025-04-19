double tinhtong(var a, double b, double c) {
  return a + b + c;
}

double tinhtong2(var a, double b, double c) => a + b + c;

//expression là cách viết rút gọn của return expression
//expression không cần dùng từ khóa return

//Khai báo các tham số tùy chọn, ta sử dụng dấu ngoặc vuông
double sum(double a, [double? b, double? c, double? d]) {
  var result = a;
  result += (b!=null) ? b : 0;
  result += (c!=null) ? c : 0;
  result += (d!=null) ? d : 0;
  return result;
}


//Hàm ẩn danh (Hàm không tên)
//Hàm ẩn danh không có tên, không có tham số, không có giá trị trả về
var anonymousFunction = (var a, var b) {
  return a + b;
};



String createfullname({String ho = "",String chulot = "",String ten  = ""}) {
  return ho + ' ' + chulot + ' ' + ten;
}
void main() {
  print('Hello, World!');
  var x = tinhtong(1, 10, 100);
  print(x);
  var y = tinhtong2(1, 10, 101);
  print(y);
  var cfn = createfullname(ho: 'Nguyen',chulot: 'Van',ten: 'A');
  print(cfn);
  var cfn2 = createfullname(chulot: 'Van',ho: 'Nguyen',ten: 'A');
  print(cfn2);
  var cfn3 = createfullname(ten: 'A', ho: 'Nguyen');
  print(cfn3);
  print(sum(10));
  print(sum(10, 20));
  print(sum(10, 20, 30));
  print(sum(10, 20, 30, 40));

  var han = (var a, var b)
  {
    return a + b;
  };
  print(han(10, 20));
  print(anonymousFunction(10, 20));
}