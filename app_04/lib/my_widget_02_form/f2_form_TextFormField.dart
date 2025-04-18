import 'package:flutter/material.dart';

class FormBasicsDemo2 extends StatefulWidget {
  @override
  _FormBasicsDemoState createState() => _FormBasicsDemoState();
}

class _FormBasicsDemoState extends State<FormBasicsDemo2>
{
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  final List<String> _cities = ['Ha Noi', 'Ho Chi Minh City'];
  final List<String> _gioitinh = ['Nam', 'Nữ'];
  bool _isConfirmPasswordVisible = false;
  String? _name;
  String? _selectedGioitinh; // Thêm biến để lưu giá trị giới tính đã chọn
  String? _email;
  String? _password;
  String? _confirmPassword;
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
                controller: _nameController,
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
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email), // Add email icon here
                ),
                controller: _emailController,
                validator: (value){
                  if(value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Regex kiểm tra định dạng email
                  RegExp regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                  if (!regex.hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,

                onSaved: (value){
                  _email = value;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter your phone number',
                  hintText: 'Enter your phone number',
                  border: OutlineInputBorder(),
                ),
                controller: _phoneController,
                validator: (value){
                  if(value == null || value.isEmpty) {
                    return 'Please enter your phone';
                  }
                  if (value.length < 10 || value.length > 11) {
                    return 'Phone must be at least 10 characters and no more 11 characters';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter your password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                controller: _passwordController,
                obscureText: !_isPasswordVisible, // Đảo ngược giá trị của _isPasswordVisible để ẩn/hiện password
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  // if (!RegExp(r'[A-Z]').hasMatch(value)) {
                  //   return 'Password must contain at least one uppercase letter';
                  // }
                  // if (!RegExp(r'[a-z]').hasMatch(value)) {
                  //   return 'Password must contain at least one lowercase letter';
                  // }
                  // if (!RegExp(r'[0-9]').hasMatch(value)) {
                  //   return 'Password must contain at least one digit';
                  // }
                  // if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                  //   return 'Password must contain at least one special character';
                  // }
                  return null;
                },
                onSaved: (value) {
                  _password = value;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm your password',
                  hintText: 'Confirm your password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                ),
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                onSaved: (value) {
                  _confirmPassword = value;
                },
              ),






              SizedBox(height: 20),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: "Thanh Pho",
                  border: OutlineInputBorder(),
                ),
                items: _cities.map((city) {
                  return DropdownMenuItem(
                    child: Text(city),
                    value: city,
                  );
                }).toList(), // Chú ý dấu ngoặc tròn này
                onChanged: (value) {
                  // Logic xử lý khi người dùng chọn một giá trị
                  print(value);
                },
              ),
              SizedBox(height: 20),
              //Radio button
              Row(
                children: _gioitinh.map((gioitinh) {
                  return Expanded( // Sử dụng Expanded để các widget con chia đều không gian
                    child: RadioListTile<String>(
                      title: Text(gioitinh),
                      value: gioitinh,
                      groupValue: _selectedGioitinh,
                      onChanged: (value) {
                        setState(() {
                          _selectedGioitinh = value;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Để các nút vào giữa
                children: [
                  ElevatedButton(onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Xin chào $_name, email: $_email')));
                    } else {
                      // Trường hợp form không hợp lệ, thông báo
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Dữ liệu không hợp lệ')));
                    }
                  }, child: Text('Submit')),
                  SizedBox(width: 20),
                  ElevatedButton(onPressed: (){
                    _formKey.currentState!.reset();
                    _nameController.clear();
                    _emailController.clear();
                    _passwordController.clear();
                    _confirmPasswordController.clear();
                    _cities.clear();
                  }, child: Text('Reset')),
                ],)
            ],
          ),
        ),
      ),
    );
  }
}