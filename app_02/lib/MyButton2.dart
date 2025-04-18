import 'package:flutter/material.dart';

class MyButton2 extends StatelessWidget {
  const MyButton2({super.key});

  @override
  Widget build(BuildContext context) {
    // Tra ve Scaffold - widget cung cap bo cuc Material Design co ban

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App số 2'), //Tiêu đề
          backgroundColor: Colors.blue, //Màu Nền
          //Do nang/ do bong cua appbar
          elevation: 4,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Elevated Button
              ElevatedButton(
                onPressed: () {
                  // Handle button press here
                  print("Elevated Button Pressed");
                },
                child: const Text("Elevated Button"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, //Màu nền
                  //Màu của các nội dung bên trong button
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20, //Khoảng cách
                    vertical: 15, //Khoảng cách
                  ),
                  elevation: 15, //Do nang/ do bong
                  animationDuration: Duration(seconds: 2),
                ),
                // Thêm các thuộc tính khác của ElevatedButton
              ),
              const SizedBox(height: 20),
              // Text Button
              TextButton(
                onPressed: () {
                  // Handle button press here
                  print("Text Button Pressed");
                },
                child: const Text("Text Button"),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red, //Màu chữ
                  padding: EdgeInsets.symmetric(
                    horizontal: 20, //Khoảng cách
                    vertical: 10, //Khoảng cách
                  ), //Khoảng cách
                ),
              ),
              const SizedBox(height: 20),
              //OutlineButton
              OutlinedButton(
                onPressed: () {
                  print("Outline Button Pressed");
                },
                child: const Text("Outline Button"),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20, //Khoảng cách
                    vertical: 30, //Khoảng cách
                  ), //Khoảng cách
                  side: BorderSide(
                    color: Colors.blue, //Màu viền
                    width: 2, //Độ rộng viền
                  ),
                  animationDuration: Duration(seconds: 2),
                ),
              ),
              IconButton(
                onPressed: () {
                  print("Icon Button Pressed");
                  // Thực hiện hành động khi nút được nhấn
                },
                icon: const Icon(Icons.favorite),
              ),
              const SizedBox(height: 20),
              FloatingActionButton(
                onPressed: () {
                  print("Floating Action Button Pressed");
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  print("InkWell Pressed");
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                  ),
                  child: const Text(
                    "InkWell",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Pressed");
          },
          child: const Icon(Icons.add),
        ),

        //Text button là 1 button phẳng
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang Chủ"),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Tìm Kiếm",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá Nhân"),
          ],
        ),
      ),
    );
  }
}
