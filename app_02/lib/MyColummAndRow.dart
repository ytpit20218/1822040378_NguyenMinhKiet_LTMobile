import 'package:flutter/material.dart';

class MyColummAndRow extends StatelessWidget {
  const MyColummAndRow({super.key});

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
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(height: 30,),
                  Icon(Icons.access_alarm_outlined),
                  Icon(Icons.ac_unit),
                  Icon(Icons.accessibility_new_rounded),
                ],
              ),
              Row(
                children: [
                  Text("Text1 .............."),
                  Text("Text2 .............."),
                  Text("Text3 .............."),
                ],
              ),
            ],
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
