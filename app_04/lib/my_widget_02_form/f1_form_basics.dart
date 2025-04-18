import 'package:flutter/material.dart';

class FormBasicsDemo extends StatefulWidget {
  @override
  _FormBasicsDemoState createState() => _FormBasicsDemoState();
}

class _FormBasicsDemoState extends State<FormBasicsDemo>
{
  String? _name;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Basics'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        //Form là widget chứa và quanr lý các TextFormField
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter your username',
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value){
                  _name = value;
                },
              ),
              SizedBox(height: 20),
              Row( // sử dụng Row để sắp xếp các nút trên cùng một hàng ngang
                mainAxisAlignment: MainAxisAlignment.center, // Để các nút vào giữa
                children: [
                  ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()){  //Kiểm tra xem form đã được validate chưa
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Xin chào $_name Say Gex')));
                    }else {
                      // Trường hợp form không hợp lệ
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Dữ liệu không hợp lệ')));
                    }
                  }, child: Text('Submit')),
                  SizedBox(width: 20),
                  ElevatedButton(onPressed: (){
                    _formKey.currentState!.reset();
                    setState(() {
                      _name = null;
                    });
                  }, child: Text('Reset')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}