import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget{
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // Tra ve Scaffold - widget cung cap bo cuc Material Design co ban

    return Scaffold(
      appBar: AppBar(
        title: Text('App số 2'),

        

      ),
        backgroundColor: Colors.pink,
        body: Center(child: Text("Nội dung chính"),),
        floatingActionButton: FloatingActionButton(onPressed: (){print("Pressed");},child: const Icon(Icons.ice_skating),),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Trang Chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Tìm Kiếm"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cá Nhân"),
      ]),

    );

  }


}