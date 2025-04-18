import 'package:flutter/material.dart';
import '../model/Note.dart'; // Import lớp Note
import '../db/NoteDatabaseHelper.dart'; // Import lớp NoteDatabaseHelper

class NoteForm extends StatefulWidget {
  final Note? note; // Null nếu tạo mới, không null nếu chỉnh sửa
  final Function(Note note) onSave;

  const NoteForm({
    Key? key,
    this.note,
    required this.onSave,
  }) : super(key: key);

  @override
  _NoteFormState createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _tagsController = TextEditingController(); // Xử lý tags như chuỗi
  int _priority = 1; // Mức độ ưu tiên mặc định là thấp
  String? _selectedColor;
  bool _isLoading = false;

  final List<String> _availableColors = [
    "#FF7043", // Cam
    "#FFEE58", // Vàng
    "#66BB6A", // Xanh lá
    "#42A5F5", // Xanh dương
    "#AB47BC", // Tím
  ];

  @override
  void initState() {
    super.initState();
    // Nếu đang chỉnh sửa, điền dữ liệu ghi chú
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
      _tagsController.text = widget.note!.tags?.join(', ') ?? ""; // Chuyển danh sách tags thành chuỗi
      _priority = widget.note!.priority;
      _selectedColor = widget.note!.color;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Tách chuỗi tags thành danh sách
      final tags = _tagsController.text
          .split(',')
          .map((tag) => tag.trim())
          .where((tag) => tag.isNotEmpty)
          .toList();

      final note = Note(
        id: widget.note?.id,
        title: _titleController.text,
        content: _contentController.text,
        priority: _priority,
        color: _selectedColor,
        tags: tags, // Gán danh sách tags
        createdAt: widget.note?.createdAt ?? DateTime.now(), // Use current date if no existing value
        modifiedAt: DateTime.now(), // Set the last modification time to now
      );

      widget.onSave(note);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.note != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Cập nhật ghi chú' : 'Thêm ghi chú mới'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Trường nhập tiêu đề
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Tiêu đề',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.title),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tiêu đề';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Trường nhập nội dung
              TextFormField(
                controller: _contentController,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Nội dung',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.text_snippet),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập nội dung';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Trường nhập tags
              TextFormField(
                controller: _tagsController,
                decoration: InputDecoration(
                  labelText: 'Tags',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.tag),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tags';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),
              // Lựa chọn mức độ ưu tiên
              _buildPriorityDropdown(),
              SizedBox(height: 24),

              // Chọn màu
              _buildColorPicker(),
              SizedBox(height: 24),

              // Nút lưu
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(
                    isEditing ? 'CẬP NHẬT' : 'THÊM MỚI',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Dropdown chọn mức độ ưu tiên
  Widget _buildPriorityDropdown() {
    return DropdownButtonFormField<int>(
      value: _priority,
      decoration: InputDecoration(
        labelText: 'Mức độ ưu tiên',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.priority_high),
      ),
      items: [
        DropdownMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(Icons.arrow_downward, color: Colors.green),
              SizedBox(width: 10),
              Text('Thấp'),
            ],
          ),
        ),
        DropdownMenuItem(
          value: 2,
          child: Row(
            children: [
              Icon(Icons.arrow_forward, color: Colors.orange),
              SizedBox(width: 10),
              Text('Trung bình'),
            ],
          ),
        ),
        DropdownMenuItem(
          value: 3,
          child: Row(
            children: [
              Icon(Icons.arrow_upward, color: Colors.red),
              SizedBox(width: 10),
              Text('Cao'),
            ],
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          _priority = value!;
        });
      },
    );
  }

  // Bộ chọn màu
  Widget _buildColorPicker() {
    return DropdownButtonFormField<String>(
      value: _selectedColor,
      decoration: InputDecoration(
        labelText: 'Chọn màu sắc',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.color_lens),
      ),
      items: _availableColors.map((color) {
        return DropdownMenuItem<String>(
          value: color,
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                color: Color(int.parse("0xFF${color.substring(1)}")),
              ),
              SizedBox(width: 10),
              Text(color),
            ],
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedColor = value!;
        });
      },
    );
  }
}
