import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

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
        body: Center(child: Text("Nội dung chính")),
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
