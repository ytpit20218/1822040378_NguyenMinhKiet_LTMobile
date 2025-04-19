 /*
 Stream là một chuỗi các sự kiện không đồng bộ. Nó là một cách để xử lý 
 một loạt các giá trị hoặc sự kiện theo thời gian. Streams được sử dụng 
 để xử lý dữ liệu không đồng bộ, chẳng hạn như đọc tệp, nhận yêu cầu web, 
 hoặc xử lý đầu vào của người dùng.

 Streams có thể là single-subscription hoặc broadcast. Một stream 
 single-subscription chỉ cho phép một listener tại một thời điểm, trong 
 khi một stream broadcast cho phép nhiều listener nhận cùng một sự kiện.

 Streams cung cấp các phương thức để lắng nghe sự kiện, biến đổi dữ liệu, 
 và xử lý lỗi. Chúng là một phần thiết yếu của lập trình không đồng bộ 
 trong Dart.

 Ví dụ trong cuộc sống: Hãy tưởng tượng bạn đang xem một buổi livestream 
 trên YouTube. Mỗi thông báo hoặc bình luận từ người xem là một sự kiện 
 trong stream. Bạn có thể chọn xem buổi livestream một mình (single-subscription) 
 hoặc bạn và bạn bè của bạn cùng xem buổi livestream và thảo luận với nhau 
 (broadcast).
*/

import 'dart:async';

void viduStreamDemSo()
{
  print("Tạo stream đếm số từ 1 đến 100");
  //Tạo stream đếm số (Phát ra con số từ 0 , 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100)
  Stream<int> stream = Stream.periodic(Duration(seconds: 1), (x) => (x+1)*5);
  stream = stream.take(20); //Chỉ lấy 21 số đầu tiên
  stream.listen(
    (data) {
      print(data);
    },
    onDone: () => print("Bắt đầu đi tìm"),
    onError: (error) => print("Máy lỗi rồi, nghỉ chơi thôi $error"),
  );
}

//Ví dụ về StreamController
//StreamController là một lớp trong thư viện dart:async, nó giúp tạo ra một stream và thêm sự kiện vào stream đó.
void viduStreamController() {
  // Tạo một StreamController
  final StreamController<String> controller = StreamController<String>();

  // Lắng nghe các sự kiện từ stream
  controller.stream.listen(
    (data) {
      print("Người dùng: $data");
    },
    onDone: () => print("Cuộc trò chuyện kết thúc."),
    onError: (error) => print("Có lỗi xảy ra: $error"),
  // Thêm sự kiện vào stream
  );

  print("Đang gửi tin nhắn...");
  controller.add("Xin chào!");

  // Thêm delay giữa các sự kiện
  Future.delayed(Duration(seconds: 2), () {
    print("Đang gửi tin nhắn...");
    controller.add("Bạn khỏe không?");
  });

  Future.delayed(Duration(seconds: 3), () {
    print("Đang gửi tin nhắn...");
    controller.add("Tôi đang học Dart.");
  }); // Thêm sự kiện vào stream

  // Đóng StreamController sau khi tất cả các sự kiện đã được thêm
  Future.delayed(Duration(seconds: 4), () {
    controller.close();
  });
}
void main()
{
  //viduStreamDemSo();
  viduStreamController();
}
