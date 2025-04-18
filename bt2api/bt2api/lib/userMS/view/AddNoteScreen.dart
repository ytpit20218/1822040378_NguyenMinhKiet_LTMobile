import 'package:bt2/userMS/db/NoteDatabaseHelper.dart';
import 'package:bt2/userMS/model/Note.dart';
import 'package:bt2/userMS/view/NoteForm.dart';
import 'package:flutter/material.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoteForm(
      onSave: (Note note) async {
        if (note.tags != null) {
          if (note.tags is! List<String>) {
            note.tags = [note.tags.toString()];
          }
        }
        try {
          await NoteDatabaseHelper.instance.insertNote(note);
          Navigator.pop(context, true); // Return true to indicate a new user was added

          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Thêm Note thành công'),
              backgroundColor: Colors.green,
            ),
          );
        } catch (e) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Lỗi khi thêm Note: $e'),
              backgroundColor: Colors.red,
            ),
          );
          //Navigator.pop(context, false); khong can pop ra nua vi minh muon giu ng dung o man hinh de sua loi
        }
      },
    );
  }
}