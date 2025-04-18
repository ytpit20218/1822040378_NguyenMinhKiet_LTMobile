import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App số 2'),
          backgroundColor: Colors.blue,
          elevation: 4,
          actions: [
            IconButton(
              onPressed: () {
                print("More");
              },
              icon: const Icon(Icons.more_vert),
            ),
            IconButton(
              onPressed: () {
                print("Search");
              },
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                print("ABC");
              },
              icon: const Icon(Icons.abc),
            ),
          ],
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20), // Thêm bo tròn góc
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 4,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.center,
              child: const Text(
                "Nguyen Minh Kiet",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
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
