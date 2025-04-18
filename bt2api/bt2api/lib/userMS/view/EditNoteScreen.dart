import 'package:bt2/userMS/db/NoteDatabaseHelper.dart';
import 'package:bt2/userMS/model/Note.dart';
import 'package:bt2/userMS/view/NoteForm.dart';
import 'package:flutter/material.dart';

class EditNoteScreen extends StatelessWidget {
  final Note note;

  //Truyền vào note để chỉnh sửa
  const EditNoteScreen({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoteForm(
      note: note,
      onSave: (Note updatedNote) async {
        try {
          await NoteDatabaseHelper.instance.updateNote(updatedNote);
          Navigator.pop(context, true); // Return true to indicate the user was updated

          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Cập nhật Note thành công'),
              backgroundColor: Colors.green,
            ),
          );
        } catch (e) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Lỗi khi cập nhật người dùng: $e'),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.pop(context, false);
        }
      },
    );
  }
}