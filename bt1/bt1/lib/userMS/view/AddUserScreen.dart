import 'package:bt1/b1/userMS/db/NguoiDungDatabaseHelper.dart';
import 'package:bt1/b1/userMS/model/User.dart';
import 'package:bt1/b1/userMS/view/UserForm.dart';
import 'package:flutter/material.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserForm(
      onSave: (NguoiDungModel user) async {
        try {
          await NguoiDungDatabaseHelper.instance.TaoNguoiDung(user);
          Navigator.pop(context, true); // Return true to indicate a new user was added

          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Thêm người dùng thành công'),
              backgroundColor: Colors.green,
            ),
          );
        } catch (e) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Lỗi khi thêm người dùng: $e'),
              backgroundColor: Colors.red,
            ),
          );
          //Navigator.pop(context, false); khong can pop ra nua vi minh muon giu ng dung o man hinh de sua loi
        }
      },
    );
  }
}