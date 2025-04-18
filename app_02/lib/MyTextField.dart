import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

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

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Họ và Tên",
                    hintText: "Nhập tên của bạn",
                    labelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),

                    prefixIcon: Icon(Icons.person),
                    suffixIcon: Icon(Icons.check),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Nhập email của bạn",
                    labelText: "Email",
                    helperText: "Nhập email của bạn",
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.clear),
                    filled: true,
                    fillColor: Colors.blue,
                    labelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Nhập mật khẩu của bạn",
                    labelText: "Mật khẩu",
                    labelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                  obscureText: true,
                  obscuringCharacter: "*",
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Nhập số điện thoại của bạn",
                    labelText: "Số điện thoại",
                    labelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.phone),
                    suffixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 10),
                TextField(
                  onChanged: (value) {
                    print(value);
                  },
                  onSubmitted: (value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Nhap cau hoi bao mat",
                    labelText: "Cau hoi bao mat",
                    labelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.location_on),
                    suffixIcon: Icon(Icons.location_on),
                  ),
                )
              ],
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
