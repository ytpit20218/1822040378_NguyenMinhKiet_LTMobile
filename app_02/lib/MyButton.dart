import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

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
              ),
              const SizedBox(height: 20),
              // Text Button
              TextButton(
                onPressed: () {
                  // Handle button press here
                  print("Text Button Pressed");
                },
                child: const Text("Text Button"),
              ),
              const SizedBox(height: 20),
              //OutlineButton
              OutlinedButton(
                onPressed: () {
                  print("Outline Button Pressed");
                },
                child: const Text("Outline Button"),
              ),
              IconButton(
                onPressed: () {
                  print("Icon Button Pressed");
                  // Thực hiện hành động khi nút được nhấn
                },
                icon: const Icon(Icons.favorite),
              ),
              const SizedBox(height: 20),
              FloatingActionButton(onPressed: () {
                print("Floating Action Button Pressed");
              },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Pressed");
          },
          child: Icon(Icons.add),
        ),

        //Text button là 1 button phẳng

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