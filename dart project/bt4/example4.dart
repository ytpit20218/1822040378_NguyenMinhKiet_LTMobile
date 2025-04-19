void main() {
  int x = 100;

  if (x is! int) {
    print("Đây không là một con số int");
  } else if (x % 2 == 0) {
    print("Đây là số chẵn");
  } else {
    print("Đây là số lẻ");
  }

  int thang = 2;
  switch (thang)
  {
    case 1:
      print("Tháng $thang là tháng có 31 ngày");
      break;
    case 2:
      print("Tháng $thang là tháng có 28 hoặc 29 ngày");
      break;
    case 3:
      print("Tháng $thang là tháng có 31 ngày");
      break;
    case 4:
      print("Tháng $thang là tháng có 30 ngày");
      break;
    case 5:
      print("Tháng $thang là tháng có 31 ngày");
      break;
    case 6: 
      print("Tháng $thang là tháng có 30 ngày");
      break;
    case 7:
      print("Tháng $thang là tháng có 31 ngày");
      break;
    case 8: 
      print("Tháng $thang là tháng có 31 ngày");
      break;
    case 9:
      print("Tháng $thang là tháng có 30 ngày");
      break;
    case 10:
      print("Tháng $thang là tháng có 31 ngày");
      break; 
    case 11:
      print("Tháng $thang là tháng có 30 ngày");
      break;
    case 12:  
      print("Tháng $thang là tháng có 31 ngày");
      break;
    default:
      print("Tháng không hợp lệ");
      break;
  }
}
