import 'package:flutter/material.dart';

class MyGestures extends StatefulWidget {
  const MyGestures({super.key});

  @override
  State<MyGestures> createState() => _MyGesturesState();
}

class _MyGesturesState extends State<MyGestures> {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App số 2'),
          backgroundColor: Colors.blue,
          elevation: 4,
        ),
        body: const Center( // Center widget giúp căn giữa nội dung bên trong
          child: ChillWidget() // Hiển thị widget ChillWidget
        ),
      ),
    );
  }
}

class ChillWidget extends StatelessWidget {
  const ChillWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { // Sự kiện khi người dùng nhấn vào widget
        print("onTap");
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text("Da click vao widget!"),
                duration: const Duration(milliseconds: 1000),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    print("Da click nut Undo!");
                  },
                ),
              ));
      },
      onDoubleTap: () { // Sự kiện khi người dùng nhấn đúp vào widget
        print("onDoubleTap");
      },
      onLongPress: () { // Sự kiện khi người dùng nhấn giữ vào widget
        print("onLongPress");
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.red, // Màu nền của widget
          borderRadius: BorderRadius.circular(20), // Thêm bo tròn góc
          boxShadow: const [BoxShadow(color: Colors.grey, spreadRadius: 4, blurRadius: 10, offset: Offset(0, 3))],
        ),
        child: const SizedBox(
            width: 200,
            height: 200,
            child: Center(child: Text("Hello"))),
        ),
      );
  }
}
