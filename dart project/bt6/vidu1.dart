import "dart:async";

/*
Future

Gọi 1 món ăn ở nhà hàng:

+ Bạn đặt món (Gọi một hàm)
+ Nhân viên phục vụ nói "Vâng, tôi sẽ mang món ăn đến sau" nhận về 1 future (Kết quả trả về của hàm)
+ Bạn có thể làm những việc khác trong khi chờ món ăn (Thực hiện các công việc khác)
+ Khi món ăn đã được mang đến, bạn sẽ nhận được món ăn (Kết quả trả về của future)

Future là một giá trị mà bạn sẽ nhận được sau khi một hàm hoàn thành. Future có thể trả về một giá trị hoặc một lỗi.
Đó là 1 cách làm việc với các tác vụ mất thời gian trong Dart mà không phải chờ đợi.
(VD: tải dữ liệu từ internet, đọc dữ liệu từ file, ghi dữ liệu vào file, thực hiện các tác vụ mất thời gian khác.)

Hiểu rõ về async await:
- async: Đánh dấu hàm chứa await. Hàm đó sẽ trả về một Future. (Chứa code bất đồng bộ)
- await: Chờ đợi cho đến khi Future hoàn thành và tiếp tục những dòng code còn lại. await chỉ có thể được sử dụng trong hàm được đánh dấu bởi async.
*/

Future<String> layten() async 
{
  return "Nguyen Van A";
}
Future<String> laytenvachobagiay() async 
{
  await Future.delayed(Duration(seconds: 3)); // Giả lập việc lấy dữ liệu từ internet mất 3 giây
  return "Nguyen Van A";
}
Future<String> taiDuLieu() async 
{
  return Future.delayed(Duration(seconds: 3), () => "Đã tải dữ liệu"
   ); // Giả lập việc tải dữ liệu từ internet mất 3 giây    
}
//Gọi hàm chính 1
void hamchinh1() async
{
  print("Bắt đầu tải dữ liệu"); //1
  Future<String> future = taiDuLieu(); //2
  future.then((ketqua) => print("Kết quả: $ketqua"));
  print("Tiếp tục công việc khác"); //3
}
void hamchinh2() async
{
  print("Bắt đầu tải dữ liệu"); //1
  String ketqua = await taiDuLieu(); //2
  print("Kết quả: $ketqua"); //4
  print("Tiếp tục công việc khác"); //3
}
void main() 
{
  print("Start");
  Future.delayed(Duration(seconds: 3), () {
    print("Future");
  }); // Future sẽ hoàn thành sau 3 giây  (3 giây sau sẽ in ra "Future")
  print("End");
  hamchinh1();
  hamchinh2();
}
