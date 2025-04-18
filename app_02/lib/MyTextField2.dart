import 'package:flutter/material.dart';
class MyTextField2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyTextField2State();
}

class _MyTextField2State extends State<MyTextField2> {
  final TextEditingController _controller = TextEditingController();
  String _text = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: "Nhập thông tin",
                    hintText: "Thông tin",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _controller.clear();
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      _text = text;
                    });
                  },
                ),
                const SizedBox(height: 10),
                Text(
                  'Text: $_text',
                  style: const TextStyle(fontSize: 20),
                ),
              ],
          ),
        ),
      ),
    ),
    );
  }
}