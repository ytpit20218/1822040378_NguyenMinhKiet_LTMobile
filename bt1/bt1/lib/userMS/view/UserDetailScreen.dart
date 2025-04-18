import "dart:io";
import "package:bt1/b1/userMS/model/User.dart";
import "package:flutter/material.dart";
import "package:intl/intl.dart";

class UserDetailScreen extends StatelessWidget {
  final NguoiDungModel user;

  const UserDetailScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết người dùng'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue[100],
                backgroundImage: user.avatar?.isNotEmpty == true
                    ? FileImage(File(user.avatar!)) : null,
                child: user.avatar?.isNotEmpty == false
                    ? Text(user.ten!.isNotEmpty
                          ? user.ten!.substring(0, 1).toUpperCase()
                          : "",
                        style: const TextStyle(fontSize: 40),
                )
                    : null,
              ),
            ),
            SizedBox(height: 24),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow('Họ và tên', user.ten!),
                    Divider(),
                    _buildDetailRow('Email', user.email!),
                    const Divider(),
                    _buildDetailRow('Số điện thoại', user.SDT!),
                    const Divider(),
                     _buildDetailRow(
                      'Ngày sinh',
                      DateFormat('dd/MM/yyyy').format(user.NgaySinh),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style:  TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}