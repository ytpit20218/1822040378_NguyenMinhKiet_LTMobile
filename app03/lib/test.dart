import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget
{
  final String title;
  MyStatelessWidget({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}

class MyStateFulWidget extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _MyStateFulWidgetState();
}

class _MyStateFulWidgetState extends State<MyStateFulWidget>
{
  String title = "Xin chào buổi tối";
  int count = 0;
  void _updateTitle()
  {
    setState(() {
      title = "Xin chào buổi tối ${count++}";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Text(title),
          ElevatedButton(onPressed: _updateTitle, child: Text('Updated Title')),
        ],
      ),
    );
  }
}