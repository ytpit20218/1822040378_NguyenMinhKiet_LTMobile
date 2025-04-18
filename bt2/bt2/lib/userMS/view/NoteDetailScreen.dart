import 'package:bt2/userMS/model/Note.dart';
import 'package:bt2/userMS/view/EditNoteScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteDetailScreen extends StatefulWidget {
  final Note note;

  const NoteDetailScreen({Key? key, required this.note}) : super(key: key);

  @override
  _NoteDetailScreenState createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  bool _isEditing = false;
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late TextEditingController _tagsController; // Quản lý tags như chuỗi tạm thời

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.content);
    _tagsController = TextEditingController(
        text: widget.note.tags?.join(', ') ?? ""); // Hiển thị tags dưới dạng chuỗi tạm thời
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveChanges() {
    setState(() {
      widget.note.title = _titleController.text;
      widget.note.content = _contentController.text;

      // Cập nhật danh sách tags từ chuỗi người dùng nhập
      widget.note.tags = _tagsController.text
          .split(',')
          .map((tag) => tag.trim())
          .toList(); // Tách chuỗi thành danh sách các chuỗi

      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Chỉnh sửa Note' : 'Chi tiết Note'),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              if (!_isEditing) {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => EditNoteScreen(note: widget.note)
                ));
              } else {
                _toggleEditing();
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow(
                      'Tiêu đề',
                      _isEditing,
                      _titleController,
                      widget.note.title,
                    ),
                    const Divider(),
                    _buildDetailRow(
                      'Nội dung',
                      _isEditing,
                      _contentController,
                      widget.note.content,
                    ),
                    const Divider(),
                    _buildTagEditor(
                      'Tags',
                      _isEditing,
                      _tagsController,
                      widget.note.tags ?? [],
                    ),
                    const Divider(),
                    _buildDetailRow(
                      'Ngày tạo',
                      false,
                      null,
                      DateFormat('dd/MM/yyyy').format(widget.note.createdAt),
                    ),
                    const Divider(),
                    _buildDetailRow(
                      'Ngày cập nhật',
                      false,
                      null,
                      DateFormat('dd/MM/yyyy').format(widget.note.modifiedAt),
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

  Widget _buildDetailRow(String label, bool isEditing,
      TextEditingController? controller, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          if (isEditing && controller != null)
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: label,
                border: const OutlineInputBorder(),
              ),
            )
          else
            Text(
              value,
              style: const TextStyle(fontSize: 16),
            ),
        ],
      ),
    );
  }

  Widget _buildTagEditor(
      String label, bool isEditing, TextEditingController controller, List<String> tags) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          if (isEditing)
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Nhập tags, cách nhau bởi dấu phẩy',
                border: OutlineInputBorder(),
              ),
            )
          else
            Wrap(
              spacing: 8,
              children: tags
                  .map((tag) => Chip(
                label: Text(tag),
                backgroundColor: Colors.blue.shade100,
              ))
                  .toList(),
            ),
        ],
      ),
    );
  }
}
