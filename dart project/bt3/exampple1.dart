import 'dart:ffi';

void main()
{
  /*ĐỊNH NGHĨA:
  LIST là tập hợp các phần tử có thứ tự và có thể trùng lặp
  Các phần tử được truy cập bằng chỉ số (index) từ 0
  Kích thước có thể thay đổi
  */
  List<String> list1 = ['A', 'B', 'C']; //Trực tiếp
  var list2 = [1,2,3];  //Sử dụng var
  List<String> list3 = [];  //List rỗng
  var list4 = List<int>.filled(3,0); //List có kích thước cố định gen ra 3 số 0
  print(list4);

  // 1. Thêm phần tử 
  list1.add('D'); //Thêm 1 phần tử
  list1.addAll(['A', 'B']);
  list1.insert(0, 'Z');       //Chèn vào vị trí số 0 chữ Z
  list1.insertAll(1, ['1', '0']);  //Chèn nhiều phần tử
  list1.remove('A');  //Xóa phần tử có giá trị A 
  list1.removeAt(2);  //Xóa phần tử ở vị trí số 2
  list1.removeLast();  //Xóa phần tử ở vị trí cuối
  list1.removeWhere((e)=>e=='B');  //Xóa theo điều kiện
  list1.clear();
  print(list1);

  // 3. Truy cập phần tử:
  print(list2[0]);    //Lấy phần tử tại vị trí 0
  print(list2.first);   //Lấy phần tử tại vị trí đầu
  print(list2.last);   //Lấy phần tử tại vị trí cuối
  print(list2.length);  //Lấy độ dài của list

  // 4. Kiểm tra:
  print(list2.isEmpty); //List này bị rỗng không
  print('List 3: ${list3.isNotEmpty?'Không rỗng':'Rỗng'}');   //List đó không rỗng hay không, nếu không xuất ra không rỗng, nếu có thì xuất ra chữ Rỗng
  print(list4.contains(1));     //List đó có phần tử đó hay không
  print(list4.lastIndexOf(0));

  // 5. Biến đổi
  list4 = [2, 1, 3, 9, 0, 10];
  print(list4);
  list4.sort();   //Sắp xếp tăng dần
  print(list4);
  print(list4.reversed);   //Sắp xếp giảm dần
  list4 = list4.reversed.toList();
  print(list4);

  // 6. Cắt và nối
  var sublist = list4.sublist(1,3);   //Cắt một sublist từ 1 đến bé hơn 3
  print(sublist);
  var srt_joined = list4.join(',');
  print(srt_joined);

  // 8. Duyệt các phần tử bên trong list
  list4.forEach((element)
  {
    print(element);
  }
  );
}
