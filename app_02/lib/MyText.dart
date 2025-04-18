import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    // Tra ve Scaffold - widget cung cap bo cuc Material Design co ban

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: Text('App số 2'), //Tiêu đề
          backgroundColor: Colors.blue, //Màu Nền
          //Do nang/ do bong cua appbar
          elevation: 4,
          actions: [
            IconButton(
              onPressed: () {
                print("B1");
              },
              icon: Icon(Icons.more_vert),
            ),
            IconButton(
              onPressed: () {
                print("B2");
              },
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                print("B3");
              },
              icon: Icon(Icons.abc),
            ),
          ],
        ),
        body: Center(child: Column(
            children: [
              //Tao 1 khoang cach
              const SizedBox(height: 20,),
              const Text("Nguyen Minh Kiet"),
              const SizedBox(height: 10,),
              const Text(
                "Flutter là một SDK phát triển ứng dụng di động nguồn mở được tạo ra bởi Google. Nó được sử dụng để phát triển ứng ứng dụng cho Android và iOS, cũng là phương thức chính để tạo ứng dụng cho Google Fuchsia.",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink,
                  letterSpacing: 1.5,
                ),
              ),
              const Text(
                "Flutter là một SDK phát triển ứng dụng di động nguồn mở được tạo ra bởi Google. Nó được sử dụng để phát triển ứng ứng dụng cho Android và iOS, cũng là phương thức chính để tạo ứng dụng cho Google Fuchsia.",
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),


            ]
          //text co ban

        ),),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Pressed");
          },
          child: const Icon(Icons.ice_skating),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang Chủ"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm Kiếm"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá Nhân"),
          ],
        ),
      ),
    );
  }
}
