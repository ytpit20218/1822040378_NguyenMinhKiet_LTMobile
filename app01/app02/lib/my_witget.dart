import 'package:flutter/material.dart';

class MyState extends StatelessWidget {
  final String title;

  MyState({required this.title}); // Thêm dấu chấm phẩy

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text("Hello, Flutter!"), // Thêm nội dung hiển thị
      ),
    );
  }
}

// StatefulWidget
class MyStatefulWidget extends StatefulWidget {
  final String title; // Thêm biến title

  const MyStatefulWidget({Key? key, required this.title}) : super(key: key); // Constructor

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  late String title;

  @override
  void initState() {
    super.initState();
    title = widget.title; // Lấy giá trị từ widget.title
  }

  void _updateTitle() {
    setState(() {
      title = "Ngủ đi";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello, Flutter!"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateTitle,
              child: Text("Thay đổi tiêu đề"),
            ),
          ],
        ),
      ),
    );
  }
}
