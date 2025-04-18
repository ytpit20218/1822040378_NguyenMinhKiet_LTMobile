import 'package:flutter/material.dart';
import '../db/NoteDatabaseHelper.dart'; // Đường dẫn đến lớp NoteDatabaseHelper
import '../model/Note.dart'; // Đường dẫn đến lớp Note
import 'AddNoteScreen.dart'; // Đường dẫn đến màn hình thêm ghi chú
import 'EditNoteScreen.dart'; // Đường dẫn đến màn hình chỉnh sửa ghi chú
import 'NoteListItem.dart'; // Đường dẫn đến widget hiển thị một ghi chú
import 'LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteListScreen extends StatefulWidget {
  final Function? onLogout; // Chỉnh sửa: Cho phép onLogout là null

  NoteListScreen({this.onLogout});

  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  late Future<List<Note>> _notesFuture;

  @override
  void initState() {
    super.initState();
    _refreshNotes();
  }

  // Làm mới danh sách ghi chú
  Future<void> _refreshNotes() async {
    setState(() {
      _notesFuture = NoteDatabaseHelper.instance.getAllNotes();
    });
  }

  // Thêm phương thức xử lý đăng xuất trực tiếp trong class này
  Future<void> _handleLogout() async {
    // Xóa dữ liệu người dùng
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Kiểm tra xem widget có còn được gắn kết không
    if (!mounted) return;

    // Điều hướng trở lại màn hình đăng nhập và xóa tất cả các màn hình trước đó
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách ghi chú'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshNotes, // Làm mới danh sách khi nhấn nút
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                _showLogoutDialog();
              }
            },
            itemBuilder: (ctx) => [
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.exit_to_app, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Đăng xuất'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder<List<Note>>(
        future: _notesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Hiển thị vòng tròn chờ
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Hiển thị thông báo lỗi nếu có lỗi
            return Center(
              child: Text('Đã xảy ra lỗi: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Hiển thị khi không có ghi chú
            return const Center(
              child: Text('Không có ghi chú nào.'),
            );
          } else {
            // Hiển thị danh sách ghi chú
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final note = snapshot.data![index];
                return NoteListItem(
                  note: note,
                  onDelete: () async {
                    // Xử lý xóa ghi chú
                    await NoteDatabaseHelper.instance.deleteNote(note.id!);
                    _refreshNotes();
                  },
                  onEdit: () async {
                    // Chuyển sang màn hình chỉnh sửa ghi chú
                    final updated = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditNoteScreen(note: note),
                      ),
                    );
                    if (updated == true) {
                      _refreshNotes();
                    }
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          // Chuyển sang màn hình thêm ghi chú
          final created = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNoteScreen(),
            ),
          );
          if (created == true) {
            _refreshNotes();
          }
        },
      ),
    );
  }
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Xác nhận đăng xuất'),
        content: Text('Bạn có chắc chắn muốn đăng xuất?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();

              // Ưu tiên sử dụng hàm xử lý đăng xuất trong class này
              // Nếu widget.onLogout được cung cấp, gọi nó sau khi xử lý đăng xuất
              _handleLogout().then((_) {
                if (widget.onLogout != null) {
                  widget.onLogout!();
                }
              });
            },
            child: Text(
              'Đăng xuất',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
